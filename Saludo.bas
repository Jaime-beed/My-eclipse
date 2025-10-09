B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	Private Hola As Label
End Sub

Public Sub Initialize As Object
	Return Me
End Sub

Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1

	' --- tu mismo estilo de label ---
	Hola.Initialize("Hola")
	Hola.TextColor = Colors.White
	Hola.Color = Colors.RGB(88, 0, 130)
	Hola.TextSize = 20
	Hola.Gravity = Gravity.CENTER
	Root.AddView(Hola, (100%x - 400dip)/2, 220dip, 400dip, 70dip)

	Dim gd As GradientDrawable
	Dim colores() As Int = Array As Int(Colors.ARGB(245, 88, 0, 130), Colors.ARGB(245, 30, 0, 60))
	gd.Initialize("RIGHT_LEFT", colores)
	Hola.Background = gd

	' Al crear: usa el nombre completo (si no hay archivo, saluda "rayo de sol")
	ActualizarSaludo(False)
End Sub

Private Sub B4XPage_Appear
	' Cada vez que vuelves a esta page, refresca (muestra solo primer nombre)
	ActualizarSaludo(True)
End Sub

' ===== utils =====
Private Sub PrimerNombre(n As String) As String
	n = n.Trim
	Dim p As Int = n.IndexOf(" ")
	If p > -1 Then Return n.SubString2(0, p) Else Return n
End Sub

' PUBLIC para poder llamarla desde otra page
Public Sub ActualizarSaludo(useFirstName As Boolean)
	Dim nombre As String = ""
	If File.Exists(File.DirInternal, "nombre1.txt") Then
		nombre = File.ReadString(File.DirInternal, "nombre1.txt").Trim
	End If
	If nombre.Length = 0 Then nombre = "rayo de sol"
	If useFirstName Then nombre = PrimerNombre(nombre)

	Hola.Text = $"Hola, ${nombre}. Bienvenido, ¿qué quieres hacer hoy?"$
End Sub
 'see the list of page related events in the B4XPagesManager object. The event name Is B4XPage.