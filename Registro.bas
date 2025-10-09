B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@

Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore

	Dim Fondo As ImageView
	Dim Bienvenida As Label
	Dim sv As ScrollView
	Dim Registro As Button
	Dim Porque As Button
	Dim info As Label
	Dim Terminos As CheckBox
	Dim x As ImageView
	Dim Nombre As EditText          ' <-- Usuario de Instagram (sin @)
	Dim Name As EditText            ' <-- Nombre completo
	Dim Correo As EditText
	Dim Num As EditText             ' <-- Número celular (10 dígitos MX)
	Dim Meses As EditText  
	Dim Eventos_obj As Eventos         ' <-- Meses como cliente (número)
	
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("Registro")
	Eventos_obj.Initialize
	B4XPages.AddPage("Eventos",Eventos_obj)
	'load the layout to Root
	sv.Initialize(1000dip)
	Root.AddView(sv,0,0,100%x,100%y)
	
	Dim eclipse As Typeface
	eclipse = Typeface.LoadFromAssets("Kind Daily.ttf")
	
	Dim eclipseparrafo As Typeface
	eclipseparrafo = Typeface.LoadFromAssets("ZTOtez-Regular.ttf")
	
	Dim eclipseparrafocursiva As Typeface
	eclipseparrafocursiva = Typeface.LoadFromAssets("ZTOtez-Italic.ttf")
	
	Bienvenida.Initialize("Bienvenida")
	Bienvenida.Text = "Registro de cuenta"
	Bienvenida.TextColor=	Colors.White
	Bienvenida.Typeface = eclipseparrafo
	Bienvenida.Gravity = Gravity.CENTER
	Root.AddView(Bienvenida, 150dip, 15dip, 90%x, -2)
	Bienvenida.TextSize = 20
	Bienvenida.Width=250dip
	Bienvenida.Height=60dip
	
	Dim gd As GradientDrawable
	Dim colores() As Int = Array As Int(Colors.RGB(88, 0, 130), Colors.RGB(30, 0, 60))  ' Mostaza a naranja
	gd.Initialize("RIGHT_LEFT", colores)
	gd.CornerRadius = 12dip
	Bienvenida.Background = gd
		
	Fondo.Initialize("Fondo")
	Fondo.Bitmap = LoadBitmap(File.DirAssets, "Background.png") ' Asegúrate de tener fondo.png en Files
	sv.Panel.AddView(Fondo,-350dip, -50dip, 1080dip, 1920dip)
	
	Root = Root1
	Root.LoadLayout("Registro") ' si tu layout existe; no es obligatorio para este código
	sv.Initialize(1000dip)
	Root.AddView(sv, 0, 0, 100%x, 100%y)

	' Fondo (opcional)
	Fondo.Initialize("Fondo")
	Fondo.Bitmap = LoadBitmap(File.DirAssets, "Background.png")
	sv.Panel.AddView(Fondo, -350dip, -50dip, 1080dip, 1920dip)

	' Título
	Bienvenida.Initialize("Bienvenida")
	Bienvenida.Text = "Registro de eventos"
	Bienvenida.TextColor = Colors.White
	Bienvenida.Typeface = eclipse
	Bienvenida.Gravity = Gravity.CENTER
	Root.AddView(Bienvenida, 150dip, 15dip, 90%x, -2)
	Bienvenida.TextSize = 20
	Bienvenida.Width = 250dip
	Bienvenida.Height = 60dip
	Dim gd As GradientDrawable
	Dim colores() As Int = Array As Int(Colors.RGB(88, 0, 130), Colors.RGB(30, 0, 60))
	gd.Initialize("RIGHT_LEFT", colores)
	gd.CornerRadius = 12dip
	Bienvenida.Background = gd

	' Usuario de Instagram (sin @)
	Nombre.Initialize("Nombre")
	Nombre.Hint = "Usuario de Instagram (sin @)"
	Nombre.HintColor = Colors.Black
	Nombre.TextSize = 18
	Nombre.TextColor = Colors.Black
	Nombre.Color = Colors.White
	Nombre.Gravity = Gravity.CENTER
	Nombre.Typeface = eclipseparrafo
	sv.Panel.AddView(Nombre, (100%x - 350dip) / 2, 90dip, 90%x, -2)
	Nombre.Width = 350dip
	Nombre.Height = 50dip

	' Nombre completo
	Name.Initialize("Name")
	Name.Hint = "Nombre completo"
	Name.HintColor = Colors.Black
	Name.TextSize = 18
	Name.TextColor = Colors.Black
	Name.Color = Colors.White
	Name.Gravity = Gravity.CENTER
	Name.Typeface = eclipseparrafo
	sv.Panel.AddView(Name, (100%x - 350dip) / 2, 170dip, 90%x, -2)
	Name.Width = 350dip
	Name.Height = 50dip

	' Correo electrónico
	Correo.Initialize("Correo")
	Correo.Hint = "Correo electrónico"
	Correo.HintColor = Colors.Black
	Correo.TextSize = 18
	Correo.TextColor = Colors.Black
	Correo.Color = Colors.White
	Correo.Gravity = Gravity.CENTER
	Correo.Typeface = eclipseparrafo
	sv.Panel.AddView(Correo, (100%x - 350dip) / 2, 250dip, 90%x, -2)
	Correo.Width = 350dip
	Correo.Height = 50dip

	' Número de teléfono (10 dígitos)
	Num.Initialize("Num")
	Num.Hint = "Número celular (10 dígitos)"
	Num.HintColor = Colors.Black
	Num.TextSize = 18
	Num.TextColor = Colors.Black
	Num.Color = Colors.White
	Num.Typeface=eclipseparrafo
	Num.Gravity = Gravity.CENTER
	sv.Panel.AddView(Num, (100%x - 350dip) / 2, 330dip, 90%x, -2)
	Num.Width = 350dip
	Num.Height = 50dip
	Num.InputType = 0x0002 ' numérico

	' Meses como cliente
	Meses.Initialize("Meses")
	Meses.Hint = "¿Hace cuántos meses es cliente?"
	Meses.HintColor = Colors.Black
	Meses.TextSize = 18
	Meses.TextColor = Colors.Black
	Meses.Color = Colors.White
	Meses.Gravity = Gravity.CENTER
	Meses.Typeface=eclipseparrafo
	sv.Panel.AddView(Meses, (100%x - 350dip) / 2, 410dip, 90%x, -2)
	Meses.Width = 350dip
	Meses.Height = 50dip
	Meses.InputType = 0x0002 ' numérico
	
	Registro.Initialize("Registro")
	Registro.Color=Colors.RGB(255, 205, 0)
	Registro.TextColor=Colors.Black
	sv.Panel.AddView(Registro, 210dip, 550dip, 50%x, -2)
	Registro.Text="Registrarse"
	Registro.Typeface=eclipseparrafo
	Registro.TextSize=18
	Registro.Width=165dip

	Porque.Initialize("Porque")
	Porque.Color=Colors.RGB(88, 0, 130)
	Porque.TextColor=Colors.White
	sv.Panel.AddView(Porque, (100%x - 390dip) / 2, 610dip, 50%x, -2)
	Porque.Text="Porque necesitamos estos datos?"
	Porque.Typeface=eclipseparrafo
	Porque.TextSize=20
	Porque.Width=390dip
	
	info.Initialize("info")
	info.Text = "texto de prueba"
	info.TextColor=	Colors.Red
	info.Typeface =eclipseparrafocursiva
	info.Gravity = Gravity.CENTER
	sv.Panel.AddView(info,(100%x - 350dip) / 2 , 670dip, 100%x, -2)
	info.TextSize = 14
	info.Width=350dip
	info.Height=200dip
	info.Color=Colors.LightGray
	info.Visible=False
	
	Terminos.Initialize("Terminos")
	Terminos.Text="Acepto los terminos y condiciones"
	Terminos.TextColor=Colors.White
	Terminos.Typeface =eclipseparrafo
	Terminos.Gravity = Gravity.CENTER
	Terminos.Color=Colors.RGB(88, 0, 130)
	sv.Panel.AddView(Terminos, (100%x - 350dip) / 2 , 880dip, 100%x, -2)
	Terminos.Width=350dip
	Terminos.Visible=True
	
	Dim btnVolver As Button
	btnVolver.Initialize("btnVolver")
	btnVolver.Color = Colors.Transparent
	sv.Panel.AddView(btnVolver, 10dip, 5dip, 30dip, 30dip)
	
	
	x.Initialize("x")
	sv.Panel.AddView(x, 10dip, 5dip, 30dip, 30dip)
	
	MostrarImagenEnFondoUi2
	
