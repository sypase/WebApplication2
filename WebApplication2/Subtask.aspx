<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subtask.aspx.cs" Inherits="WebApplication2.Subtask" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subtask Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Simple CSS for styling the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }
        .container {
            margin-top: 40px;
        }
        .table {
            margin-top: 20px;
        }
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 24px;
            color: #333;
        }
        .form-label {
            font-weight: bold;
        }
        .form-control {
            margin-bottom: 15px;
        }
        .btn-custom {
            margin-right: 10px;
        }
        .btn-custom:hover {
            background-color: #007bff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <h1>Subtask Management</h1>
            <!-- GridView for displaying subtasks -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" CssClass="table table-striped">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="SUBTASKID" HeaderText="SUBTASKID" SortExpression="SUBTASKID" ReadOnly="True" />
                    <asp:BoundField DataField="SUBTASKNAME" HeaderText="SUBTASKNAME" SortExpression="SUBTASKNAME" />
                    <asp:BoundField DataField="SUBTASKSTARTDATE" HeaderText="SUBTASKSTARTDATE" SortExpression="SUBTASKSTARTDATE" />
                    <asp:BoundField DataField="SUBTASKDUEDATE" HeaderText="SUBTASKDUEDATE" SortExpression="SUBTASKDUEDATE" />
                    <asp:BoundField DataField="SUBTASKSTATUS" HeaderText="SUBTASKSTATUS" SortExpression="SUBTASKSTATUS" />
                    <asp:BoundField DataField="TASKID" HeaderText="TASKID" SortExpression="TASKID" />
                    <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" />
                </Columns>
            </asp:GridView>

            <!-- Data Source for GridView and FormView -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot;, &quot;USERID&quot; FROM &quot;SUBTASK&quot;" 
                UpdateCommand="UPDATE &quot;SUBTASK&quot; SET &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;SUBTASKSTARTDATE&quot; = :SUBTASKSTARTDATE, &quot;SUBTASKDUEDATE&quot; = :SUBTASKDUEDATE, &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS, &quot;TASKID&quot; = :TASKID, &quot;USERID&quot; = :USERID WHERE &quot;SUBTASKID&quot; = :SUBTASKID"
                InsertCommand="INSERT INTO &quot;SUBTASK&quot; (&quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot;, &quot;USERID&quot;) VALUES (:SUBTASKID, :SUBTASKNAME, :SUBTASKSTARTDATE, :SUBTASKDUEDATE, :SUBTASKSTATUS, :TASKID, :USERID)" 
                DeleteCommand="DELETE FROM &quot;SUBTASK&quot; WHERE &quot;SUBTASKID&quot; = :SUBTASKID">
                <UpdateParameters>
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASK&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot; FROM &quot;User&quot;"></asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" CssClass="form-container" AllowPaging="True">
                <EditItemTemplate>
                    <div class="form-group">
                        <label class="form-label">SUBTASKID:</label>
                        <asp:Label ID="SUBTASKIDLabel1" runat="server" Text='<%# Eval("SUBTASKID") %>' />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKNAME:</label>
                        <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKSTARTDATE:</label>
                        <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKDUEDATE:</label>
                        <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKSTATUS:</label>
                        <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">TASKID:</label>
                        <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">USERID:</label>
                        <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" class="btn btn-primary btn-custom" />
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="btn btn-secondary btn-custom" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label class="form-label">SUBTASKID:</label>
                        <asp:TextBox ID="SUBTASKIDTextBox" runat="server" Text='<%# Bind("SUBTASKID") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKNAME:</label>
                        <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKSTARTDATE:</label>
                        <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKDUEDATE:</label>
                        <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKSTATUS:</label>
                        <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">TASKID:</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKID" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label class="form-label">USERID:</label>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="USERID" DataValueField="USERID" SelectedValue='<%# Bind("USERID") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" class="btn btn-primary btn-custom" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="btn btn-secondary btn-custom" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="form-group">
                        <label class="form-label">SUBTASKID:</label>
                        <asp:Label ID="SUBTASKIDLabel" runat="server" Text='<%# Eval("SUBTASKID") %>' />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKNAME:</label>
                        <asp:Label ID="SUBTASKNAMELabel" runat="server" Text='<%# Bind("SUBTASKNAME") %>' />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKSTARTDATE:</label>
                        <asp:Label ID="SUBTASKSTARTDATELabel" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKDUEDATE:</label>
                        <asp:Label ID="SUBTASKDUEDATELabel" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' />
                    </div>
                    <div class="form-group">
                        <label class="form-label">SUBTASKSTATUS:</label>
                        <asp:Label ID="SUBTASKSTATUSLabel" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' />
                    </div>
                    <div class="form-group">
                        <label class="form-label">TASKID:</label>
                        <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Bind("TASKID") %>' />
                    </div>
                    <div class="form-group">
                        <label class="form-label">USERID:</label>
                        <asp:Label ID="USERIDLabel" runat="server" Text='<%# Bind("USERID") %>' />
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-info btn-custom" />
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" class="btn btn-danger btn-custom" />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" class="btn btn-success btn-custom" />
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
