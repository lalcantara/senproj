
Partial Class _Default
    Inherits System.Web.UI.Page

    'Executes on page load'
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    'Executes when the public button is clicked'
    Protected Sub btnPublish_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPublish.Click
        Dim firstDay As Date

        'Create connection, connection string, and command for execution
        Dim conn As New MySql.Data.MySqlClient.MySqlConnection
        Dim connString As String = "Server=localhost;User id=webserver;Password=angelfire;Persist Security Info=True;Database=church_db"
        Dim cmd As New MySql.Data.MySqlClient.MySqlCommand

        'get and validate assembly date'
        Try
            firstDay = Date.Parse(tbMonth.Text & "/" & tbDay.Text & "/" & tbYear.Text)
        Catch ex As FormatException
            lblFailureText.Text = "Date entered is invalid"
            tbMonth.Text = ""
            tbDay.Text = ""
            tbYear.Text = ""
        End Try

        'Validate that the day entered is a sunday'
        If firstDay.DayOfWeek <> DayOfWeek.Sunday Then
            lblFailureText.Text = "The day entered must be a Sunday it is currently set to a " & firstDay.DayOfWeek.ToString
        Else

            'Create new database entries'
            Try
                'Set connection string, open connection, set command connection'
                conn.ConnectionString = connString
                conn.Open()
                cmd.Connection = conn

                'create Sunday assembly'
                'Set CommandText and type to delete procedure'
                cmd.CommandText = "add_assembly_sp"
                cmd.CommandType = Data.CommandType.StoredProcedure
                cmd.Prepare()
                'add parameters
                cmd.Parameters.AddWithValue("@p_date", firstDay)
                cmd.Parameters.AddWithValue("@p_tid", 1)

                'Execute command'
                cmd.ExecuteNonQuery()

                'add data to assembly_member_roles'
                addAssignment(conn, firstDay, ddlWelcomer1.SelectedValue, 1)
                addAssignment(conn, firstDay, ddlOPrayer1.SelectedValue, 2)
                addAssignment(conn, firstDay, ddlFReader1.SelectedValue, 3)
                addAssignment(conn, firstDay, ddlSReader1.SelectedValue, 4)
                addAssignment(conn, firstDay, ddlSLeader1.SelectedValue, 5)
                addAssignment(conn, firstDay, ddlTableHead.SelectedValue, 6)
                addAssignment(conn, firstDay, ddlTableServer.SelectedValue, 7)
                addAssignment(conn, firstDay, ddlCPrayer1.SelectedValue, 8)

                'Clear command parameters'
                cmd.Parameters.Clear()

                'add new parameters'
                firstDay = firstDay.AddDays(4)
                cmd.Parameters.AddWithValue("@p_date", firstDay)
                cmd.Parameters.AddWithValue("@p_tid", 2)

                'Execute command'
                cmd.ExecuteNonQuery()

                'add data to assembly_member_roles'
                addAssignment(conn, firstDay, ddlWelcomer2.SelectedValue, 1)
                addAssignment(conn, firstDay, ddlOPrayer2.SelectedValue, 2)
                addAssignment(conn, firstDay, ddlFReader2.SelectedValue, 3)
                addAssignment(conn, firstDay, ddlSReader2.SelectedValue, 4)
                addAssignment(conn, firstDay, ddlSLeader2.SelectedValue, 5)
                addAssignment(conn, firstDay, ddlCPrayer2.SelectedValue, 8)

                'reset date textboxes'
                tbMonth.Text = ""
                tbDay.Text = ""
                tbYear.Text = ""

            Catch ex As MySql.Data.MySqlClient.MySqlException
                'Put error text in failure label'
                lblFailureText.Text = "Error " & ex.Number & " has occurred: " & ex.Message
            End Try

            'Close connection'
            If conn.State = Data.ConnectionState.Open Then
                conn.Close()
            End If
        End If

    End Sub

    'Adds new entry into the assembly roles table'
    '@param conn - the connection to the database used to execute the procedure'
    '@param assembly_date - the date of the assembly '
    '@param member_id - the id of the member '
    '@param role_id - the id of the role'
    Protected Sub addAssignment(ByVal conn As MySql.Data.MySqlClient.MySqlConnection, ByVal assembly_date As Date, _
                                ByVal member_id As String, ByVal role_id As Integer)
        'new mysql command'
        Dim cmd As New MySql.Data.MySqlClient.MySqlCommand

        Try
            'set command connection, text, type
            cmd.Connection = conn
            cmd.CommandText = "add_assmemrole_sp"
            cmd.CommandType = Data.CommandType.StoredProcedure
            cmd.Prepare()

            'add command parameters'
            cmd.Parameters.AddWithValue("@p_aDate", assembly_date)
            cmd.Parameters.AddWithValue("@p_mid", member_id)
            cmd.Parameters.AddWithValue("@p_rid", role_id)

            'execute command'
            cmd.ExecuteNonQuery()
        Catch ex As MySql.Data.MySqlClient.MySqlException
            'Put error text in failure label'
            lblFailureText.Text = "Error " & ex.Number & " has occurred: " & ex.Message
        End Try

    End Sub
End Class
