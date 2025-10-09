B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore

	Dim Bienvenida As Label
	Dim Nombre As EditText
	Dim Iniciar As Button
	Dim Pin As EditText
	Private VTTS As TTS
	Dim Fondo As ImageView
	Dim Promo As ImageView
	Dim Nomr As String
	Dim Pinr As String
	Dim recomendacionr As Label
	Dim web As WebView
	Dim Volver As Button
    Dim recup As Button
	Dim abrir As Button
	Dim pnl As Panel
	
	Dim Recuperacion_obj As Recuperar
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	'load the layout to Root
	Root.LoadLayout("Inicio")
	VTTS.Initialize("VTTS")
	Recuperacion_obj.Initialize
	B4XPages.AddPage("Recuperacion",Recuperacion_obj)
	
	Volver.Initialize("Volver")
	Volver.Color=Colors.RGB(255, 154, 0)
	Volver.TextColor=Colors.Black
	Root.AddView(Volver, 200dip, 720dip, 50%x, -2)
	Volver.Text="Menu Principal"
	Volver.TextSize=16
	Volver.Width=165dip
	
	Fondo.Initialize("Fondo")
	Fondo.Bitmap = LoadBitmap(File.DirAssets, "Background.png") ' Asegúrate de tener fondo.png en Files
	Root.AddView(Fondo,-350dip, -50dip, 1080dip, 1920dip)
	
	Bienvenida.Initialize("Bienvenida")
	Bienvenida.Text = "Inicio de Sesion"
	Bienvenida.TextColor=	Colors.White
	Bienvenida.Typeface = Typeface.DEFAULT_BOLD
	Bienvenida.Typeface = Typeface.SANS_SERIF
	Bienvenida.Gravity = Gravity.CENTER
	Root.AddView(Bienvenida, (100%x - 500dip) / 2, -05dip, 90%x, -2)
	Bienvenida.TextSize = 30
	Bienvenida.Width=500dip
	Bienvenida.Height=60dip
	Dim gd As GradientDrawable
	Dim colores() As Int = Array As Int(Colors.RGB(88, 0, 130), Colors.RGB(30, 0, 60))  ' Mostaza a naranja
	gd.Initialize("RIGHT_LEFT", colores)
	gd.CornerRadius = 12dip
	Bienvenida.Background = gd

	Nombre.Initialize("Nombre")
	Nombre.Hint="Numero celular"
	Nombre.HintColor=Colors.Black
	Nombre.TextSize = 18
	Nombre.TextColor = Colors.Black
	Nombre.Color = Colors.White
	Nombre.Gravity = Gravity.CENTER
	Root.AddView(Nombre,  (100%x - 350dip) / 2, 85dip, 90%x, -2)
	Nombre.Width=350dip
	Nombre.Height=50dip
	Nombre.InputType = 0x0002

	Pin.Initialize("Pin")
	Pin.Hint="Pin de seguridad"
	Pin.HintColor=Colors.Black
	Pin.TextSize = 18
	Pin.TextColor = Colors.Black
	Pin.Color = Colors.White
	Pin.Gravity = Gravity.CENTER
	Root.AddView(Pin,  (100%x - 350dip) / 2, 150dip, 90%x, -2)
	Pin.Width=350dip
	Pin.Height=50dip
	Pin.InputType = 0x0002

	Iniciar.Initialize("Iniciar")
	Iniciar.Color=Colors.RGB(255, 205, 0)
	Iniciar.TextColor=Colors.Black
	Root.AddView(Iniciar, 180dip, 210dip, 50%x, -2)
	Iniciar.Text="Iniciar Sesion"
	Iniciar.TextSize=18
	Iniciar.Width=185dip
	
	recup.Initialize("recup")
	recup.Color=Colors.RGB(255, 205, 0)
	recup.TextColor=Colors.Black
	Root.AddView(recup, 180dip, 265dip, 50%x, -2)
	recup.Text="Recuperar cuenta"
	recup.TextSize=18
	recup.Width=185dip
	
	Promo.Initialize("Promo")
	Promo.Bitmap = LoadBitmap(File.DirAssets, "Promo.png") ' Asegúrate de tener fondo.png en Files
	Root.AddView(Promo, 20dip, 213dip, 150dip, 100dip)
	
	recomendacionr.Initialize("recomendacionr")
	recomendacionr.Text = "Si no tiene creado una cuenta con anterioridad favor de registrarse"
	recomendacionr.TextColor=	Colors.Black
	recomendacionr.Typeface = Typeface.DEFAULT_BOLD
	recomendacionr.Typeface = Typeface.SANS_SERIF
	recomendacionr.Gravity = Gravity.CENTER
	Root.AddView(recomendacionr, (100%x - 350dip)/2, 320dip, 90%x, -2)
	recomendacionr.Width=350dip
	recomendacionr.TextSize = 10
	recomendacionr.Color=Colors.RGB(255, 154, 0)
	
	web.Initialize("web")
	Root.AddView(web, (100%x - 350dip)/2, 350dip, 350dip, 350dip) ' Ocupa toda la pantalla
	web.LoadUrl("https://perfiles-eclipse.jimdosite.com/contactenos/")
	
	abrir.Initialize("abrir")
	abrir.Color=Colors.Transparent
	abrir.TextColor=Colors.Black
	Root.AddView(abrir, 150dip, 350dip, 50%x, -2)
	abrir.Text=" "
	abrir.TextSize=16
	abrir.Height=350dip
	abrir.Width=50dip
	
	'Iniciar.Text = "Iniciar Sesión"
