<%@ Page Language="VB" MasterPageFile="MenuMasterPage.master" AutoEventWireup="false" CodeFile="main.aspx.vb" Inherits="_Default" title="Main Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CenterContentPlaceHolder" Runat="Server">

    <!-- 

  CONTENT

  -->
<div id="content-container">
  <!-- 
	
	SIDE COLUMN
	
	-->
    <div id="content-side">
        <div id="Div1">
            <asp:LoginView ID="MainLoginView" runat="server">
              <LoggedInTemplate>
              Welcome: <asp:LoginName ID="MainLoginName" runat="server" /><br />
                <ul class="link-list-vertical">
                  <li><a href="member_assign.aspx" title="Assignments">Member Assignments</a></li>
                  <li><a href="#" title="Articles">Business Reports</a></li>
                  <li><a href="#" title="Directory">Member Directory</a></li>
                  <li><a href="#" title="Manage Profile">Profile</a></li>
                </ul>
              </LoggedInTemplate>
              <AnonymousTemplate>
              Welcome: Guest
              </AnonymousTemplate>
          </asp:LoginView>
          &nbsp;&nbsp;[&nbsp;<asp:LoginStatus ID="MainLoginStatus" runat="server" 
                LogoutAction="Redirect" LogoutPageUrl="~/main.aspx" />&nbsp;]&nbsp;&nbsp;
        </div>
    </div>
  <!-- 
	
	MAIN COLUMN
	
	-->
      <div id="content"><a name="maincontent" id="A1"></a>
      <table style="width:600px; height: 190px;" id="tblMainImg">
          <tr>
              <td>
                  <br />
                  <img alt="Building-Front" longdesc="Front of Carden Academy" 
                      src="default/building_front.jpg" style="width: 318px; height: 171px" 
                      id="imgBuilding" /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        We meet at the Carden Academy</td>
              <td align="left">
                <h4 id="h4MainVerse">Bible Verse, &quot;text text text text text text tex text text text text text 
                    text ...&quot;  <a href="#" id="aVerse1">read more</a> </h4>
              </td>
          </tr>
      </table>
          <asp:DataList ID="dlArticle" runat="server" DataKeyField="title" 
              DataSourceID="dsArticle">
              <ItemTemplate>
                  <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' 
                      Font-Size="Large" Font-Bold="True" />
                  &nbsp;&nbsp;
                  <br />
                  <asp:Label ID="bodyLabel" runat="server" Text='<%# Eval("body") %>' />
                  ...<asp:Label ID="linkLabel" runat="server" 
                      Text="&lt;a href=&quot;#&quot; id=&quot;aVerse1&quot;&gt;read more&lt;/a&gt;"></asp:Label>
                  <br />
                  <br />
                  Submitted by:
                  <asp:Label ID="member_idLabel" runat="server" 
                      Text='<%# Eval("[Submitted by]") %>' />
                  &nbsp;on <asp:Label ID="article_dateLabel" runat="server" 
                      Text='<%# Eval("article_date", "{0:d}") %>' />
                  <br />
              </ItemTemplate>
          </asp:DataList>
          <asp:SqlDataSource ID="dsArticle" runat="server" 
              ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>"      
              ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
              SelectCommand="select title, article_date,  left(body,2500) as 'body', 
                concat(first_name,' ',last_name) as 'Submitted by'
                from article, member
                where article_date = (select max(article_date) from article)
                and article.member_id = member.member_id;"></asp:SqlDataSource>

  <h1 id="h1Announcements">Recent Announcements</h1>
            <asp:GridView ID="gvAnnouncements" runat="server" AutoGenerateColumns="False" 
              BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
              CellPadding="4" DataSourceID="dsAnnouncements" ForeColor="Black" 
              GridLines="Vertical">
                <RowStyle BackColor="#F6F6F6" />
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="Announcement" HeaderText="Announcement" 
                        SortExpression="Announcement"></asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
          </asp:GridView>
            <asp:SqlDataSource ID="dsAnnouncements" runat="server" 
              ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
              ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
              SelectCommand="select date_format(announce_date, '%m-%d-%y') 
                as 'Date', announce_text as 'Announcement'
                from announcement;"></asp:SqlDataSource>

    <div class="clear">
        <br /><br />
    </div>
  
</div>
    </div>
</asp:Content>

