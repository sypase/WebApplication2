<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subtask.aspx.cs" Inherits="WebApplication2.Subtask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Subtask Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <div>
            <!-- GridView for displaying subtasks -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="SUBTASKNAME" HeaderText="Subtask Name" SortExpression="SUBTASKNAME" />
                    <asp:BoundField DataField="SUBTASKID" HeaderText="Subtask ID" SortExpression="SUBTASKID" ReadOnly="True" />
                    <asp:BoundField DataField="SUBTASKSTARTDATE" HeaderText="Start Date" SortExpression="SUBTASKSTARTDATE" />
                    <asp:BoundField DataField="SUBTASKSTATUS" HeaderText="Status" SortExpression="SUBTASKSTATUS" />
                    <asp:BoundField DataField="TASKID" HeaderText="Task ID" SortExpression="TASKID" />
                    <asp:BoundField DataField="SUBTASKDUEDATE" HeaderText="Due Date" SortExpression="SUBTASKDUEDATE" />
                    <asp:BoundField DataField="USERID" HeaderText="User ID" SortExpression="USERID" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <!-- Data Source for GridView and FormView -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM SUBTASK" 
                UpdateCommand="UPDATE SUBTASK SET SUBTASKNAME = :SUBTASKNAME, SUBTASKSTARTDATE = :SUBTASKSTARTDATE, SUBTASKSTATUS = :SUBTASKSTATUS, TASKID = :TASKID, SUBTASKDUEDATE = :SUBTASKDUEDATE, USERID = :USERID WHERE SUBTASKID = :SUBTASKID"
                InsertCommand="INSERT INTO SUBTASK (SUBTASKNAME, SUBTASKSTARTDATE, SUBTASKSTATUS, TASKID, SUBTASKDUEDATE, USERID) VALUES (:SUBTASKNAME, :SUBTASKSTARTDATE, :SUBTASKSTATUS, :TASKID, :SUBTASKDUEDATE, :USERID)" 
                DeleteCommand="DELETE FROM SUBTASK WHERE SUBTASKID = :SUBTASKID">
                <UpdateParameters>
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <!-- FormView for Adding and Editing Subtasks -->
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1" CssClass="mt-3">
                <EditItemTemplate>
                    <h3>Edit Subtask</h3>
                    <div class="mb-3">
                        <label>Subtask Name:</label>
                        <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Start Date:</label>
                        <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Status:</label>
                        <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Task:</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>' class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label>Due Date:</label>
                        <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>User:</label>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="USERNAME" DataValueField="USERID" SelectedValue='<%# Bind("USERID") %>' class="form-control">
                        </asp:DropDownList>
                    </div>
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <h3>Add New Subtask</h3>
                    <div class="mb-3">
                        <label>Subtask Name:</label>
                        <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Start Date:</label>
                        <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Status:</label>
                        <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Task:</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASKID" class="form-control">
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label>Due Date:</label>
                        <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>User:</label>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="USERNAME" DataValueField="USERID" class="form-control">
                        </asp:DropDownList>
                    </div>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="mb-3">
                        <label>Subtask Name:</label>
                        <asp:Label ID="SUBTASKNAMELabel" runat="server" Text='<%# Bind("SUBTASKNAME") %>' class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Start Date:</label>
                        <asp:Label ID="SUBTASKSTARTDATELabel" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Status:</label>
                        <asp:Label ID="SUBTASKSTATUSLabel" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Task:</label>
                        <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Bind("TASKID") %>' class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>Due Date:</label>
                        <asp:Label ID="SUBTASKDUEDATELabel" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' class="form-control" />
                    </div>
                    <div class="mb-3">
                        <label>User:</label>
                        <asp:Label ID="USERIDLabel" runat="server" Text='<%# Bind("USERID") %>' class="form-control" />
                    </div>
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-warning" />
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
