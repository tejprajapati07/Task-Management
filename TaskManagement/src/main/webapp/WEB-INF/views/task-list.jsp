<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task List</title>
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
            background-color: #f4f6f9;
            padding: 20px;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #4a90e2;
            margin-bottom: 20px;
        }

        .task-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .task-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .task-card:hover {
            transform: translateY(-5px);
        }

        .task-card h2 {
            color: #333;
            font-size: 1.4rem;
            margin-bottom: 10px;
        }

        .task-card p {
            font-size: 1rem;
            color: #666;
            margin: 5px 0;
        }

        .task-card .actions {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
        }

        .task-card .actions a {
            text-decoration: none;
            color: white;
            background-color: #4a90e2;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            display: inline-block;
        }

        .task-card .actions a:hover {
            background-color: #357ABD;
        }

        .task-card .actions a i {
            margin-right: 5px;
        }

        .create-task-link {
            display: inline-block;
            background-color: #4a90e2;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-bottom: 20px;
            display: block;
            text-align: center;
        }

        .create-task-link:hover {
            background-color: #357ABD;
        }

        /* Additional styles for task cards based on status */
        .task-card.completed {
            background-color: #d4edda; /* Green for completed tasks */
            border-left: 6px solid #28a745;
        }

        .task-card.in-progress {
            background-color: #fff3cd; /* Yellow for tasks in progress */
            border-left: 6px solid #ffc107;
        }

        .task-card.overdue {
            background-color: #f8d7da; /* Light red for overdue tasks */
            border-left: 6px solid #dc3545;
        }
    </style>
</head>
<body>

    <h1>Task List</h1>
    <a href="/tasks/new" class="create-task-link"><i class="fas fa-plus"></i> Create New Task</a>

    <div class="task-container">
        <c:forEach var="task" items="${tasks}">
            <div class="task-card 
                <c:if test="${task.status == 'COMPLETED'}">completed</c:if>
                <c:if test="${task.status == 'IN_PROGRESS'}">in-progress</c:if>
                <c:if test="${task.dueDate != null && task.dueDate < currentDate}">overdue</c:if>">
                <h2>${task.title}</h2>
                <p><strong>Description:</strong> ${task.description}</p>
                <p><strong>Status:</strong> ${task.status}</p>
                <p><strong>Priority:</strong> ${task.priority}</p>
                <p><strong>Due Date:</strong> ${task.dueDate}</p>

                <div class="actions">
                    <a href="/tasks/edit/${task.id}"><i class="fas fa-edit"></i> Edit</a>
                    <a href="/tasks/${task.id}"><i class="fas fa-eye"></i> View</a>
                    <a href="/tasks/delete/${task.id}"><i class="fas fa-trash-alt"></i> Delete</a>
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