End Sub



Private Sub Volver_Click()
	B4XPages.ShowPageAndRemovePreviousPages("MainPage")
	abrir.Visible=True
	recup.Color=Colors.RGB(88, 0, 130)
	recup.TextColor=Colors.White
	web.Visible=True
End Sub

Private Sub recup_Click()
    B4XPages.ShowPage("Recuperacion")
	recup.Color=Colors.Gray
	abrir.Visible=False
	recup.TextColor=Colors.Black
	Iniciar.Color=Colors.RGB(88, 0, 130)
	Iniciar.TextColor=Colors.White
	'Root.Color=Colors.Transparent
	

End Sub

Sub Pin_TextChanged (Old As String, New As String)
	If New.Length > 4 Then
		Pin.Text = Old
		Pin.SelectionStart = Old.Length
	End If
End Sub

Sub Nombre_TextChanged (Old As String, New As String)
	If New.Length > 10 Then
		Nombre.Text = Old
		Nombre.SelectionStart = Old.Length
	End If
End Sub
Sub ShowCustomToast(Text As String, Parent As B4XView)

	pnl.Initialize("")
	Dim xpnl As B4XView = pnl

	' Crear etiqueta
	Dim lbl As Label
	lbl.Initialize("")
	lbl.Text = Text
	lbl.TextColor = Colors.Black
	lbl.TextSize = 16
	lbl.Gravity = Gravity.CENTER
	pnl.AddView(lbl, 10dip, 0, 300dip, 40dip)

	' Fondo degradado
	Dim gd As GradientDrawable
	Dim colores() As Int = Array As Int(Colors.ARGB(230, 255, 204, 0), Colors.ARGB(230, 255, 160, 80))
	gd.Initialize("RIGHT_LEFT", colores)
	gd.CornerRadius = 12dip
	pnl.Background = gd

	' Calcular altura visible
	Dim r As Rect = GetVisibleFrame(Parent)
	Dim heightDiff As Int = 100%y - (r.Bottom - r.Top)

	Dim top As Int
	If heightDiff > 100dip Then
		top = r.Bottom - 120dip
	Else
		top = 100%y - 180dip
	End If

	' Mostrar el panel en la vista actual (Parent)
	Parent.AddView(pnl, (100%x - 320dip)/2, top, 320dip, 40dip)

	' Animación
	xpnl.Alpha = 0
	xpnl.SetAlphaAnimated(300, 1)
	Sleep(1000)
	xpnl.SetAlphaAnimated(1000, 0)
	Sleep(1000)
	xpnl.RemoveViewFromParent
End Sub


Private Sub abrir_Click()
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://perfiles-eclipse.jimdosite.com/contactenos/")
	StartActivity(intent)
End Sub

Private Sub Iniciar_Click
	
	IniciarSesion
	
    Nombre.Text=""
	Pin.Text=""
	Iniciar.Color=Colors.Gray
	Iniciar.TextColor=Colors.Black
End Sub

