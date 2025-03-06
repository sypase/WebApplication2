<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
    <!-- Bootstrap CDN for styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Custom CSS */
        .container {
            max-width: 80%;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .grid-view {
            width: 100%;
            margin-top: 20px;
        }

        .grid-view th, .grid-view td {
            text-align: center;
            padding: 10px;
        }

        .grid-view td {
            background-color: #f9f9f9;
        }

        .form-view-container {
            margin-top: 30px;
        }

        .form-view-container label {
            font-weight: bold;
        }

        .form-view-container input {
            margin-bottom: 10px;
        }

        .form-buttons {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>User Management</h1>

            <!-- GridView -->
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="USERID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="grid-view table table-bordered table-striped">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                    <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                    <asp:BoundField DataField="USEREMAIL" HeaderText="USEREMAIL" SortExpression="USEREMAIL" />
                    <asp:BoundField DataField="USERCONTACT" HeaderText="USERCONTACT" SortExpression="USERCONTACT" />
                </Columns>
            </asp:GridView>

            <!-- SqlDataSource -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;User&quot; WHERE &quot;USERID&quot; = :USERID"
                InsertCommand="INSERT INTO &quot;User&quot; (&quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot;) VALUES (:USERID, :USERNAME, :USEREMAIL, :USERCONTACT)"
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT &quot;USERID&quot;, &quot;USERNAME&quot;, &quot;USEREMAIL&quot;, &quot;USERCONTACT&quot; FROM &quot;User&quot;"
                UpdateCommand="UPDATE &quot;User&quot; SET &quot;USERNAME&quot; = :USERNAME, &quot;USEREMAIL&quot; = :USEREMAIL, &quot;USERCONTACT&quot; = :USERCONTACT WHERE &quot;USERID&quot; = :USERID">
                <DeleteParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="USERCONTACT" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="USERCONTACT" Type="String" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div class="form-view-container">
                <!-- FormView for user details -->
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" OnPageIndexChanging="FormView1_PageIndexChanging2">
                    <EditItemTemplate>
                        <label for="USERNAMETextBox">Username:</label>
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' class="form-control" />
                        <br />
                        <label for="USEREMAILTextBox">Email:</label>
                        <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' class="form-control" />
                        <br />
                        <label for="USERCONTACTTextBox">Contact:</label>
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' class="form-control" />
                        <br />
                        <div class="form-buttons">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-success" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" />
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <label for="USERNAMETextBox">Username:</label>
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' class="form-control" />
                        <br />
                        <label for="USEREMAILTextBox">Email:</label>
                        <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' class="form-control" />
                        <br />
                        <label for="USERCONTACTTextBox">Contact:</label>
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' class="form-control" />
                        <br />
                        <div class="form-buttons">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <label>UserID:</label>
                        <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' class="form-control-static" />
                        <br />
                        <label>Username:</label>
                        <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Eval("USERNAME") %>' class="form-control-static" />
                        <br />
                        <label>Email:</label>
                        <asp:Label ID="USEREMAILLabel" runat="server" Text='<%# Eval("USEREMAIL") %>' class="form-control-static" />
                        <br />
                        <label>Contact:</label>
                        <asp:Label ID="USERCONTACTLabel" runat="server" Text='<%# Eval("USERCONTACT") %>' class="form-control-static" />
                        <br />
                        <div class="form-buttons">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-warning" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" CssClass="btn btn-info" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
