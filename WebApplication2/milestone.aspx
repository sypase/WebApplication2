<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="milestone.aspx.cs" Inherits="WebApplication2.milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Milestone Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Bootstrap CSS -->
    <link href="~/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <link href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
  <style>
    body {
        background-color: #f7f8fa;
        color: #343a40;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        padding-top: 30px;
    }
    .page-header {
        border-bottom: 3px solid #007bff;
        margin-bottom: 30px;
        padding-bottom: 12px;
        font-size: 2rem;
        font-weight: 600;
    }
    .card {
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px;
        border-radius: 8px;
    }
    .card-header {
        background-color: #007bff;
        color: white;
        font-size: 1.2rem;
        font-weight: 600;
        padding: 15px;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }
    .card-body {
        padding: 20px;
    }
    .table thead th {
        background-color: #e9ecef;
        color: #495057;
        font-weight: 500;
        border-bottom: 2px solid #dee2e6;
        text-align: center;
    }
    .table tbody td {
        text-align: center;
        vertical-align: middle;
    }
    .btn-action {
        margin-right: 5px;
    }
    .form-group {
        margin-bottom: 18px;
    }
    .form-control:focus {
        border-color: #66afe9;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
    }
    .milestone-form {
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        padding: 10px 15px;
    }
    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004085;
    }
    .btn-danger {
        background-color: #dc3545;
        border-color: #dc3545;
        padding: 10px 15px;
    }
    .btn-danger:hover {
        background-color: #c82333;
        border-color: #bd2130;
    }
    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
        padding: 10px 15px;
    }
    .btn-success:hover {
        background-color: #218838;
        border-color: #1e7e34;
    }
    .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
        padding: 10px 15px;
    }
    .btn-secondary:hover {
        background-color: #5a6268;
        border-color: #545b62;
    }
    .form-control {
        padding: 10px;
        font-size: 1rem;
    }
    .form-control-plaintext {
        font-size: 1rem;
        color: #495057;
    }
    .offset-sm-3 {
        margin-left: 25%;
    }
    .alert-info {
        font-size: 1.1rem;
        background-color: #d1ecf1;
        border-color: #bee5eb;
    }
    .fa {
        margin-right: 8px;
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1 class="page-header">
                        <i class="fa fa-tasks"></i> Milestone Management
                    </h1>
                </div>
            </div>
            
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <i class="fa fa-list"></i> Milestones List
                        </div>
                        <div class="card-body">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="MILESTONEID" DataSourceID="SqlDataSource1"
                                CssClass="table table-striped table-bordered table-hover" 
                                BorderWidth="0px" GridLines="None">
                                <Columns>
                                    <asp:BoundField DataField="MILESTONEID" HeaderText="ID" ReadOnly="True" SortExpression="MILESTONEID" />
                                    <asp:BoundField DataField="MILESTONENAME" HeaderText="Milestone Name" SortExpression="MILESTONENAME" />
                                    <asp:BoundField DataField="PROJECTID" HeaderText="Project ID" SortExpression="PROJECTID" />
                                    <asp:BoundField DataField="DUEDATE" HeaderText="Due Date" SortExpression="DUEDATE" DataFormatString="{0:MM/dd/yyyy}" />
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CommandArgument='<%# Eval("MILESTONEID") %>'
                                                CssClass="btn btn-sm btn-primary" Text="<i class='fa fa-edit'></i> Edit" />
                                            <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CommandArgument='<%# Eval("MILESTONEID") %>'
                                                CssClass="btn btn-sm btn-danger" Text="<i class='fa fa-trash'></i> Delete"
                                                OnClientClick="return confirm('Are you sure you want to delete this milestone?');" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div class="alert alert-info">
                                        No milestones found. Click the "New Milestone" button to add one.
                                    </div>
                                </EmptyDataTemplate>
                                <HeaderStyle CssClass="thead-light" />
                            </asp:GridView>
                        </div>
                        <div class="card-footer">
                            <!-- Changed to use JavaScript to trigger the FormView's New command instead of a server-side event handler -->
                            <button type="button" class="btn btn-success" onclick="javascript:__doPostBack('FormView1$NewButton','')">
                                <i class="fa fa-plus"></i> New Milestone
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="MILESTONEID" 
                        DataSourceID="SqlDataSource1" CssClass="milestone-form"
                        Width="100%" AllowPaging="True">
                        <EditItemTemplate>
                            <h3 class="mb-4"><i class="fa fa-edit"></i> Edit Milestone</h3>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Milestone ID:</label>
                                <div class="col-sm-9">
                                    <asp:Label ID="MILESTONEIDLabel1" runat="server" 
                                        Text='<%# Eval("MILESTONEID") %>' CssClass="form-control-plaintext" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Milestone Name:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="MILESTONENAMETextBox" runat="server" 
                                        Text='<%# Bind("MILESTONENAME") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Project:</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" 
                                        DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTID") %>'
                                        CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                        SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECT&quot;">
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Due Date:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="DUEDATETextBox" runat="server" 
                                        Text='<%# Bind("DUEDATE", "{0:yyyy-MM-dd}") %>' 
                                        CssClass="form-control" TextMode="Date" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="offset-sm-3 col-sm-9">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                        CommandName="Update" CssClass="btn btn-primary">
                                        <i class="fa fa-save"></i> Update
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" CssClass="btn btn-secondary">
                                        <i class="fa fa-times"></i> Cancel
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <h3 class="mb-4"><i class="fa fa-plus-circle"></i> Add New Milestone</h3>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Milestone ID:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="MILESTONEIDTextBox" runat="server" 
                                        Text='<%# Bind("MILESTONEID") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Milestone Name:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="MILESTONENAMETextBox" runat="server" 
                                        Text='<%# Bind("MILESTONENAME") %>' CssClass="form-control" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Project:</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        DataSourceID="SqlDataSource2" DataTextField="PROJECTNAME" 
                                        DataValueField="PROJECTID" SelectedValue='<%# Bind("PROJECTID") %>'
                                        CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                                        SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot; FROM &quot;PROJECT&quot;">
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Due Date:</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="DUEDATETextBox" runat="server" 
                                        Text='<%# Bind("DUEDATE", "{0:yyyy-MM-dd}") %>' 
                                        CssClass="form-control" TextMode="Date" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="offset-sm-3 col-sm-9">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                                        CommandName="Insert" CssClass="btn btn-success">
                                        <i class="fa fa-save"></i> Save
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" CssClass="btn btn-secondary">
                                        <i class="fa fa-times"></i> Cancel
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <h3 class="mb-4"><i class="fa fa-info-circle"></i> Milestone Details</h3>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Milestone ID:</label>
                                <div class="col-sm-9">
                                    <asp:Label ID="MILESTONEIDLabel" runat="server" 
                                        Text='<%# Eval("MILESTONEID") %>' CssClass="form-control-plaintext" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Milestone Name:</label>
                                <div class="col-sm-9">
                                    <asp:Label ID="MILESTONENAMELabel" runat="server" 
                                        Text='<%# Bind("MILESTONENAME") %>' CssClass="form-control-plaintext" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Project ID:</label>
                                <div class="col-sm-9">
                                    <asp:Label ID="PROJECTIDLabel" runat="server" 
                                        Text='<%# Bind("PROJECTID") %>' CssClass="form-control-plaintext" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Due Date:</label>
                                <div class="col-sm-9">
                                    <asp:Label ID="DUEDATELabel" runat="server" 
                                        Text='<%# Bind("DUEDATE", "{0:MM/dd/yyyy}") %>' CssClass="form-control-plaintext" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="offset-sm-3 col-sm-9">
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                        CommandName="Edit" CssClass="btn btn-primary btn-action">
                                        <i class="fa fa-edit"></i> Edit
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                        CommandName="Delete" CssClass="btn btn-danger btn-action" 
                                        OnClientClick="return confirm('Are you sure you want to delete this milestone?');">
                                        <i class="fa fa-trash"></i> Delete
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                                        CommandName="New" CssClass="btn btn-success btn-action">
                                        <i class="fa fa-plus"></i> New
                                    </asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM &quot;MILESTONE&quot; WHERE &quot;MILESTONEID&quot; = :MILESTONEID" 
            InsertCommand="INSERT INTO &quot;MILESTONE&quot; (&quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;PROJECTID&quot;, &quot;DUEDATE&quot;) VALUES (:MILESTONEID, :MILESTONENAME, :PROJECTID, :DUEDATE)" 
            OnSelecting="SqlDataSource1_Selecting" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT &quot;MILESTONEID&quot;, &quot;MILESTONENAME&quot;, &quot;PROJECTID&quot;, &quot;DUEDATE&quot; FROM &quot;MILESTONE&quot;" 
            UpdateCommand="UPDATE &quot;MILESTONE&quot; SET &quot;MILESTONENAME&quot; = :MILESTONENAME, &quot;PROJECTID&quot; = :PROJECTID, &quot;DUEDATE&quot; = :DUEDATE WHERE &quot;MILESTONEID&quot; = :MILESTONEID">
            <DeleteParameters>
                <asp:Parameter Name="MILESTONEID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MILESTONEID" Type="Decimal" />
                <asp:Parameter Name="MILESTONENAME" Type="String" />
                <asp:Parameter Name="PROJECTID" Type="Decimal" />
                <asp:Parameter Name="DUEDATE" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MILESTONENAME" Type="String" />
                <asp:Parameter Name="PROJECTID" Type="Decimal" />
                <asp:Parameter Name="DUEDATE" Type="DateTime" />
                <asp:Parameter Name="MILESTONEID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- Bootstrap and jQuery JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
        <script src="~/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    </form>
</body>
</html>