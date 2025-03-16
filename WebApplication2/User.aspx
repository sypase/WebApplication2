<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="WebApplication2.User" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding-top: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            color: #333;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group input[type="text"] {
            font-size: 16px;
        }
        .form-group .button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .form-group .button:hover {
            background-color: #45a049;
        }
        .form-group .cancel-button {
            background-color: #f44336;
        }
        .form-group .cancel-button:hover {
            background-color: #e53935;
        }
        .grid-view {
            margin-bottom: 20px;
        }
        .grid-view a {
            color: #4CAF50;
            text-decoration: none;
            margin-right: 10px;
        }
        .grid-view a:hover {
            text-decoration: underline;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>User Management</h1>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM &quot;User&quot; WHERE &quot;USERID&quot; = :USERID" 
                InsertCommand="INSERT INTO &quot;User&quot; (&quot;USERID&quot;, &quot;USEREMAIL&quot;, &quot;USERNAME&quot;, &quot;USERCONTACT&quot;) 
                VALUES (:USERID, :USEREMAIL, :USERNAME, :USERCONTACT)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
                SelectCommand="SELECT &quot;USERID&quot;, &quot;USEREMAIL&quot;, &quot;USERNAME&quot;, &quot;USERCONTACT&quot; FROM &quot;User&quot;" 
                UpdateCommand="UPDATE &quot;User&quot; SET &quot;USEREMAIL&quot; = :USEREMAIL, &quot;USERNAME&quot; = :USERNAME, &quot;USERCONTACT&quot; = :USERCONTACT 
                WHERE &quot;USERID&quot; = :USERID">
                <DeleteParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USERCONTACT" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="USEREMAIL" Type="String" />
                    <asp:Parameter Name="USERNAME" Type="String" />
                    <asp:Parameter Name="USERCONTACT" Type="String" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="USERID" DataSourceID="SqlDataSource1" CssClass="grid-view">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="USERID" HeaderText="USERID" ReadOnly="True" SortExpression="USERID" />
                    <asp:BoundField DataField="USEREMAIL" HeaderText="USEREMAIL" SortExpression="USEREMAIL" />
                    <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" SortExpression="USERNAME" />
                    <asp:BoundField DataField="USERCONTACT" HeaderText="USERCONTACT" SortExpression="USERCONTACT" />
                </Columns>
            </asp:GridView>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    <div class="form-group">
                        <label for="USERID">USERID:</label>
                        <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' />
                    </div>
                    <div class="form-group">
                        <label for="USEREMAIL">USEREMAIL:</label>
                        <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' />
                    </div>
                    <div class="form-group">
                        <label for="USERNAME">USERNAME:</label>
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                    </div>
                    <div class="form-group">
                        <label for="USERCONTACT">USERCONTACT:</label>
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' />
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" 
                            Text="Update" CssClass="button" />
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                            Text="Cancel" CssClass="cancel-button button" />
                    </div>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group">
                        <label for="USERID">USERID:</label>
                        <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' />
                    </div>
                    <div class="form-group">
                        <label for="USEREMAIL">USEREMAIL:</label>
                        <asp:TextBox ID="USEREMAILTextBox" runat="server" Text='<%# Bind("USEREMAIL") %>' />
                    </div>
                    <div class="form-group">
                        <label for="USERNAME">USERNAME:</label>
                        <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                    </div>
                    <div class="form-group">
                        <label for="USERCONTACT">USERCONTACT:</label>
                        <asp:TextBox ID="USERCONTACTTextBox" runat="server" Text='<%# Bind("USERCONTACT") %>' />
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" 
                            Text="Insert" CssClass="button" />
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                            Text="Cancel" CssClass="cancel-button button" />
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="form-group">
                        <label for="USERID">USERID:</label>
                        <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />
                    </div>
                    <div class="form-group">
                        <label for="USEREMAIL">USEREMAIL:</label>
                        <asp:Label ID="USEREMAILLabel" runat="server" Text='<%# Bind("USEREMAIL") %>' />
                    </div>
                    <div class="form-group">
                        <label for="USERNAME">USERNAME:</label>
                        <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Bind("USERNAME") %>' />
                    </div>
                    <div class="form-group">
                        <label for="USERCONTACT">USERCONTACT:</label>
                        <asp:Label ID="USERCONTACTLabel" runat="server" Text='<%# Bind("USERCONTACT") %>' />
                    </div>
                    <div class="form-group">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" 
                            Text="Edit" CssClass="button" />
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" 
                            Text="Delete" CssClass="button" />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" 
                            Text="New" CssClass="button" />
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
