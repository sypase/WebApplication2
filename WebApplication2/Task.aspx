<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="WebApplication2.Task" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome Icons (optional) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f4f6f9;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
        }

        .task-header {
            font-size: 2em;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 30px;
            text-align: center;
        }

        .gridview, .formview-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        .formview-container {
            margin-top: 20px;
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .btn-custom {
            margin-top: 10px;
            width: 100%;
        }

        .form-control {
            border-radius: 5px;
        }

        .btn-custom-new, .btn-custom-edit, .btn-custom-delete {
            width: 100%;
        }

        .formview-container h4 {
            font-size: 1.6em;
            color: #333;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .gridview {
            margin-bottom: 30px;
        }

        .task-footer {
            text-align: center;
            margin-top: 30px;
        }

        .btn-link {
            font-size: 1em;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <!-- SqlDataSource Control -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            DeleteCommand="DELETE FROM &quot;TASK&quot; WHERE &quot;TASKID&quot; = :TASKID"
            InsertCommand="INSERT INTO &quot;TASK&quot; (&quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;STARTDATE&quot;, &quot;DUEDATE&quot;, &quot;STATUS&quot;) VALUES (:TASKID, :TASKNAME, :STARTDATE, :DUEDATE, :STATUS)"
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
            SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;STARTDATE&quot;, &quot;DUEDATE&quot;, &quot;STATUS&quot; FROM &quot;TASK&quot;"
            UpdateCommand="UPDATE &quot;TASK&quot; SET &quot;TASKNAME&quot; = :TASKNAME, &quot;STARTDATE&quot; = :STARTDATE, &quot;DUEDATE&quot; = :DUEDATE, &quot;STATUS&quot; = :STATUS WHERE &quot;TASKID&quot; = :TASKID">
            <DeleteParameters>
                <asp:Parameter Name="TASKID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TASKID" Type="Decimal" />
                <asp:Parameter Name="TASKNAME" Type="String" />
                <asp:Parameter Name="STARTDATE" Type="DateTime" />
                <asp:Parameter Name="DUEDATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TASKNAME" Type="String" />
                <asp:Parameter Name="STARTDATE" Type="DateTime" />
                <asp:Parameter Name="DUEDATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="TASKID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="container">
            <h2 class="task-header">Task Management</h2>

            <!-- GridView for displaying tasks -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASKID" DataSourceID="SqlDataSource1"
                CssClass="table table-striped table-bordered gridview">
                <Columns>
                    <asp:BoundField DataField="TASKID" HeaderText="TASKID" ReadOnly="True" SortExpression="TASKID" />
                    <asp:BoundField DataField="TASKNAME" HeaderText="TASKNAME" SortExpression="TASKNAME" />
                    <asp:BoundField DataField="STARTDATE" HeaderText="STARTDATE" SortExpression="STARTDATE" />
                    <asp:BoundField DataField="DUEDATE" HeaderText="DUEDATE" SortExpression="DUEDATE" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-warning btn-custom-edit" />
                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-custom-delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <!-- FormView for adding or editing tasks -->
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" CssClass="formview-container">
                <EditItemTemplate>
                    <h4>Edit Task</h4>
                    TASKID: <asp:Label ID="TASKIDLabel1" runat="server" Text='<%# Eval("TASKID") %>' /><br />
                    TASKNAME: <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' CssClass="form-control" /><br />
                    STARTDATE: <asp:TextBox ID="STARTDATETextBox" runat="server" Text='<%# Bind("STARTDATE") %>' CssClass="form-control" /><br />
                    DUEDATE: <asp:TextBox ID="DUEDATETextBox" runat="server" Text='<%# Bind("DUEDATE") %>' CssClass="form-control" /><br />
                    STATUS: <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' CssClass="form-control" /><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary btn-custom" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-custom" />
                </EditItemTemplate>

                <InsertItemTemplate>
                    <h4>Create New Task</h4>
                    TASKID: <asp:TextBox ID="TASKIDTextBox" runat="server" CssClass="form-control" /><br />
                    TASKNAME: <asp:TextBox ID="TASKNAMETextBox" runat="server" CssClass="form-control" /><br />
                    STARTDATE: <asp:TextBox ID="STARTDATETextBox" runat="server" CssClass="form-control" /><br />
                    DUEDATE: <asp:TextBox ID="DUEDATETextBox" runat="server" CssClass="form-control" /><br />
                    STATUS: <asp:TextBox ID="STATUSTextBox" runat="server" CssClass="form-control" /><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success btn-custom-new" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-custom-new" />
                </InsertItemTemplate>

                <ItemTemplate>
                    TASKID: <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Eval("TASKID") %>' /><br />
                    TASKNAME: <asp:Label ID="TASKNAMELabel" runat="server" Text='<%# Bind("TASKNAME") %>' /><br />
                    STARTDATE: <asp:Label ID="STARTDATELabel" runat="server" Text='<%# Bind("STARTDATE") %>' /><br />
                    DUEDATE: <asp:Label ID="DUEDATELabel" runat="server" Text='<%# Bind("DUEDATE") %>' /><br />
                    STATUS: <asp:Label ID="STATUSLabel" runat="server" Text='<%# Bind("STATUS") %>' /><br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-warning btn-custom-edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-custom-delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-info btn-custom-new" />
                </ItemTemplate>
            </asp:FormView>

            <div class="task-footer">
                <p>&copy; 2025 Task Management System. All rights reserved.</p>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>