End Sub

Sub ShowCustomToast(Text As String, Parent As B4XView)
	Dim pnl As Panel
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


Sub GetVisibleFrame(v As View) As Rect
	Dim jo As JavaObject = v
	Dim outRect As JavaObject
	outRect.InitializeNewInstance("android.graphics.Rect", Null)
	jo.RunMethod("getWindowVisibleDisplayFrame", Array(outRect))
	Dim r As Rect
	r.Initialize(outRect.GetField("left"), outRect.GetField("top"), outRect.GetField("right"), outRect.GetField("bottom"))
	Return r
End Sub


Private Sub btnVolver_Click()
	
	B4XPages.ShowPageAndRemovePreviousPages("Eventos")
	info.Visible=False
	
	
End Sub

Public Sub Porque_Click ()
	
	info.Text=" Eclipse necesita recopilar sus datos para poder registrar a los usuarios como clientes de la empresa, ademas, datos como el numero de telefono y correo electronico sirven como medios para poder validar su participacion en los eventos y la entrega de su premio en caso de ganar alguno"
	info.Visible=True
	
End Sub

Private Sub RegistrarUsuarioFirebase(instagramUser As String, nombreCompleto As String, correoUsuario As String, numeroUsuario As String, mesesCliente As Int)
	Try
		Dim datos As Map
		datos.Initialize
		datos.Put("instagram", instagramUser)
		datos.Put("nombre_completo", nombreCompleto)
		datos.Put("correo", correoUsuario)
		datos.Put("numero", numeroUsuario)
		datos.Put("meses_cliente", mesesCliente)
		datos.Put("registrado_el", DateTime.Date(DateTime.Now) & " " & DateTime.Time(DateTime.Now))

		Dim gen As JSONGenerator
		gen.Initialize(datos)
		Dim json As String = gen.ToString

		Dim job As HttpJob
		job.Initialize("registro", Me)
		' Guardar bajo nodo principal: Clientes_eventos
		job.PostString("https://my-eclipse-bb053-default-rtdb.firebaseio.com/Clientes_eventos.json", json)
		job.GetRequest.SetContentType("application/json")
	Catch
		ShowCustomToast("Error en los datos. Verifica la información", Root)
	End Try
