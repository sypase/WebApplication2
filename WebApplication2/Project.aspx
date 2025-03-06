<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="WebApplication2.Project" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Project Management</h2>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" class="table table-striped">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" ReadOnly="True" SortExpression="PROJECTID" />
                    <asp:BoundField DataField="PROJECTNAME" HeaderText="PROJECTNAME" SortExpression="PROJECTNAME" />
                    <asp:BoundField DataField="STARTDATE" HeaderText="STARTDATE" SortExpression="STARTDATE" />
                    <asp:BoundField DataField="DUEDATE" HeaderText="DUEDATE" SortExpression="DUEDATE" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECTID&quot; = :PROJECTID" 
                InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;STARTDATE&quot;, &quot;DUEDATE&quot;, &quot;STATUS&quot;) VALUES (:PROJECTID, :PROJECTNAME, :STARTDATE, :DUEDATE, :STATUS)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;STARTDATE&quot;, &quot;DUEDATE&quot;, &quot;STATUS&quot; FROM &quot;PROJECT&quot;" 
                UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;PROJECTNAME&quot; = :PROJECTNAME, &quot;STARTDATE&quot; = :STARTDATE, &quot;DUEDATE&quot; = :DUEDATE, &quot;STATUS&quot; = :STATUS WHERE &quot;PROJECTID&quot; = :PROJECTID">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECTID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    <asp:Parameter Name="PROJECTNAME" Type="String" />
                    <asp:Parameter Name="STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PROJECTNAME" Type="String" />
                    <asp:Parameter Name="STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="PROJECTID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" class="mt-4">
                <EditItemTemplate>
                    <div class="form-group">
                        <label>PROJECTID:</label>
                        <asp:Label ID="PROJECTIDLabel1" runat="server" Text='<%# Eval("PROJECTID") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>PROJECTNAME:</label>
                        <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>STARTDATE:</label>
                        <asp:TextBox ID="STARTDATETextBox" runat="server" Text='<%# Bind("STARTDATE") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>DUEDATE:</label>
                        <asp:TextBox ID="DUEDATETextBox" runat="server" Text='<%# Bind("DUEDATE") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>STATUS:</label>
                        <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' class="form-control" />
                    </div>
                    <div>
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" class="btn btn-primary" />
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="btn btn-secondary" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label>PROJECTID:</label>
                        <asp:TextBox ID="PROJECTIDTextBox" runat="server" Text='<%# Bind("PROJECTID") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>PROJECTNAME:</label>
                        <asp:TextBox ID="PROJECTNAMETextBox" runat="server" Text='<%# Bind("PROJECTNAME") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>STARTDATE:</label>
                        <asp:TextBox ID="STARTDATETextBox" runat="server" Text='<%# Bind("STARTDATE") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>DUEDATE:</label>
                        <asp:TextBox ID="DUEDATETextBox" runat="server" Text='<%# Bind("DUEDATE") %>' class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>STATUS:</label>
                        <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' class="form-control" />
                    </div>
                    <div>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" class="btn btn-success" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" class="btn btn-secondary" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div>
                        <strong>PROJECTID:</strong> <asp:Label ID="PROJECTIDLabel" runat="server" Text='<%# Eval("PROJECTID") %>' />
                    </div>
                    <div>
                        <strong>PROJECTNAME:</strong> <asp:Label ID="PROJECTNAMELabel" runat="server" Text='<%# Bind("PROJECTNAME") %>' />
                    </div>
                    <div>
                        <strong>STARTDATE:</strong> <asp:Label ID="STARTDATELabel" runat="server" Text='<%# Bind("STARTDATE") %>' />
                    </div>
                    <div>
                        <strong>DUEDATE:</strong> <asp:Label ID="DUEDATELabel" runat="server" Text='<%# Bind("DUEDATE") %>' />
                    </div>
                    <div>
                        <strong>STATUS:</strong> <asp:Label ID="STATUSLabel" runat="server" Text='<%# Bind("STATUS") %>' />
                    </div>
                    <div>
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" class="btn btn-warning" />
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" class="btn btn-success" />
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
