<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subtasks.aspx.cs" Inherits="WebApplication2.subtasks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" DeleteCommand="DELETE FROM &quot;SUBTASK&quot; WHERE &quot;SUBTASKID&quot; = :SUBTASKID" InsertCommand="INSERT INTO &quot;SUBTASK&quot; (&quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot;, &quot;USERID&quot;) VALUES (:SUBTASKID, :SUBTASKNAME, :SUBTASKSTARTDATE, :SUBTASKDUEDATE, :SUBTASKSTATUS, :TASKID, :USERID)" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT &quot;SUBTASKID&quot;, &quot;SUBTASKNAME&quot;, &quot;SUBTASKSTARTDATE&quot;, &quot;SUBTASKDUEDATE&quot;, &quot;SUBTASKSTATUS&quot;, &quot;TASKID&quot;, &quot;USERID&quot; FROM &quot;SUBTASK&quot;" UpdateCommand="UPDATE &quot;SUBTASK&quot; SET &quot;SUBTASKNAME&quot; = :SUBTASKNAME, &quot;SUBTASKSTARTDATE&quot; = :SUBTASKSTARTDATE, &quot;SUBTASKDUEDATE&quot; = :SUBTASKDUEDATE, &quot;SUBTASKSTATUS&quot; = :SUBTASKSTATUS, &quot;TASKID&quot; = :TASKID, &quot;USERID&quot; = :USERID WHERE &quot;SUBTASKID&quot; = :SUBTASKID">
                <DeleteParameters>
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SUBTASKNAME" Type="String" />
                    <asp:Parameter Name="SUBTASKSTARTDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKDUEDATE" Type="DateTime" />
                    <asp:Parameter Name="SUBTASKSTATUS" Type="String" />
                    <asp:Parameter Name="TASKID" Type="Decimal" />
                    <asp:Parameter Name="USERID" Type="Decimal" />
                    <asp:Parameter Name="SUBTASKID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            &#39;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="SUBTASKID" HeaderText="SUBTASKID" ReadOnly="True" SortExpression="SUBTASKID" />
                    <asp:BoundField DataField="SUBTASKNAME" HeaderText="SUBTASKNAME" SortExpression="SUBTASKNAME" />
                    <asp:BoundField DataField="SUBTASKSTARTDATE" HeaderText="SUBTASKSTARTDATE" SortExpression="SUBTASKSTARTDATE" />
                    <asp:BoundField DataField="SUBTASKDUEDATE" HeaderText="SUBTASKDUEDATE" SortExpression="SUBTASKDUEDATE" />
                    <asp:BoundField DataField="SUBTASKSTATUS" HeaderText="SUBTASKSTATUS" SortExpression="SUBTASKSTATUS" />
                    <asp:BoundField DataField="TASKID" HeaderText="TASKID" SortExpression="TASKID" />
                    <asp:BoundField DataField="USERID" HeaderText="USERID" SortExpression="USERID" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;TASKID&quot;, &quot;TASKNAME&quot; FROM &quot;TASK&quot;"></asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="SUBTASKID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    SUBTASKID:
                    <asp:Label ID="SUBTASKIDLabel1" runat="server" Text='<%# Eval("SUBTASKID") %>' />
                    <br />
                    SUBTASKNAME:
                    <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' />
                    <br />
                    SUBTASKSTARTDATE:
                    <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' />
                    <br />
                    SUBTASKDUEDATE:
                    <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' />
                    <br />
                    SUBTASKSTATUS:
                    <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' />
                    <br />
                    TASKID:
                    <asp:TextBox ID="TASKIDTextBox" runat="server" Text='<%# Bind("TASKID") %>' />
                    <br />
                    USERID:
                    <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    SUBTASKID:
                    <asp:TextBox ID="SUBTASKIDTextBox" runat="server" Text='<%# Bind("SUBTASKID") %>' />
                    <br />
                    SUBTASKNAME:
                    <asp:TextBox ID="SUBTASKNAMETextBox" runat="server" Text='<%# Bind("SUBTASKNAME") %>' />
                    <br />
                    SUBTASKSTARTDATE:
                    <asp:TextBox ID="SUBTASKSTARTDATETextBox" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' />
                    <br />
                    SUBTASKDUEDATE:
                    <asp:TextBox ID="SUBTASKDUEDATETextBox" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' />
                    <br />
                    SUBTASKSTATUS:
                    <asp:TextBox ID="SUBTASKSTATUSTextBox" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' />
                    <br />
                    TASKID:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TASKNAME" DataValueField="TASKID" SelectedValue='<%# Bind("TASKID") %>'>
                    </asp:DropDownList>
                    <br />
                    USERID:
                    <asp:TextBox ID="USERIDTextBox" runat="server" Text='<%# Bind("USERID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    SUBTASKID:
                    <asp:Label ID="SUBTASKIDLabel" runat="server" Text='<%# Eval("SUBTASKID") %>' />
                    <br />
                    SUBTASKNAME:
                    <asp:Label ID="SUBTASKNAMELabel" runat="server" Text='<%# Bind("SUBTASKNAME") %>' />
                    <br />
                    SUBTASKSTARTDATE:
                    <asp:Label ID="SUBTASKSTARTDATELabel" runat="server" Text='<%# Bind("SUBTASKSTARTDATE") %>' />
                    <br />
                    SUBTASKDUEDATE:
                    <asp:Label ID="SUBTASKDUEDATELabel" runat="server" Text='<%# Bind("SUBTASKDUEDATE") %>' />
                    <br />
                    SUBTASKSTATUS:
                    <asp:Label ID="SUBTASKSTATUSLabel" runat="server" Text='<%# Bind("SUBTASKSTATUS") %>' />
                    <br />
                    TASKID:
                    <asp:Label ID="TASKIDLabel" runat="server" Text='<%# Bind("TASKID") %>' />
                    <br />
                    USERID:
                    <asp:Label ID="USERIDLabel" runat="server" Text='<%# Bind("USERID") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