End Sub

Sub JobDone(job As HttpJob)
	If job.Success Then
		Select job.JobName
			Case "registro"
				' Obtener ID generado por Firebase
				Dim parser As JSONParser
				parser.Initialize(job.GetString)
				Dim respuesta As Map = parser.NextObject
				Dim idFirebase As String = respuesta.Get("name")
				Log("✅ Registro exitoso. ID generado: " & idFirebase)

				' Guardar el ID dentro del mismo nodo
				Dim idMap As Map
				idMap.Initialize
				idMap.Put("id", idFirebase)

				Dim gen2 As JSONGenerator
				gen2.Initialize(idMap)
				Dim json2 As String = gen2.ToString

				Dim job2 As HttpJob
				job2.Initialize("guardar_id", Me)
				job2.PatchString($"https://my-eclipse-bb053-default-rtdb.firebaseio.com/Clientes_eventos/${idFirebase}.json"$, json2)
				job2.GetRequest.SetContentType("application/json")

			Case "guardar_id"
				Log("✅ ID almacenado exitosamente dentro del nodo.")
				ShowCustomToast("Registro completo", Root)
				' Limpiar campos
				Nombre.Text = ""
				Name.Text = ""
				Correo.Text = ""
				Num.Text = ""
				Meses.Text = ""
		End Select
	Else
		Log("❌ Error: " & job.ErrorMessage)
		ShowCustomToast("Error de red: " & job.ErrorMessage, Root)
	End If
	job.Release
End Sub


