﻿
<!-- Credit: https://asna.com/us/tech/kb/doc/scrolling-web-grid-->

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageDelete.aspx.cs" Inherits="ManageDelete" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
    function warning()
    {
        window.location = "ManageDelete.aspx";;
    }
    window.onbeforeunload = warning;
    </script>
    <style type="text/css">
        html 
        {
           margin: 0px;
           height: 100%;
           width: 100%;
           background-color: aqua;
        }

        body 
        {
           margin: 0px;
           min-height: 100%;
           width: 100%;
           background-color: aqua;
        }
        .scrolling-table-container {
            display: inline-block;
            height: 340px;
            width: 100%;
            overflow-y: scroll;
            overflow-x: scroll;
        }
        .inlineBlockDiv{
            display: inline-block;
            height: 290px;
            overflow-y: scroll;
            overflow-x: scroll;
        }
        .inlineDiv{
            display: inline;
        }
        .blockDiv{
            display: block;
        }
        div{
            padding-bottom: 5px;
        }
        .heading{
            width: 80%;
            text-align:left
        }
    </style>

</head>

<body>
    <form id="form1" runat="server">
        <div class="heading">
            <asp:Label ID="SiteName" runat="server" Text="Reaching For English" Font-Bold="true" Font-Size="72px" Font-Underline="true" ></asp:Label>
            <br />
            <asp:Label ID="lblinfo" runat="server" Text="How would you like to change the database:" ></asp:Label>
            <asp:Button ID="btndeletelink" runat="server" Text="Go To Add Page" OnClick="Btnaddlink_Click" />
            <asp:Button ID="Button1" runat="server" Text="File Viewer" OnClick="Button1_Click" style="margin-left: 20px" />
            <asp:Button ID="btnlogout" runat="server" Text="Log Out" style="z-index: 1; left: 900px; top: 10px; position: absolute;" OnClick="btnlogout_Click"/>
            <br />
        </div>

        <div class="inlineBlockDiv">
            <!-- Table for Country Delete / Edit -->
            <asp:GridView ID="gridCountry" runat="server" AutoGenerateColumns="False" AutoPostBack="True"
                OnRowEditing="Country_OnRowEditing" OnRowCancelingEdit="Country_OnRowCancelingEdit" OnRowUpdating="Country_OnRowUpdating" OnRowDeleting="Country_OnRowDeleting" >
                <Columns>
                    <asp:BoundField HeaderText="Country" DataField="cid" ReadOnly="false"/>
                    <asp:TemplateField HeaderText="Delete">
			            <ItemTemplate>
				            <asp:Button ID="deleteCountry" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this country?');"/>
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="true" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" />
	            </Columns>
            </asp:GridView>
        </div>

        <div class="inlineBlockDiv">
            <!-- Table for Topic Delete / Edit -->
            <asp:GridView ID="gridTopic" runat="server" AutoGenerateColumns="False" AutoPostBack="True"
                OnRowEditing="Topic_OnRowEditing" OnRowCancelingEdit="Topic_OnRowCancelingEdit" OnRowUpdating="Topic_OnRowUpdating" OnRowDeleting="Topic_OnRowDeleting">
                <Columns>
                    <asp:BoundField HeaderText="Topic" DataField="tid" ReadOnly="false"/>
		            <asp:TemplateField HeaderText="Delete">
			            <ItemTemplate>
				            <asp:Button ID="deleteTopic" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this topic?');"/>
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="true" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" />
	            </Columns>
            </asp:GridView>
        </div>

        <div class="inlineBlockDiv">
            <!-- Table for Country_Grade Delete -->
            <asp:GridView ID="gridCountryGrade" runat="server" AutoGenerateColumns="False" AutoPostBack="True"
                 OnRowDeleting="CountryGrade_OnRowDeleting">
                <Columns>
                    <asp:BoundField HeaderText="Country" DataField="cid"/>
                    <asp:BoundField HeaderText="Grade" DataField="gid"/>
		            <asp:TemplateField HeaderText="Delete">
			            <ItemTemplate>
				            <asp:Button ID="deleteCountryGrade" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this country grade?');"/>
			            </ItemTemplate>
		            </asp:TemplateField>
	            </Columns>
            </asp:GridView>
        </div>

        

        <div class="inlineBlockDiv">
            <!-- Table for Country_Grade_Topic Delete -->
            <asp:GridView ID="gridCountryGradeTopic" runat="server" AutoGenerateColumns="False" AutoPostBack="True"
                OnRowDeleting="CountryGradeTopic_OnRowDeleting" Width="480px">
                <Columns>
                    <asp:BoundField HeaderText="Country" DataField="cid"/>
                    <asp:BoundField HeaderText="Grade" DataField="gid"/>
                    <asp:BoundField HeaderText="Topic" DataField="tid"/>
		            <asp:TemplateField HeaderText="Delete">
			            <ItemTemplate>
				            <asp:Button ID="deleteCountryGradeTopic" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this country grade topic? This will remove all lessons associated with it as well.');"/>
			            </ItemTemplate>
		            </asp:TemplateField>
	            </Columns>
            </asp:GridView>
        </div>

        <div class="scrolling-table-container">
            <!-- Table for Lesson Delete / Edit -->
            <asp:GridView ID="gridLesson" runat="server" AutoGenerateColumns="False" AutoPostBack="True" OnRowDataBound="Lesson_DataBound"
                OnRowEditing="Lesson_OnRowEditing" OnRowCancelingEdit="Lesson_OnRowCancelingEdit" OnRowUpdating="Lesson_OnRowUpdating" OnRowDeleting="Lesson_OnRowDeleting">
                <Columns>
                    <asp:BoundField HeaderText="Country" DataField="cid" ReadOnly="true"/>
                    <asp:BoundField HeaderText="Grade" DataField="gid" ReadOnly="true"/>
                    <asp:BoundField HeaderText="Topic" DataField="tid" ReadOnly="true"/>
                    <asp:BoundField HeaderText="Title" DataField="lid"/>
                    <asp:BoundField HeaderText="Text" DataField="text"/>
                    <asp:BoundField HeaderText="Filename" DataField="filename" ReadOnly="true"/>
		            <asp:TemplateField HeaderText="Delete">
			            <ItemTemplate>
				            <asp:Button ID="deleteLesson" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirm('Are you sure you want to delete this country grade?');"/>
			            </ItemTemplate>
		            </asp:TemplateField>
                    <asp:CommandField HeaderText="Edit" ShowEditButton="true" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel" />
	            </Columns>
            </asp:GridView>
        </div>
        
        
        
        
        
        
        
            <!-- Error Labels -->
            <asp:Label ID="errormsgDB" runat="server" style="z-index: 1; left: 809px; top: 35px; position: absolute"></asp:Label>
            <asp:TextBox ID="tblog" runat="server" TextMode="MultiLine" style="z-index: 1; left: 1120px; top: 34px; position: absolute; height: 376px; width: 223px;"></asp:TextBox>
        


            <asp:Label ID="lblLogBox" runat="server" Text="Log Box:" style="z-index: 1; left: 1121px; top: 11px; position: absolute; width: 75px;"></asp:Label>
            <asp:Button ID="btnClearLog" runat="server" Text="Clear Log" style="z-index: 1; left: 1267px; top: 8px; position: absolute;" OnClick="ClearLog_Click"/>

        
            <!-- Timer -->
            <asp:ScriptManager ID="scriptManager_timer" runat="server" />
            <asp:Timer ID="timerEmail" OnTick="EmailTimerTick" runat="server" Interval="60000" />
            

    </form>
</body>
</html>
