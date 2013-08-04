<%@ Page Title="Generate Assignment Sheet" Language="VB" Debug ="true"  MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="false" CodeFile="create_assign.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CenterContentPlaceHolder" Runat="Server">
    <div id="content">
    <div id ="assignment_links" style="text-align: center">Create Assignment Sheets&nbsp;&nbsp; |&nbsp;&nbsp; 
      <a href="view_assign.aspx" title="view_assign">View or Delete Assignment Sheets</a><br />
        <br />
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td style="width: 250px; text-align: left; font-weight: 700;">
                    Enter the date of the first day of the week:<br />
                </td>
                <td style="text-align: left">
                    &nbsp;Month / Day / Year&nbsp;&nbsp;&nbsp;&nbsp;
                     <br />
                     <asp:TextBox ID="tbMonth" runat="server" Width="25px" Height="24px" 
                        MaxLength="2"></asp:TextBox>
                    &nbsp; <asp:TextBox ID="tbDay" runat="server" Width="25px" Height="24px" 
                        MaxLength="2"></asp:TextBox>
                    &nbsp; <asp:TextBox ID="tbYear" runat="server" Width="45px" Height="24px" 
                        MaxLength="4"></asp:TextBox>
                    &nbsp;&nbsp; Example: 08/13/2009</td>
            </tr>
        </table>
        <br />
        </div>
     
     <table style="width:600px; height: 190px;">
          <tr>
              <td style="width: 280px" valign="top">
                  <h2>Sunday Assembly</h2>
                  <p>A &#39;*&#39; indicates the volunteer has opted into the task</p>
                        Welcomer:<br />
                      <asp:DropDownList ID="ddlWelcomer1" runat="server" 
                          DataSourceID="SqlDataSource1" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role1_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role1_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Opening Prayar:<br />
                      <asp:DropDownList ID="ddlOPrayer1" runat="server" 
                          DataSourceID="SqlDataSource2" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role2_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role2_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      First Reader:<br />
                      <asp:DropDownList ID="ddlFReader1" runat="server" 
                          DataSourceID="SqlDataSource3" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role3_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role3_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Second Reader:<br />
                      <asp:DropDownList ID="ddlSReader1" runat="server" 
                          DataSourceID="SqlDataSource4" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role4_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role4_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Song Leader:<br />
                      <asp:DropDownList ID="ddlSLeader1" runat="server" 
                          DataSourceID="SqlDataSource5" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role5_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role5_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Table Head:<br />
                      <asp:DropDownList ID="ddlTableHead" runat="server" 
                          DataSourceID="SqlDataSource6" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role6_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role6_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Tabler Server:<br />
                      <asp:DropDownList ID="ddlTableServer" runat="server" 
                          DataSourceID="SqlDataSource7" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role7_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role7_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Closing Prayer:<br />
                      <asp:DropDownList ID="ddlCPrayer1" runat="server" 
                          DataSourceID="SqlDataSource8" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role8_vw)
                                        union
                                        (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role8_vw));"></asp:SqlDataSource>
                  </p>
              </td>
              <td valign="top">
                  <h2>Thursday Assembly</h2>
                  <p>&nbsp;</p>
                  <p>Welcomer:<br />
                      <asp:DropDownList ID="ddlWelcomer2" runat="server" 
                          DataSourceID="SqlDataSource9" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role1_vw)
                                        union
                                            (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role1_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Opening Prayer:<br />
                      <asp:DropDownList ID="ddlOPrayer2" runat="server" 
                          DataSourceID="SqlDataSource10" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role2_vw)
                                        union
                                            (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role2_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      First Reader:<br />
                      <asp:DropDownList ID="ddlFReader2" runat="server" 
                          DataSourceID="SqlDataSource11" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role3_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role3_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Second Reader:<br />
                      <asp:DropDownList ID="ddlSReader2" runat="server" 
                          DataSourceID="SqlDataSource12" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role5_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role5_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Song Leader:<br />
                      <asp:DropDownList ID="ddlSLeader2" runat="server" 
                          DataSourceID="SqlDataSource13" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role5_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role5_vw));"></asp:SqlDataSource>
                      <br />
                      <br />
                      Closing Prayer:<br />
                      <asp:DropDownList ID="ddlCPrayer2" runat="server" 
                          DataSourceID="SqlDataSource14" 
                          DataTextField="name" 
                          DataValueField="member_id">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                          ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                          SelectCommand="(select member_id, name
                                            from member_role8_vw)
                                        union
                                         (select member_id, name
                                            from volunteer_vw
                                            where member_id not in
                                            (select member_id
                                            from member_role8_vw));"></asp:SqlDataSource>
                  </p>
                  <p>
                      <br />
                      <asp:Label ID="lblFailureText" runat="server" ForeColor="Red"></asp:Label>
                      <br />
                  </p>
              </td>
          </tr>
          <tr>
            <td style="width: 280px" valign="top"></td>
            <td style="text-align: center" valign="top"><asp:Button ID="btnPublish" 
                    runat="server" Text="Publish" PostBackUrl="~/create_assign.aspx" /></td>
          </tr>
      </table>
     </p>
   </div>
</asp:Content>