Public Sub Registro_Click
	Dim instagramUser As String = Nombre.Text.Trim.Replace("@","")
	Dim nombreCompleto As String = Name.Text.Trim
	Dim correoUsuario As String = Correo.Text.Trim
	Dim numeroUsuario As String = Num.Text.Trim
	Dim mesesTxt As String = Meses.Text.Trim

	' Requeridos
	If instagramUser = "" Or nombreCompleto = "" Or correoUsuario = "" Or numeroUsuario = "" Or mesesTxt = "" Then
		ShowCustomToast("Todos los campos son obligatorios", Root)
		Return
	End If

	' IG username
	If Regex.IsMatch("^[a-zA-Z0-9._]{3,30}$", instagramUser) = False Then
		ShowCustomToast("Usuario de Instagram inválido", Root)
		Return
	End If

	' Email (simple)
	If Regex.IsMatch("^[A-Za-z0-9._%+\-]+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$", correoUsuario) = False Then
		ShowCustomToast("Correo electrónico inválido", Root)
		Return
	End If

	' Teléfono MX 10 dígitos
	If Regex.IsMatch("^[0-9]{10}$", numeroUsuario) = False Then
		ShowCustomToast("El número debe tener 10 dígitos", Root)
		Return
	End If

	' Meses cliente 0..240
	If Regex.IsMatch("^[0-9]{1,3}$", mesesTxt) = False Then
		ShowCustomToast("Meses debe ser un número", Root)
		Return
	End If
	Dim mesesCliente As Int = mesesTxt
	If mesesCliente < 0 Or mesesCliente > 240 Then
		ShowCustomToast("Meses fuera de rango (0-240)", Root)
		Return
	End If
	
	If Terminos.Checked=False Then
		ShowCustomToast("Acepte los terminos y condiciones",Root)
	End If

	RegistrarUsuarioFirebase(instagramUser, nombreCompleto, correoUsuario, numeroUsuario, mesesCliente)
End Sub


' -------------------- Validaciones UI --------------------
Sub Nombre_TextChanged (Old As String, New As String)
	' IG: 3-30, letras, números, . _
	If New.Length > 30 Or Regex.IsMatch("^[a-zA-Z0-9._]*$", New) = False Then
		Nombre.Text = Old
		Nombre.SelectionStart = Old.Length
	End If
End Sub

Sub Name_TextChanged (Old As String, New As String)
	If New.Length > 50 Then
		Name.Text = Old
		Name.SelectionStart = Old.Length
	End If
End Sub

Sub Correo_TextChanged (Old As String, New As String)
	If New.Length > 60 Then
		Correo.Text = Old
		Correo.SelectionStart = Old.Length
	End If
End Sub

Sub Num_TextChanged (Old As String, New As String)
	If New.Length > 10 Or Regex.IsMatch("^[0-9]*$", New) = False Then
		Num.Text = Old
		Num.SelectionStart = Old.Length
	End If
End Sub

Sub Meses_TextChanged (Old As String, New As String)
	If New.Length > 3 Or Regex.IsMatch("^[0-9]*$", New) = False Then
		Meses.Text = Old
		Meses.SelectionStart = Old.Length
	End If
End Sub


Sub CargarImagenEscaladaDesdeWeb2(url As String, iv As ImageView)
	Dim j As HttpJob
	j.Initialize("", Me)
	j.Download(url)

	Wait For (j) JobDone(j As HttpJob)
	If j.Success Then
		Dim bmpOriginal As Bitmap = j.GetBitmap
		Dim ratioOriginal As Float = bmpOriginal.Width / bmpOriginal.Height
		Dim contenedorAncho As Int = iv.Width
		Dim contenedorAlto As Int = iv.Height
		Dim ratioContenedor As Float = contenedorAncho / contenedorAlto

		Dim anchoFinal, altoFinal As Int

		If ratioOriginal > ratioContenedor Then
			anchoFinal = contenedorAncho
			altoFinal = contenedorAncho / ratioOriginal
		Else
			altoFinal = contenedorAlto
			anchoFinal = contenedorAlto * ratioOriginal
		End If

		Dim bmpEscalado As Bitmap
		bmpEscalado.InitializeMutable(contenedorAncho, contenedorAlto)
		Dim cvs As Canvas
		cvs.Initialize2(bmpEscalado)

		Dim r As Rect
		Dim offsetX As Int = (contenedorAncho - anchoFinal) / 2
		Dim offsetY As Int = (contenedorAlto - altoFinal) / 2
		r.Initialize(offsetX, offsetY, offsetX + anchoFinal, offsetY + altoFinal)

		cvs.DrawBitmap(bmpOriginal, Null, r)
		iv.Bitmap = bmpEscalado
	Else
		Log("Error al cargar imagen: " & j.ErrorMessage)
	End If
	j.Release
End Sub


Sub MostrarImagenEnFondoUi2
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/x.png?alt=media&token=bcfe9a91-1ac7-4e93-861b-aa60744fbe70"
	CargarImagenEscaladaDesdeWeb2(url, x)
End Sub




'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.