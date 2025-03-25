<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task3.aspx.cs" Inherits="WebApplication2.Task3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task 3: Top Users by Task Count</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJ6V7e3bFAMp2y1pXw6E8H8g13cTOHmz6o72GtbfWFOwW0lPaRLugK1nC6L6" crossorigin="anonymous">
    
    <!-- Custom CSS -->
<style>
    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(to right, #6a11cb, #2575fc); /* Gradient background */
        margin-top: 20px;
    }

    .container {
        margin-top: 30px;
        background-color: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .form-control, .btn {
        margin-bottom: 15px;
    }

    .form-group label {
        font-weight: bold;
        color: #495057;
    }

    .grid-container {
        margin-top: 30px;
    }

    .table-striped th, .table-striped td {
        text-align: center;
    }

    .table th, .table td {
        vertical-align: middle;
    }

    /* Add hover effect to GridView rows */
    .table-striped tbody tr:hover {
        background-color: #f1f1f1;
    }

    /* Button Styles */
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
    }

    .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
    }

    .btn-secondary:hover {
        background-color: #5a6268;
        border-color: #4e555b;
    }

    /* Table header styling */
    .table th {
        background-color: #007bff;
        color: white;
        font-weight: bold;
    }

    /* Adjust table borders */
    .table-bordered th, .table-bordered td {
        border: 1px solid #dee2e6;
    }

    /* Customize the dropdown and select controls */
    .form-control {
        border-radius: 5px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 20px;
    }

    /* Page title styling */
    .page-title {
        font-size: 28px;
        font-weight: bold;
        color: #333;
        margin-bottom: 30px;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Page Title -->
            <div class="page-title">Task 3: Top Users by Task Count</div>

            <!-- SqlDataSource2 for Project Dropdown -->
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECT&quot;"></asp:SqlDataSource>
            
            <!-- Dropdown list for selecting project -->
            <div class="form-group">
                <label for="DropDownList1">Select Project</label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" DataValueField="PROJECTID" AutoPostBack="True" CssClass="form-control">
                </asp:DropDownList>
            </div>

            <!-- SqlDataSource1 for Top Users by Task Count -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM (
    SELECT 
        u.USERID, 
        u.USERNAME,
        u.USEREMAIL,
        u.USERCONTACT,
        COUNT(ptu.TASK_ID) AS TASK_COUNT
    FROM &quot;User&quot; u
    JOIN PROJECT_TASK_USER ptu ON u.USERID = ptu.USER_ID
    JOIN PROJECT p ON ptu.PROJECT_ID = p.PROJECTID
    JOIN TASK t ON ptu.TASK_ID = t.TASKID
    WHERE p.PROJECTID = :ProjectID
    AND p.STATUS != 'pending'
    GROUP BY u.USERID, u.USERNAME, u.USEREMAIL, u.USERCONTACT 
    ORDER BY TASK_COUNT DESC
)
WHERE ROWNUM &lt;= 3
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="ProjectID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <!-- GridView for displaying top users -->
            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USEREMAIL" HeaderText="USEREMAIL" SortExpression="USEREMAIL" />
                        <asp:BoundField DataField="USERCONTACT" HeaderText="USERCONTACT" SortExpression="USERCONTACT" />
                        <asp:BoundField DataField="TASK_COUNT" HeaderText="TASK_COUNT" SortExpression="TASK_COUNT" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybA8kB8g7L0k4uU72tU3zLStfzW7b9lJp3JcA2XyTgI8kkK2a" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0Kg9bUQ0U3QJlU2p8g9RjqPH5/llMkjlAiOXjD3Dp6noEn9x" crossorigin="anonymous"></script>
</body>
</html>
