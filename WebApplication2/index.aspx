<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication2.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone 3</title>
    <!-- Link to local Bootstrap CSS from the wwwroot/lib folder -->
    <link href="~/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f7fc;
            font-family: 'Arial', sans-serif;
            padding-top: 30px;
        }

        h2 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .section-title {
            background-color: #007bff;
            color: white;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            font-size: 1.25rem;
        }

        .list-group-item {
            transition: background-color 0.3s ease;
            border-radius: 5px;
            padding: 10px 15px;
        }

        .list-group-item:hover {
            background-color: #007bff;
            color: white;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .row {
            margin-top: 30px;
        }

        .col-md-6 {
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card {
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
        }

        .card-body {
            background-color: #f9f9f9;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #0056b3;
        }

        .task-list li a {
            color: #007bff;
            text-decoration: none;
        }

        .task-list li a:hover {
            text-decoration: underline;
        }

        .footer {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 15px;
            border-radius: 5px;
            margin-top: 30px;
            font-size: 0.875rem;
        }

        @media (max-width: 768px) {
            .col-md-6 {
                margin-bottom: 20px;
            }

            .container {
                margin-top: 20px;
                padding-left: 15px;
                padding-right: 15px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Milestone 3 in the center -->
        <div class="text-center">
            <h2>Project Manager</h2>
            <p class="lead">Project Management Dashboard</p>
        </div>

        <!-- Basic Webform Section -->
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="section-title">Basic Webform</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="/Project.aspx">Project</a></li>
                             <li class="list-group-item"><a href="/milestone.aspx">Milestone</a></li>
                                                         <li class="list-group-item"><a href="/User.aspx">User</a></li>


                            <li class="list-group-item"><a href="/Resources.aspx">Resource</a></li>
                            <li class="list-group-item"><a href="/Subtask.aspx">Subtask</a></li>
                            <li class="list-group-item"><a href="/Task.aspx">Task</a></li>
                            <li class="list-group-item"><a href="/Comment.aspx">Comment</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Complex Webform Section -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="section-title">Complex Webform</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="/Task1.aspx">Task 1</a></li>
                            <li class="list-group-item"><a href="/Task2.aspx">Task 2</a></li>
                            <li class="list-group-item"><a href="/Task3.aspx">Task 3</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <!-- Bootstrap JS and dependencies -->
    <script src="~/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