Sub IniciarSesion()
	Dim pinIngresado As String = Pin.Text.Trim
	Dim numeroIngresado As String = Nombre.Text.Trim

	If numeroIngresado = "" Or pinIngresado = "" Then
		ShowCustomToast("Escribe tu número y pin", Root)
		Return
	End If

	Iniciar.Enabled = False ' Prevenir múltiples clics

	Dim job As HttpJob
	job.Initialize("login", Me)
	job.Download("https://my-eclipse-bb053-default-rtdb.firebaseio.com/usuarios.json")
End Sub


Sub JobDone(job As HttpJob)
	If job.Success Then
		Select job.JobName
			Case "login"
				If job.GetString = "null" Then
					ShowCustomToast("No hay usuarios registrados", Root)
					Return
				End If

				Dim parser As JSONParser
				parser.Initialize(job.GetString)
				Dim usuariosMap As Map = parser.NextObject

				Dim numeroIngresado As String = Nombre.Text.Trim
				Dim pinIngresado As String = Pin.Text.Trim

				For Each key As String In usuariosMap.Keys
					Dim usuario As Map = usuariosMap.Get(key)
					If usuario.ContainsKey("numero") And usuario.ContainsKey("pin") Then
						Dim numeroBD As String = usuario.Get("numero")
						Dim pinBD As String = "" & usuario.Get("pin")

						Log($"Verificando: ${numeroBD} vs ${numeroIngresado}, PIN: ${pinBD} vs ${pinIngresado}"$)

						If numeroBD.Trim = numeroIngresado And pinBD.Trim = pinIngresado Then
							B4XPages.ShowPageAndRemovePreviousPages("Menu_Principal")
							Return
						End If
					End If
				Next

				ShowCustomToast("Número o PIN incorrecto", Root)
		End Select
	Else
		ShowCustomToast("Error de red: " & job.ErrorMessage, Root)
	End If
	Iniciar.Enabled = True
	job.Release
End Sub



Sub GetVisibleFrame(v As View) As Rect
	Dim jo As JavaObject = v
	Dim outRect As JavaObject
	outRect.InitializeNewInstance("android.graphics.Rect", Null)
	jo.RunMethod("getWindowVisibleDisplayFrame", Array(outRect))
	Dim r As Rect
	r.Initialize(outRect.GetField("left"), outRect.GetField("top"), outRect.GetField("right"), outRect.GetField("bottom"))
	Return r
End Sub






	
'Private Sub Anterior_Click()
	
'	ToastMessageShow("Sesion cerrada",True)
'	B4XPages.ShowPageAndRemovePreviousPages("Intro")
'End Sub


''Private Sub Registro_Click
	'Dim Nom As String = Nombre.Text.Trim
	'Dim Pinn As String = Pin.Text.Trim

	'If Nom <> "" And Pinn <> "" Then
		'File.WriteString(File.DirInternal, "nombre.txt", Nom)
		'File.WriteString(File.DirInternal, "pin.txt", Pinn)
		'Sleep(5000) ' Espera 5 segundos
		'ToastMessageShow("Datos guardados correctamente", True)
		'Registro.Color=Colors.DarkGray
		'Registro.TextColor=Colors.White
	'Else
	'	ToastMessageShow("Debe ingresar nombre y PIN para registrarse", True)
	'	Iniciar.Color=Colors.Red
	'	Iniciar.TextColor=Colors.Gray
	'	Registro.Color=Colors.Red
	'	Registro.TextColor=Colors.Gray
	'End If
''End Sub

	
'Private Sub donde_Click ()
		
'	Dim intent As Intent
'	intent.Initialize(intent.ACTION_VIEW, "https://maps.app.goo.gl/DCYzA6bGzRUKF6Hc9")
'	StartActivity(intent)
	'qnsomos.Color=Colors.RGB(255, 140, 0)
	'qnsomos.TextColor=Colors.Black
	'donde.Color=Colors.Gray
	'donde.TextColor=Colors.White
'End Sub



'donde.Color=Colors.RGB(255, 140, 0)
	'donde.TextColor=Colors.Black
	'Root.AddView(donde, 30dip, 405dip, 50%x, -2)
	'donde.Text="Donde nos ubicamos"
	'donde.TextSize=16
	
	'logo.Initialize("logo")
	'logo.Bitmap = LoadBitmap(File.DirAssets, "Logo.png") ' Asegúrate de tener fondo.png en Files
	'Root.AddView(logo, 230dip, 330dip, 130dip, 130dip)
	