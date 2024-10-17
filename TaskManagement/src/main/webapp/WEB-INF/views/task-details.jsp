<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task Details</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            background: #f4f4f9;
            color: #333;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #4a90e2;
            margin-bottom: 20px;
        }

        .task-details {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }

        .task-details p {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .task-details strong {
            color: #4a90e2;
        }

        a {
            display: inline-block;
            text-decoration: none;
            color: white;
            background: #4a90e2;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        a:hover {
            background: #357ABD;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }

            .task-details {
                padding: 15px;
            }

            h1 {
                font-size: 24px;
            }

            .task-details p {
                font-size: 16px;
            }

            a {
                padding: 8px 12px;
            }
        }

        @media (max-width: 480px) {
            .task-details p {
                font-size: 14px;
            }

            a {
                padding: 6px 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="task-details">
        <h1>Task Details</h1>
        <p><strong>Title:</strong> ${task.title}</p>
        <p><strong>Description:</strong> ${task.description}</p>
        <p><strong>Status:</strong> ${task.status}</p>
        <p><strong>Priority:</strong> ${task.priority}</p>
        <p><strong>Due Date:</strong> ${task.dueDate}</p>
        <a href="/tasks">Back to Task List</a>
    </div>
</body>
</html>
