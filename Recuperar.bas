B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@

Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	
	Dim sv As ScrollView
	Dim Pinr As EditText
	Dim verifi As Button
	Dim Correo As Button
	Dim numeroo As Button
	
	Dim Bienvenida As Label
	Dim pnl As Panel
	Dim x As Button
    Dim equis As ImageView
	Dim nam As EditText
	
	
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("Recuperacion")
	'Root1.Color = Colors.Transparent
	'Fondo.Bitmap = LoadBitmap(File.DirAssets, "Inicio2.png") ' Asegúrate de tener fondo.png en Files
	'Root.AddView(Fondo,10dip, 0dip, 720dip, 1280dip)
	
	sv.Initialize(600dip)
	sv.Color=Colors.Gray
	Root.AddView(sv,(100%x - 350dip)/2, 250dip, 350dip, 550dip)
	'load the layout to Root
	verifi.Initialize("Verifi")
	verifi.Color=Colors.RGB(255, 205, 0)
	verifi.TextColor=Colors.Black
	sv.Panel.AddView(verifi, 190dip, 280dip, 50%x, -2)
	verifi.Text="Recuperar"
	verifi.TextSize=18
	verifi.Width=165dip
	
	Correo.Initialize("Correo")
	Correo.Color=Colors.RGB(255, 154, 0)
	Correo.TextColor=Colors.Black
	sv.Panel.AddView(Correo, 120dip, 350dip, 50%x, -2)
	Correo.Text="Recupera con correo"
	Correo.TextSize=18
	Correo.Width=250dip
	
	numeroo.Initialize("numeroo")
	numeroo.Color=Colors.RGB(255, 154, 0)
	numeroo.TextColor=Colors.Black
	sv.Panel.AddView(numeroo, 120dip, 420dip, 50%x, -2)
	numeroo.Text="Recupera con celular"
	numeroo.TextSize=18
	numeroo.Width=250dip
	
	Bienvenida.Initialize("Bienvenida")
	Bienvenida.Text = "Recuperacion de cuenta"
	Bienvenida.TextColor=	Colors.White
	Bienvenida.Typeface = Typeface.DEFAULT_BOLD
	Bienvenida.Typeface = Typeface.SANS_SERIF
	Bienvenida.Gravity = Gravity.CENTER
	Root.AddView(Bienvenida, (100%x - 500dip) / 2, 250dip, 90%x, -2)
	Bienvenida.TextSize = 30
	Bienvenida.Width=500dip
	Bienvenida.Height=60dip
	Dim gd As GradientDrawable
	Dim colores() As Int = Array As Int(Colors.RGB(88, 0, 130), Colors.RGB(30, 0, 60))  ' Mostaza a naranja
	gd.Initialize("RIGHT_LEFT", colores)
	gd.CornerRadius = 12dip
	Bienvenida.Background = gd
	
	Pinr.Initialize("Pinr")
	Pinr.HintColor=Colors.Black
	Pinr.Hint="Pin de recuperacion o numero"
	Pinr.TextSize = 16
	Pinr.TextColor = Colors.Black
	Pinr.Color = Colors.White
	Pinr.Gravity = Gravity.CENTER
	sv.Panel.AddView(Pinr, -07dip, 100dip, 90%x, -2)
	Pinr.Width=355dip
	Pinr.Height=50dip
	Pinr.InputType = 0x0002
	
	nam.Initialize("nam")
	nam.HintColor=Colors.Black
	nam.Hint="Nombre de usuario o correo"
	nam.TextSize = 16
	nam.TextColor = Colors.Black
	nam.Color = Colors.White
	nam.Gravity = Gravity.CENTER
	sv.Panel.AddView(nam, -07dip, 180dip, 90%x, -2)
	nam.Width=355dip
	nam.Height=50dip

	
	equis.Initialize("equis")
	equis.Bitmap = LoadBitmap(File.DirAssets, "x.png") ' Asegúrate de tener fondo.png en Files
	Root.AddView(equis,350dip, 20dip, 25dip, 25dip)
	
	x.Initialize("x")
	x.Color=Colors.Transparent
	Root.AddView(x,350dip, 20dip, 25dip, 25dip)
	
End Sub

Sub x_Click
	
	B4XPages.ClosePage(Me)
	
End Sub

