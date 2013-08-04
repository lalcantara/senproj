
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
    'Execute on delete button click'
    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click

        'Create connection, connection string, and command for execution
        Dim conn As New MySql.Data.MySqlClient.MySqlConnection
        Dim connString As String = "Server=localhost;User id=webserver;Password=angelfire;Persist Security Info=True;Database=church_db"
        Dim cmd As New MySql.Data.MySqlClient.MySqlCommand
        'create int for holding the selected assembly id'
        Dim selectedAssembly As Integer = lbxAssemblyDate.SelectedValue

        Try
            'Set connection string, open connection, set command connection'
            conn.ConnectionString = connString
            conn.Open()
            cmd.Connection = conn

            'delete sunday'
            'Set CommandText and type to delete procedure'
            cmd.CommandText = "delete_assmemroles_sp"
            cmd.CommandType = Data.CommandType.StoredProcedure
            cmd.Prepare()
            cmd.Parameters.AddWithValue("@p_id", selectedAssembly)

            'Execute command'
            cmd.ExecuteNonQuery()

            'delete thursday'
            'set selected assembly to next assembly'
            selectedAssembly = selectedAssembly + 1
            'Set new command parameters'
            cmd.Parameters.Clear()
            cmd.Prepare()
            cmd.Parameters.AddWithValue("@p_id", selectedAssembly)

            'Prepare and Execute command'
            cmd.ExecuteNonQuery()

        Catch ex As MySql.Data.MySqlClient.MySqlException
            'Put error text in failure label'
            lblFailureText.Text = "Error " & ex.Number & " has occurred: " & ex.Message
        End Try

        'if connection is open then close the connection'
        If conn.State = Data.ConnectionState.Open Then
            conn.Close()
        End If

        getAssemblyDates()
        Response.Redirect("view_assign.aspx")

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
