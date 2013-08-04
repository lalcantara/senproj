
Partial Class _Default
    Inherits System.Web.UI.Page
    'Execute on page load'
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lbxAssemblyDate.SelectedIndex = 0
        End If

    End Sub
    'Execute on selection of assembly date in list box'
    Protected Sub lbxAssemblyDate_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbxAssemblyDate.SelectedIndexChanged

        getAssemblyDates()

    End Sub
    'gets a list of assembly dates and fills the lbxAssembly date'
    'gets the assembly data for the currently selected week  and fills the datalists'
    Protected Sub getAssemblyDates()
        Dim selectedAssembly As Integer = lbxAssemblyDate.SelectedValue

        Dim selectCommand As String = "select role_name, concat(last_name,', ',first_name) as name " _
         & "from(member, assembly_roles, assembly_member_roles) " _
         & "where(member.member_id = assembly_member_roles.member_id) " _
         & "and assembly_roles.role_id = assembly_member_roles.role_id " _
         & "and assembly_id = (select max(" _
         & selectedAssembly.ToString & ") from assembly) order by assembly_roles.role_id;"

        dsSunday.SelectCommand = selectCommand

        selectedAssembly = selectedAssembly + 1

        selectCommand = "select role_name, concat(last_name,', ',first_name) as name " _
         & "from(member, assembly_roles, assembly_member_roles) " _
         & "where(member.member_id = assembly_member_roles.member_id) " _
         & "and assembly_roles.role_id = assembly_member_roles.role_id " _
         & "and assembly_id = (select max(" _
         & selectedAssembly.ToString & ") from assembly) order by assembly_roles.role_id;"

        dsThursday.SelectCommand = selectCommand
    End Sub
End Class
