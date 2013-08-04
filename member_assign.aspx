<%@ Page Title="Weekly Member Assignments" Language="VB" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="false" CodeFile="member_assign.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CenterContentPlaceHolder" Runat="Server">
    <div id="content">
        <br />
        <table style="width: 100%;">
            <tr>
                <td style="height: 18px; width: 100px;" valign="top">
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="lblSelectWeek" runat="server" Font-Bold="True" 
                        Text="Select the week:"></asp:Label>
                    <br />
                    <br />
                    <asp:ListBox ID="lbxAssemblyDate" runat="server" DataSourceID="dsAssemblyDate" 
                        DataTextField="date" DataValueField="id" style="text-align: left; margin-right: 0px;" 
                        Rows="10" AutoPostBack="True" Width="90px">
                    </asp:ListBox>
                    <asp:SqlDataSource ID="dsAssemblyDate" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                        SelectCommand="select assembly_id as id, date_format(assembly_date, '%m/%d/%y') as date 
                                        from assembly
                                        where assembly_date &gt; (dayofmonth(current_date) - 60)
                                        and type_id = 1
                                        order by assembly_date desc;">
                    </asp:SqlDataSource>
                    &nbsp;
                </td>
                <td style="height: 18px; text-align: left; width: 125px;" valign="top">
                  <h2>Sunday Assembly</h2>
                        &nbsp;<asp:DataList ID="dlSunday" runat="server" DataSourceID="dsSunday" 
                        Width="125px">
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="role_nameLabel" runat="server" 
                                Text='<%# Eval("role_name") %>' Font-Bold="True" />
                            :<br />
                            &nbsp;<asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="dsSunday" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                        
                        ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                        SelectCommand="select role_name, concat(last_name,', ',first_name) as name
                                        from member, assembly_roles, assembly_member_roles
                                        where member.member_id = assembly_member_roles.member_id
                                        and assembly_roles.role_id = assembly_member_roles.role_id
                                        and assembly_id = (select (max(assembly_id) -1) from assembly)
                                        order by assembly_roles.role_id;"></asp:SqlDataSource>
                </td>
                <td style="height: 18px; width: 150px; text-align: left;" valign="top">
                  <h2>Thursday Assembly</h2>
                  &nbsp;<asp:DataList ID="dlThursday" runat="server" DataSourceID="dsThursday" 
                        Width="125px">
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="role_nameLabel" runat="server" Text='<%# Eval("role_name") %>' 
                                Font-Bold="True" />
                            :<br />
                            &nbsp;<asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="dsThursday" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:church_dbConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:church_dbConnectionString.ProviderName %>" 
                        SelectCommand="select role_name, concat(last_name,', ',first_name) as name
                                        from member, assembly_roles, assembly_member_roles
                                        where member.member_id = assembly_member_roles.member_id
                                        and assembly_roles.role_id = assembly_member_roles.role_id
                                        and assembly_id = (select max(assembly_id) from assembly)
                                        order by assembly_roles.role_id;"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
   </div>
</asp:Content>


