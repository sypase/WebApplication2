<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="WebApplication2.Project" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* General Body Styling */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
        }

        .container {
            margin-top: 50px;
        }

        /* Styling for Buttons */
        .btn-custom {
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
            transition: background-color 0.3s, transform 0.2s;
            border: none;
            cursor: pointer;
        }

        .btn-edit {
            background-color: #007bff;
            color: white;
        }

        .btn-edit:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn-delete:hover {
            background-color: #c82333;
            transform: scale(1.05);
        }

        .btn-new {
            background-color: #28a745;
            color: white;
        }

        .btn-new:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
        }

        .btn-cancel:hover {
            background-color: #5a6268;
            transform: scale(1.05);
        }

        /* Styling for Input Fields */
        input[type="text"],
        input[type="date"],
        .form-control {
            background-color: #ffffff;
            border: 1px solid #ced4da;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            margin-bottom: 10px;
            font-size: 14px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        /* Styling for Labels */
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        /* GridView Styling */
        .table th, .table td {
            vertical-align: middle;
        }
        
        .table th {
            background-color: #007bff;
            color: white;
        }

        .table-striped tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        .table-striped tbody tr:hover {
            background-color: #f1f1f1;
        }
    </style>
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
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                    <asp:BoundField DataField="DUEDATE" HeaderText="DUEDATE" SortExpression="DUEDATE" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                DeleteCommand="DELETE FROM &quot;PROJECT&quot; WHERE &quot;PROJECTID&quot; = :PROJECTID" 
                InsertCommand="INSERT INTO &quot;PROJECT&quot; (&quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;STARTDATE&quot;, &quot;STATUS&quot;, &quot;DUEDATE&quot;) VALUES (:PROJECTID, :PROJECTNAME, :STARTDATE, :STATUS, :DUEDATE)" 
                ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" 
                SelectCommand="SELECT &quot;PROJECTID&quot;, &quot;PROJECTNAME&quot;, &quot;STARTDATE&quot;, &quot;STATUS&quot;, &quot;DUEDATE&quot; FROM &quot;PROJECT&quot;" 
                UpdateCommand="UPDATE &quot;PROJECT&quot; SET &quot;PROJECTNAME&quot; = :PROJECTNAME, &quot;STARTDATE&quot; = :STARTDATE, &quot;STATUS&quot; = :STATUS, &quot;DUEDATE&quot; = :DUEDATE WHERE &quot;PROJECTID&quot; = :PROJECTID">
                <DeleteParameters>
                    <asp:Parameter Name="PROJECTID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PROJECTID" Type="Decimal" />
                    <asp:Parameter Name="PROJECTNAME" Type="String" />
                    <asp:Parameter Name="STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="DUEDATE" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PROJECTNAME" Type="String" />
                    <asp:Parameter Name="STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="PROJECTID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PROJECTID" DataSourceID="SqlDataSource1" class="mt-4">
                <EditItemTemplate>
                    <label for="PROJECTNAMETextBox">PROJECTNAME:</label>
                    <asp:TextBox ID="PROJECTNAMETextBox" runat="server" CssClass="form-control" Text='<%# Bind("PROJECTNAME") %>' />
                    <label for="STARTDATETextBox">STARTDATE:</label>
                    <asp:TextBox ID="STARTDATETextBox" runat="server" CssClass="form-control" Text='<%# Bind("STARTDATE") %>' />
                    <label for="STATUSTextBox">STATUS:</label>
                    <asp:TextBox ID="STATUSTextBox" runat="server" CssClass="form-control" Text='<%# Bind("STATUS") %>' />
                    <label for="DUEDATETextBox">DUEDATE:</label>
                    <asp:TextBox ID="DUEDATETextBox" runat="server" CssClass="form-control" Text='<%# Bind("DUEDATE") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn-custom btn-edit" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn-custom btn-cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <label for="PROJECTIDTextBox">PROJECTID:</label>
                    <asp:TextBox ID="PROJECTIDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("PROJECTID") %>' />
                    <label for="PROJECTNAMETextBox">PROJECTNAME:</label>
                    <asp:TextBox ID="PROJECTNAMETextBox" runat="server" CssClass="form-control" Text='<%# Bind("PROJECTNAME") %>' />
                    <label for="STARTDATETextBox">STARTDATE:</label>
                    <asp:TextBox ID="STARTDATETextBox" runat="server" CssClass="form-control" Text='<%# Bind("STARTDATE") %>' />
                    <label for="STATUSTextBox">STATUS:</label>
                    <asp:TextBox ID="STATUSTextBox" runat="server" CssClass="form-control" Text='<%# Bind("STATUS") %>' />
                    <label for="DUEDATETextBox">DUEDATE:</label>
                    <asp:TextBox ID="DUEDATETextBox" runat="server" CssClass="form-control" Text='<%# Bind("DUEDATE") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn-custom btn-new" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn-custom btn-cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <label>PROJECTID:</label>
                    <asp:Label ID="PROJECTIDLabel" runat="server" Text='<%# Eval("PROJECTID") %>' />
                    <br />
                    <label>PROJECTNAME:</label>
                    <asp:Label ID="PROJECTNAMELabel" runat="server" Text='<%# Bind("PROJECTNAME") %>' />
                    <br />
                    <label>STARTDATE:</label>
                    <asp:Label ID="STARTDATELabel" runat="server" Text='<%# Bind("STARTDATE") %>' />
                    <br />
                    <label>STATUS:</label>
                    <asp:Label ID="STATUSLabel" runat="server" Text='<%# Bind("STATUS") %>' />
                    <br />
                    <label>DUEDATE:</label>
                    <asp:Label ID="DUEDATELabel" runat="server" Text='<%# Bind("DUEDATE") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn-custom btn-edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn-custom btn-delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" CssClass="btn-custom btn-new" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>
