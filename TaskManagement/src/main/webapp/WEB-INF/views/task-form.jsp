<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${task.id != null ? 'Edit Task' : 'Create Task'}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            padding: 20px;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #4a90e2;
            margin-bottom: 20px;
        }

        .task-form-container {
            max-width: 600px;
            background: #fff;
            padding: 20px;
            margin: 0 auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .task-form-container label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        .task-form-container input,
        .task-form-container textarea,
        .task-form-container select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .task-form-container input[type="submit"] {
            background-color: #4a90e2;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .task-form-container input[type="submit"]:hover {
            background-color: #357ABD;
        }

        .back-link {
            display: inline-block;
            background-color: #4a90e2;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            margin-top: 20px;
            display: block;
            text-align: center;
        }

        .back-link:hover {
            background-color: #357ABD;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .task-form-container {
                padding: 15px;
            }
        }
    </style>
</head>
<body>

    <h1>${task.id != null ? 'Edit' : 'Create'} Task</h1>

    <div class="task-form-container">
        <form action="/tasks" method="post">
            <input type="hidden" name="id" value="${task.id}" />

            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${task.title}" required/>

            <label for="description">Description:</label>
            <textarea id="description" name="description" required>${task.description}</textarea>

            <label for="status">Status:</label>
            <select id="status" name="status">
                <option value="IN_PROGRESS" ${task.status == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
                <option value="COMPLETED" ${task.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
            </select>

            <label for="priority">Priority:</label>
            <input type="number" id="priority" name="priority" value="${task.priority}" required/>

            <label for="dueDate">Due Date:</label>
            <input type="date" id="dueDate" name="dueDate" value="${task.dueDate}" required/>

            <input type="submit" value="${task.id != null ? 'Update' : 'Create'} Task"/>
        </form>

        <a class="back-link" href="/tasks">Back to Task List</a>
    </div>

</body>
</html>
