<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="WebApplication2.Task" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 20px;
        }

        #form1 {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .gridview-container, .formview-container {
            margin-bottom: 40px;
        }

        .gridview-container .asp:GridView {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
        }

        .gridview-container th, .gridview-container td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .gridview-container th {
            background-color: #f2f2f2;
        }

        .formview-container label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
        }

        .formview-container input[type="text"], .formview-container input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .formview-container .button-container {
            text-align: center;
        }

        .formview-container .button-container a {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            margin: 0 10px;
            font-size: 16px;
        }

        .formview-container .button-container a:hover {
            background-color: #0056b3;
        }

        .formview-container .cancel-button {
            background-color: #f44336;
        }

        .formview-container .cancel-button:hover {
            background-color: #d32f2f;
        }

        .formview-container .new-button {
            background-color: #28a745;
        }

        .formview-container .new-button:hover {
            background-color: #218838;
        }

        .formview-container .edit-button, .formview-container .delete-button {
            background-color: #ffc107;
        }

        .formview-container .edit-button:hover, .formview-container .delete-button:hover {
            background-color: #e0a800;
        }

        .formview-container .insert-button {
            background-color: #007bff;
        }

        .formview-container .insert-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Task Management</h1>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASK&quot; WHERE &quot;TASKID&quot; = :TASKID" InsertCommand="INSERT INTO &quot;TASK&quot; (&quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;STARTDATE&quot;, &quot;STATUS&quot;, &quot;DUEDATE&quot;) VALUES (:TASKID, :TASKNAME, :STARTDATE, :STATUS, :DUEDATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot;, &quot;STARTDATE&quot;, &quot;STATUS&quot;, &quot;DUEDATE&quot; FROM &quot;TASK&quot;" UpdateCommand="UPDATE &quot;TASK&quot; SET &quot;TASKNAME&quot; = :TASKNAME, &quot;STARTDATE&quot; = :STARTDATE, &quot;STATUS&quot; = :STATUS, &quot;DUEDATE&quot; = :DUEDATE WHERE &quot;TASKID&quot; = :TASKID">
                <DeleteParameters>
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="TASKNAME" Type="String" />
                    <asp:Parameter Name="STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="DUEDATE" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TASKNAME" Type="String" />
                    <asp:Parameter Name="STARTDATE" Type="DateTime" />
                    <asp:Parameter Name="STATUS" Type="String" />
                    <asp:Parameter Name="DUEDATE" Type="DateTime" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <div class="gridview-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="TASKID" HeaderText="TASKID" ReadOnly="True" SortExpression="TASKID" />
                        <asp:BoundField DataField="TASKNAME" HeaderText="TASKNAME" SortExpression="TASKNAME" />
                        <asp:BoundField DataField="STARTDATE" HeaderText="STARTDATE" SortExpression="STARTDATE" />
                        <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                        <asp:BoundField DataField="DUEDATE" HeaderText="DUEDATE" SortExpression="DUEDATE" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="formview-container">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="TASKID" DataSourceID="SqlDataSource1" Height="237px" OnPageIndexChanging="FormView1_PageIndexChanging" Width="348px">
                    <EditItemTemplate>
                        <label>TASKID:</label>
                        <asp:Label ID="TASKIDLabel1" runat="server" Text='<%# Eval("TASKID") %>' />
                        <br />
                        <label>TASKNAME:</label>
                        <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' />
                        <br />
                        <label>STARTDATE:</label>
                        <asp:TextBox ID="STARTDATETextBox" runat="server" Text='<%# Bind("STARTDATE") %>' />
                        <br />
                        <label>STATUS:</label>
                        <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                        <br />
                        <label>DUEDATE:</label>
                        <asp:TextBox ID="DUEDATETextBox" runat="server" Text='<%# Bind("DUEDATE") %>' />
                        <br />
                        <div class="button-container">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </div>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <label>TASKID:</label>
                        <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' />
                        <br />
                        <label>TASKNAME:</label>
                        <asp:TextBox ID="TASKNAMETextBox" runat="server" Text='<%# Bind("TASKNAME") %>' />
                        <br />
                        <label>STARTDATE:</label>
                        <asp:TextBox ID="STARTDATETextBox" runat="server" Text='<%# Bind("STARTDATE") %>' />
                        <br />
                        <label>STATUS:</label>
                        <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                        <br />
                        <label>DUEDATE:</label>
                        <asp:TextBox ID="DUEDATETextBox" runat="server" Text='<%# Bind("DUEDATE") %>' />
                        <br />
                        <div class="button-container">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </div>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <label>TASKID:</label>
                        <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Eval("TASKID") %>' />
                        <br />
                        <label>TASKNAME:</label>
                        <asp:Label ID="TASKNAMELabel" runat="server" Text='<%# Bind("TASKNAME") %>' />
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
                        <div class="button-container">
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
    </form>
</body>
</html>