Sub Pinr_FocusChanged(HasFocus As Boolean)
    If HasFocus Then
        ' Espera un momento para que el teclado aparezca
        Sleep(100)
      
      sv.ScrollToNow(Pinr.Top)
   End If
  
End Sub

Sub Pinr_TextChanged (Old As String, New As String)
	If New.Length > 10 Then
		Pinr.Text = Old
		Pinr.SelectionStart = Old.Length
	End If
End Sub



Sub nam_TextChanged (Old As String, New As String)
	If New.Length > 50 Then
		nam.Text = Old
		nam.SelectionStart = Old.Length
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

Sub JobDone(job As HttpJob)
	If job.Success Then
		Select job.JobName

			Case "recuperar"
				If job.GetString = "null" Then
					ShowCustomToast("No hay usuarios registrados", Root)
					Return
				End If

				Dim parser As JSONParser
				parser.Initialize(job.GetString)
				Dim usuariosMap As Map = parser.NextObject

				Dim NombreIngresado As String = nam.Text.Trim
				Dim pinIngresado As String = Pinr.Text.Trim

				For Each usuarioNombre As String In usuariosMap.Keys
					Dim hijos As Map = usuariosMap.Get(usuarioNombre)

					For Each claveID As String In hijos.Keys
						Dim datos As Map = hijos.Get(claveID)
						Dim numeroBD As String = datos.Get("numero")
						Dim pinRecuBD As String = datos.Get("pin_recu")
						Dim pinNormal As String = datos.Get("pin")

						If usuarioNombre = NombreIngresado And pinRecuBD = pinIngresado Then
							' ✅ Mostrar pin y número al usuario
							xui.MsgboxAsync("Tu número es: " & numeroBD & CRLF & "Tu PIN de acceso es: " & pinNormal, "Recuperación exitosa")
							job.Release
							Return
						End If
					Next
				Next

				ShowCustomToast("Nombre o PIN incorrecto", Root)

			Case "verificarSoloNumero"
				If job.GetString = "null" Then
					ShowCustomToast("No hay usuarios registrados", Root)
					Return
				End If

				Dim parser2 As JSONParser
				parser2.Initialize(job.GetString)
				Dim usuariosMap2 As Map = parser2.NextObject
				Dim numeroBuscado As String = Pinr.Text.Trim

				For Each usuarioNombre As String In usuariosMap2.Keys
					Dim hijos As Map = usuariosMap2.Get(usuarioNombre)

					For Each claveID As String In hijos.Keys
						Dim datos As Map = hijos.Get(claveID)
						Dim numeroBD As String = datos.Get("numero")
						Dim pinRecuBD As String = datos.Get("pin_recu")

						If numeroBD = numeroBuscado Then
							' Abrir app de mensajes con estos datos
							Dim mensaje As String = $"Hola, ${usuarioNombre} es tu nombre de usuario y tu código de recuperación es: ${pinRecuBD}, ya puedes recuperar tu pin normal e iniciar sesion!"$
							Dim i As Intent
							i.Initialize("android.intent.action.SENDTO", "smsto:" & numeroBD)
							i.PutExtra("sms_body", mensaje)
							StartActivity(i)

							job.Release
							Return
						End If
					Next
				Next

				ShowCustomToast("Número no registrado", Root)

		End Select
	Else
		ShowCustomToast("Error de red: " & job.ErrorMessage, Root)
	End If
	job.Release
End Sub


Sub Verifi_Click
	If Pinr.Text = "" Then
		ShowCustomToast("Inserte su código de recuperación", Root)
		Return
	End If

	If Pinr.Text.Length <> 6 Then
		ShowCustomToast("El PINR debe tener 6 dígitos", Root)
		Return
	End If


	If Pinr.Text="" Then
		ShowCustomToast("Inserte su codigo de recuperacion",Root)
	End If
	
	If Pinr.Text.Length  <> 6 Then
		ShowCustomToast("El PINR debe tener 6 digitos",Root)
	End If
	
	
	Dim job As HttpJob
	job.Initialize("recuperar", Me)
	job.Download("https://myeclipseapp-fdc50-default-rtdb.firebaseio.com/usuarios.json")
	
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

Sub numeroo_Click
	
	Dim job As HttpJob
	job.Initialize("verificarSoloNumero", Me)
	job.Download("https://myeclipseapp-fdc50-default-rtdb.firebaseio.com/usuarios.json")
End Sub


'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.