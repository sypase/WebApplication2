<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comment.aspx.cs" Inherits="WebApplication2.Milestone" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Comment Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJ7JtJ88pCjH0H1oqso3Q2WGEruDh3P0lV6V0u/5C4P0l0Y0+e3r6o/yYoQm" crossorigin="anonymous">
    <!-- Custom CSS -->
    <style>
        body {
            padding: 20px;
        }

        .form-container {
            max-width: 900px;
            margin: 0 auto;
        }

        .gridview-container {
            margin-top: 20px;
        }

        .form-control-plaintext {
            background-color: #f8f9fa;
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-sm {
            font-size: 0.875rem;
        }

        .btn-custom {
            margin-right: 10px;
        }

        .footer {
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container form-container">
            <h2>Comment Management</h2>
            <div class="gridview-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COMMENTID" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered">
                    <Columns>
                        <asp:BoundField DataField="COMMENTID" HeaderText="COMMENTID" ReadOnly="True" SortExpression="COMMENTID" />
                        <asp:BoundField DataField="CREATEDTIME" HeaderText="CREATEDTIME" SortExpression="CREATEDTIME" />
                        <asp:BoundField DataField="CONTENT" HeaderText="CONTENT" SortExpression="CONTENT" />
                        <asp:BoundField DataField="TASKID" HeaderText="TASKID" SortExpression="TASKID" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;Comment&quot; WHERE &quot;COMMENTID&quot; = :COMMENTID" InsertCommand="INSERT INTO &quot;Comment&quot; (&quot;COMMENTID&quot;, &quot;CREATEDTIME&quot;, &quot;CONTENT&quot;, &quot;TASKID&quot;) VALUES (:COMMENTID, :CREATEDTIME, :CONTENT, :TASKID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;COMMENTID&quot;, &quot;CREATEDTIME&quot;, &quot;CONTENT&quot;, &quot;TASKID&quot; FROM &quot;Comment&quot;" UpdateCommand="UPDATE &quot;Comment&quot; SET &quot;CREATEDTIME&quot; = :CREATEDTIME, &quot;CONTENT&quot; = :CONTENT, &quot;TASKID&quot; = :TASKID WHERE &quot;COMMENTID&quot; = :COMMENTID">
                <DeleteParameters>
                    <asp:Parameter Name="COMMENTID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="COMMENTID" Type="Decimal" />
                    <asp:Parameter Name="CREATEDTIME" Type="DateTime" />
                    <asp:Parameter Name="CONTENT" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CREATEDTIME" Type="DateTime" />
                    <asp:Parameter Name="CONTENT" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="COMMENTID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="COMMENTID" DataSourceID="SqlDataSource1" CssClass="table">
                <EditItemTemplate>
                    <div class="form-group">
                        <label for="COMMENTIDLabel1">COMMENTID:</label>
                        <asp:Label ID="COMMENTIDLabel1" runat="server" Text='<%# Eval("COMMENTID") %>' CssClass="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <label for="CREATEDTIMETextBox">CREATEDTIME:</label>
                        <asp:TextBox ID="CREATEDTIMETextBox" runat="server" Text='<%# Bind("CREATEDTIME") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="CONTENTTextBox">CONTENT:</label>
                        <asp:TextBox ID="CONTENTTextBox" runat="server" Text='<%# Bind("CONTENT") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="TASKIDTextBox">TASKID:</label>
                        <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary btn-sm btn-custom" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label for="COMMENTIDTextBox">COMMENTID:</label>
                        <asp:TextBox ID="COMMENTIDTextBox" runat="server" Text='<%# Bind("COMMENTID") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="CREATEDTIMETextBox">CREATEDTIME:</label>
                        <asp:TextBox ID="CREATEDTIMETextBox" runat="server" Text='<%# Bind("CREATEDTIME") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="CONTENTTextBox">CONTENT:</label>
                        <asp:TextBox ID="CONTENTTextBox" runat="server" Text='<%# Bind("CONTENT") %>' CssClass="form-control" />
                    </div>
                    <div class="form-group">
                        <label for="DropDownList1">TASKID:</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TASKID" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>' CssClass="form-control">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASK&quot;"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary btn-sm btn-custom" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary btn-sm" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="form-group">
                        <label for="COMMENTIDLabel">COMMENTID:</label>
                        <asp:Label ID="COMMENTIDLabel" runat="server" Text='<%# Eval("COMMENTID") %>' CssClass="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <label for="CREATEDTIMELabel">CREATEDTIME:</label>
                        <asp:Label ID="CREATEDTIMELabel" runat="server" Text='<%# Bind("CREATEDTIME") %>' CssClass="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <label for="CONTENTLabel">CONTENT:</label>
                        <asp:Label ID="CONTENTLabel" runat="server" Text='<%# Bind("CONTENT") %>' CssClass="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <label for="TASKIDLabel">TASKID:</label>
                        <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Bind("TASKID") %>' CssClass="form-control-plaintext" />
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-warning btn-sm btn-custom" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm btn-custom" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-success btn-sm btn-custom" />
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
        <div class="footer">
            <p>&copy; 2025 WebApplication2. All Rights Reserved.</p>
        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0T6t7ot1R6r/T7vlS16Rhs6zCfmD+AvyYjQZ0kWbKrYZ8+Zi" crossorigin="anonymous"></script>
</body>
</html>
