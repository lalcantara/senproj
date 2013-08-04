
Partial Class Login
    Inherits System.Web.UI.Page
    'Login button click event
    Protected Sub LoginButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LoginButton.Click
        'Static data for username and password
        Dim UserNameCollection() As String = {"admin", "LAlcantara", "SBond"}
        Dim PasswordCollection() As String = {"password", "password", "password"}

        'Compares username and password and redirects to correct page
        For Iterator As Integer = 0 To UserNameCollection.Length - 1
            Dim UserNameIsValid As Boolean = (String.Compare(UserName.Text, UserNameCollection(Iterator), True) = 0)
            Dim PasswordIsValid As Boolean = (String.Compare(Password.Text, PasswordCollection(Iterator), False) = 0)

            If UserNameIsValid AndAlso PasswordIsValid Then
                FormsAuthentication.RedirectFromLoginPage(UserName.Text, False)
            End If
        Next



    End Sub
End Class
'LOGIN CONTROL FROM ANOTHER APPLICATION----NEEDS TO BE MODIFIED AND TESTED
'Dim iCount As Integer ' this integer is declared to help count the number of imes a user tried to login.
'Dim frmMain As New MainScreen ' this line declares a variable that will point the user to the Main Screen upon a successful login.  The second form created is called MainScreen.vb
'Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click
'    'The connection string is used to describe the type of database, the security information and the location to the database.
'    Dim ConString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Password="""";User ID=Admin;Data Source=""databasename.mdb"";"
'    'Create a new connection object and assign the ConString Connection String above
'    Dim DBCon As New OleDb.OleDbConnection(ConString)
'    ' g_login is a global variable defined in a Module that captures the login name and passes it from form to form.  To create this, just create a Module, say Module1.vb and in it put "Public g_login as String" {g meaning global and login to represent the global login}
'    g_login = Me.txtUsername.Text

'    Dim strPassword As String = Me.txtPassword.Text

'    If g_login = "" Or strPassword = "" Then
'        MessageBox.Show("You are missing information. Please make sure that both the username and password fields are filled out.", "Missing Info")
'        Me.txtUsername.Focus()
'        Return
'    End If
'    ' The database has two fields in the Users table.  A UserID field, which is the primary key and declared as a text.  The other field is Password, which is a text as well.
'    Dim strsql As String = "SELECT [UserID], [Password] FROM Users WHERE [UserID]='" & g_login & "' "

'    Dim cm As New OleDb.OleDbCommand(strsql, DBCon)
'    Dim dr As OleDb.OleDbDataReader
'    Dim valid As Boolean = False
'    Dim HasRows As Boolean = False
'    Try
'        DBCon.Open()
'        dr = cm.ExecuteReader
'        If dr.HasRows Then
'            While dr.Read
'                If strPassword = dr.Item("Password") Then
'                    valid = True
'                End If
'            End While
'            HasRows = True
'        End If
'        dr.Close()
'    Catch exO As OleDb.OleDbException
'        MessageBox.Show(exO.Message)
'    Catch ex As Exception
'        MessageBox.Show(ex.Message)
'    Finally
'        If DBCon.State = ConnectionState.Open Then
'            DBCon.Close()
'        End If
'        cm = Nothing
'        dr = Nothing
'        DBCon.Dispose()
'        GC.Collect()
'    End Try
'    iCount = iCount + 1
'    If valid = True Then
'        Me.Hide()
'        frmMain.Show()
'    ElseIf iCount = 3 Then
'        MessageBox.Show("Contact Safreak!", "Invalid Info")
'        Me.Close()
'    ElseIf HasRows = False Then
'        MessageBox.Show("Invalid user name, try again!", "Invalid Info")
'        Me.txtUsername.Focus()
'        Me.txtUsername.Text = ""
'        Me.txtPassword.Text = ""
'    Else
'        MessageBox.Show("Invalid password, try again!", "Invalid Info")
'        Me.txtPassword.Focus()
'        Me.txtPassword.Text = ""
'    End If

'End Sub

'SECOND LOGIN CONTROL
' Import the ODBC namespace for MySQL Connection
'Imports System.Data.Odbc
'Partial Class login
'    Inherits System.Web.UI.Page

'    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
'        Dim cn As New OdbcConnection("Driver={MySQL ODBC 3.51 Driver};Server=localhost;Database=mydb; User=root;Password=;")
'        cn.Open()
'        Dim cmd As New OdbcCommand("Select * from login where username=? and password=?", cn)

'        'Add parameters to get the username and password

'        cmd.Parameters.Add("@username", OdbcType.VarChar)
'        cmd.Parameters("@username").Value = Me.Login1.UserName

'        cmd.Parameters.Add("@password", OdbcType.VarChar)
'        cmd.Parameters("@password").Value = Me.Login1.Password

'        Dim dr As OdbcDataReader
'        ' Initialise a reader to read the rows from the login table.
'        ' If row exists, the login is successful

'        dr = cmd.ExecuteReader

'        If dr.HasRows Then
'            e.Authenticated = True
'            ' Event Authenticate is true
'        End If

'    End Sub
'End Class