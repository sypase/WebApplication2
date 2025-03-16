<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task1.aspx.cs" Inherits="WebApplication2.Task1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJ6V7e3bFAMp2y1pXw6E8H8g13cTOHmz6o72GtbfWFOwW0lPaRLugK1nC6L6" crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc); /* Gradient Background */
            margin-top: 20px;
            color: #333;
        }

        .container {
            margin-top: 30px;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .form-control, .btn {
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .grid-container {
            margin-top: 40px;
        }

        .form-group label {
            font-weight: bold;
            color: #495057;
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
            border-radius: 5px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            border-radius: 5px;
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

        h1 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #333;
        }

        .container h1 {
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Task 1 Heading -->
            <h1 class="text-center">Task 1</h1>
            
            <!-- SqlDataSource3: Ensure this is defined before DropDownList1 -->
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;User&quot;">
            </asp:SqlDataSource>
            
            <!-- Dropdown list for selecting user -->
            <div class="form-group">
                <label for="DropDownList1">Select User</label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="USERNAME" DataValueField="USERID" CssClass="form-control">
                </asp:DropDownList>
            </div>

            <!-- SqlDataSource2 for GridView -->
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT 
    u.USERID,
    u.USERNAME,
    u.USEREMAIL,
    u.USERCONTACT,
    p.PROJECTID,
    p.PROJECTNAME,
    p.STARTDATE,
    p.DUEDATE,
    p.STATUS
FROM &quot;User&quot; u
JOIN PROJECT_USER pu ON u.USERID = pu.USERID
JOIN PROJECT p ON pu.PROJECTID = p.PROJECTID
WHERE pu.USERID = :UserID
ORDER BY u.USERID, p.PROJECTID
">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="UserID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <!-- GridView for displaying project details -->
            <div class="grid-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERID,PROJECTID" DataSourceID="SqlDataSource2" CssClass="table table-striped table-bordered" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                        <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                        <asp:BoundField DataField="USEREMAIL" HeaderText="USEREMAIL" SortExpression="USEREMAIL" />
                        <asp:BoundField DataField="USERCONTACT" HeaderText="USERCONTACT" SortExpression="USERCONTACT" />
                        <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                        <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                        <asp:BoundField DataField="STARTDATE" HeaderText="STARTDATE" SortExpression="STARTDATE" />
                        <asp:BoundField DataField="DUEDATE" HeaderText="DUEDATE" SortExpression="DUEDATE" />
                        <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
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
