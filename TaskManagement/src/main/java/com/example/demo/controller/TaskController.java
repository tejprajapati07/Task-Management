package com.example.demo.controller;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Task;
import com.example.demo.service.TaskService;

@Controller
@RequestMapping("/tasks")
public class TaskController {

    @Autowired
    private TaskService taskService;

    // Display all tasks sorted by priority (lowest priority first)
    @GetMapping
    public String getAllTasks(Model model) {
        List<Task> sortedTasks = taskService.getAllTasks().stream()
            .sorted(Comparator.comparingInt(Task::getPriority)) // Sort in ascending order
            .collect(Collectors.toList());

        model.addAttribute("tasks", sortedTasks);
        model.addAttribute("currentDate", LocalDate.now());
        return "task-list";
    }

    // Show task creation form
    @GetMapping("/new")
    public String createTaskForm(Model model) {
        model.addAttribute("task", new Task());
        return "task-form";
    }

    // Save or update task
    @PostMapping
    public String saveOrUpdateTask(@ModelAttribute Task task) {
        taskService.saveTask(task);  // Save the task, updating if it has an ID
        return "redirect:/tasks";
    }

    // Show task update form
    @GetMapping("/edit/{id}")
    public String editTaskForm(@PathVariable Long id, Model model) {
        Task task = taskService.getTaskById(id).orElseThrow(() -> new IllegalArgumentException("Invalid task Id:" + id));
        model.addAttribute("task", task);
        return "task-form";
    }

    // View task details
    @GetMapping("/{id}")
    public String viewTaskDetails(@PathVariable Long id, Model model) {
        Task task = taskService.getTaskById(id).orElseThrow(() -> new IllegalArgumentException("Invalid task Id:" + id));
        model.addAttribute("task", task);
        return "task-details";
    }

    // Delete a task
    @GetMapping("/delete/{id}")
    public String deleteTask(@PathVariable Long id) {
        taskService.deleteTask(id);
        return "redirect:/tasks";
    }
}
