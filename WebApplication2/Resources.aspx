<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="WebApplication2.Resources" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Resources Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f4f4f4;
            padding: 20px;
        }
        .container {
            margin-top: 20px;
        }
        .grid-view {
            margin-top: 20px;
            border: 1px solid #ddd;
            background-color: white;
        }
        .grid-view th, .grid-view td {
            padding: 10px;
        }
        .form-view {
            margin-top: 20px;
        }
        .form-control {
            width: 50%;
            margin-bottom: 10px;
        }
        .btn {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="text-center">Resources Management</h1>

            <!-- GridView -->
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="RESOUCEID" DataSourceID="SqlDataSource1" CssClass="table table-striped grid-view">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="RESOUCENAME" HeaderText="Resource Name" SortExpression="RESOUCENAME" />
                    <asp:BoundField DataField="RESOUCEID" HeaderText="Resource ID" ReadOnly="True" SortExpression="RESOUCEID" />
                    <asp:BoundField DataField="RESOUCETYPE" HeaderText="Resource Type" SortExpression="RESOUCETYPE" />
                    <asp:BoundField DataField="TASKID" HeaderText="Task ID" SortExpression="TASKID" />
                </Columns>
            </asp:GridView>

            <!-- SqlDataSource for GridView -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;RESOUCES&quot; WHERE &quot;RESOUCEID&quot; = :RESOUCEID"
                InsertCommand="INSERT INTO &quot;RESOUCES&quot; (&quot;RESOUCENAME&quot;, &quot;RESOUCEID&quot;, &quot;RESOUCETYPE&quot;, &quot;TASKID&quot;) 
                VALUES (:RESOUCENAME, :RESOUCEID, :RESOUCETYPE, :TASKID)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;RESOUCENAME&quot;, &quot;RESOUCEID&quot;, &quot;RESOUCETYPE&quot;, &quot;TASKID&quot; FROM &quot;RESOUCES&quot;" 
                UpdateCommand="UPDATE &quot;RESOUCES&quot; SET &quot;RESOUCENAME&quot; = :RESOUCENAME, &quot;RESOUCETYPE&quot; = :RESOUCETYPE, &quot;TASKID&quot; = :TASKID 
                WHERE &quot;RESOUCEID&quot; = :RESOUCEID">
                <DeleteParameters>
                    <asp:Parameter Name="RESOUCEID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RESOUCENAME" Type="String" />
                    <asp:Parameter Name="RESOUCEID" Type="Decimal" />
                    <asp:Parameter Name="RESOUCETYPE" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="RESOUCENAME" Type="String" />
                    <asp:Parameter Name="RESOUCETYPE" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="RESOUCEID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <!-- FormView for Edit and Insert -->
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="RESOUCEID" DataSourceID="SqlDataSource1" CssClass="form-view">
                <EditItemTemplate>
                    <div class="form-group">
                        <label for="RESOUCENAMETextBox">Resource Name</label>
                        <asp:TextBox ID="RESOUCENAMETextBox" runat="server" Text='<%# Bind("RESOUCENAME") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="RESOUCEIDLabel1">Resource ID</label>
                        <asp:Label ID="RESOUCEIDLabel1" runat="server" Text='<%# Eval("RESOUCEID") %>' CssClass="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <label for="RESOUCETYPETextBox">Resource Type</label>
                        <asp:TextBox ID="RESOUCETYPETextBox" runat="server" Text='<%# Bind("RESOUCETYPE") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="TASKIDTextBox">Task ID</label>
                        <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' CssClass="form-control" />
                    </div>
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label for="RESOUCENAMETextBox">Resource Name</label>
                        <asp:TextBox ID="RESOUCENAMETextBox" runat="server" Text='<%# Bind("RESOUCENAME") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="RESOUCEIDTextBox">Resource ID</label>
                        <asp:TextBox ID="RESOUCEIDTextBox" runat="server" Text='<%# Bind("RESOUCEID") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="RESOUCETYPETextBox">Resource Type</label>
                        <asp:TextBox ID="RESOUCETYPETextBox" runat="server" Text='<%# Bind("RESOUCETYPE") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="DropDownList1">Task ID</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>' CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKNAME&quot;, &quot;TASKID&quot; FROM &quot;TASK&quot;"></asp:SqlDataSource>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="form-group">
                        <label>Resource Name</label>
                        <asp:Label ID="RESOUCENAMELabel" runat="server" Text='<%# Bind("RESOUCENAME") %>' class="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <label>Resource ID</label>
                        <asp:Label ID="RESOUCEIDLabel" runat="server" Text='<%# Eval("RESOUCEID") %>' class="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <label>Resource Type</label>
                        <asp:Label ID="RESOUCETYPELabel" runat="server" Text='<%# Bind("RESOUCETYPE") %>' class="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <label>Task ID</label>
                        <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Bind("TASKID") %>' class="form-control-plaintext" />
                    </div>
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-warning" />
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-success" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
