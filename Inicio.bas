B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@
#Region Shared Files
#CustomBuildAction: folders ready, %WINDIR%\System32\Robocopy.exe,"..\..\Shared Files" "..\Files"
'Ctrl + click to sync files: ide://run?file=%WINDIR%\System32\Robocopy.exe&args=..\..\Shared+Files&args=..\Files&FilesSync=True
#End Region

'Ctrl + click to export as zip: ide://run?File=%B4X%\Zipper.jar&Args=Project.zip

Sub Class_Globals

	Private Root As B4XView
	Dim Fondo As ImageView
	Dim Fondo2 As ImageView
	Private xui As XUI
	Dim Iniciar As Button
	Dim LogoFondo As ImageView
	Dim Registro As Button
	Dim qnsomos As Button
	Dim Eventos_obj As Eventos
	Dim Registro_obj As Registro
	Dim Hola As Label
	Dim Cuadrado As Label
	Dim Cuadrado2 As Label
	Dim Puntuanos As Button
	Dim sv As ScrollView
	'Dim Beta As ImageView
	'Dim Beta2 As ImageView
	Dim sv2 As HorizontalScrollView
	Dim unete As Button
	Dim ubi As Button
	Dim Ver_Pago_obj As Ver_Pago
	Dim Problemas_obj As Problemas
	Dim sv3 As HorizontalScrollView
	Private temporizadorCarrusel As Timer
	Private indiceActual As Int = 0
	Private anchoImagen As Int = 210dip ' 200dip + 10dip de espacio
	Private totalImagenes As Int = 0
	' Para carrusel sv3
	Private temporizadorCarrusel3 As Timer
	Private indiceActual3 As Int = 0
	Private anchoImagen3 As Int = 385dip ' 375 + 10 de espacio
	Private totalImagenes3 As Int = 0
	Dim r As Rect
	Dim Fondoui As ImageView
	'


	' Para un efecto aún más fuerte, usa este:
	' Puntuanos.Background = gdMorado3
	' Registro.Background = gdMorado3
	' qnsomos.Background = gdMorado3



	

End Sub

Public Sub Initialize

	Eventos_obj.Initialize
	Registro_obj.Initialize
	Ver_Pago_obj.Initialize
	Problemas_obj.Initialize
	
	
End Sub


 

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("Inicio")

	
	B4XPages.AddPage("Eventos",Eventos_obj)
	B4XPages.AddPage("Registro",Registro_obj)
	B4XPages.AddPage("Ver_Pago",Ver_Pago_obj)
	B4XPages.AddPage("Problemas",Problemas_obj)


	

	Dim eclipse As Typeface
	eclipse = Typeface.LoadFromAssets("Kind Daily.ttf")
	
	Dim eclipseparrafo As Typeface
	eclipseparrafo = Typeface.LoadFromAssets("ZTOtez-Regular.ttf")


	Fondo.Initialize("")
	Fondo.Gravity = Gravity.FILL ' Hace que la imagen se escale para llenar toda la vista
	Fondo.Bitmap = LoadBitmap(File.DirAssets, "Eclipse 16 sep.png")

	' En vez de coordenadas fijas, usa Root.Width y Root.Height para adaptarse a la pantalla
	Root.AddView(Fondo, 0, 0, Root.Width, Root.Height)
	
	sv.Initialize(1000dip)
	Root.AddView(sv,0,0,100%x,100%y)
	Fondo2.Initialize("Fondo2")
	Fondo2.Gravity = Gravity.FILL
	Fondo2.Bitmap = LoadBitmap(File.DirAssets, "Eclipse 16 sep 2.png") ' Asegúrate de tener fondo.png en Files
	sv.Panel.AddView(Fondo2,0, 0, Root.Width, Root.Height)
	

	
	LogoFondo.Initialize("LogoFondo")
	LogoFondo.Bitmap = LoadBitmap(File.DirAssets, "Logo intro.png") ' Asegúrate de tener fondo.png en Files
	Root.AddView(LogoFondo,-50dip, -30dip, 460dip, 250dip)
	
	Puntuanos.Initialize("Puntuanos")
	Puntuanos.Color=Colors.Transparent
	'Puntuanos.TextColor=Colors.White
	Root.AddView(Puntuanos, 210dip, 365dip, 50%x, -2)
	'Puntuanos.Text="Eventos"
	Puntuanos.TextSize=22
	Puntuanos.Width=165dip
	Puntuanos.Height=40dip

	Puntuanos.Typeface=eclipseparrafo
	
	Iniciar.Initialize("Iniciar")
	Iniciar.Color=Colors.Transparent
	Iniciar.TextColor=Colors.Black
	Root.AddView(Iniciar, 210dip, 530dip, 50%x, -2)
	'Iniciar.Text="Fecha de pago"
	Iniciar.TextSize=21
	Iniciar.Width=165dip
	Iniciar.Height=40dip
	Iniciar.Typeface=eclipseparrafo

	
	Registro.Initialize("Registro")
	Registro.Color=Colors.Transparent
	'Registro.TextColor=Colors.White
	Root.AddView(Registro, 210dip, 420dip, 50%x, -2)
	'Registro.Text="Catálogo"
	Registro.TextSize=22
	Registro.Width=165dip
	Registro.Height=40dip
	Registro.Typeface=eclipseparrafo
	
	qnsomos.Initialize("qnsomos")
	qnsomos.Color=Colors.Transparent
	'qnsomos.TextColor=Colors.White
	Root.AddView(qnsomos,210dip, 475dip, 50%x, -2)
	'qnsomos.Text="Problemas"
	qnsomos.TextSize=22
	qnsomos.Width=165dip
	qnsomos.Typeface=eclipseparrafo
	qnsomos.Height=40dip
	
	ubi.Initialize("ubi")
	ubi.Color=Colors.Transparent
	'ubi.TextColor=Colors.Black
	Root.AddView(ubi,210dip, 310dip, 50%x, -2)
	'ubi.Text="Ubicación"
	ubi.TextSize=22
	ubi.Width=165dip
	ubi.Height=40dip
	ubi.Typeface=eclipseparrafo
	
	Sleep(2000)
	Cuadrado.Initialize("Cuadrado")
	Cuadrado.Color=Colors.ARGB(100, 255, 154,0)
	Cuadrado.Text=" "
	Root.AddView(Cuadrado,-10dip,290dip,0,0)
	Cuadrado.Width=800dip
	Cuadrado.Height=300dip	
	
	Cuadrado2.Initialize("Cuadrado2")
	Cuadrado2.Color=Colors.ARGB(128, 0, 0, 0)
	Cuadrado2.Text=" "
	Root.AddView(Cuadrado2,200dip,285dip,0,0)
	Cuadrado2.Width=300dip
	Cuadrado2.Height=305.9dip
	
	Dim gd As GradientDrawable
	Dim colores() As Int = Array As Int(Colors.ARGB(245, 88, 0, 130), Colors.ARGB(245, 30, 0, 60))
	gd.Initialize("RIGHT_LEFT", colores)
	
	Hola.Initialize("Hola")
	Hola.TextColor = Colors.White
	Hola.TextSize = 20
	Hola.Gravity = Gravity.CENTER
	Hola.Typeface = eclipse
	Hola.Background = gd
	' Gradiente
	
	

	' Añade con tamaño consistente (400x70) y centrado
	Root.AddView(Hola, (100%x - 400dip)/2, 220dip, 400dip, 70dip)

	' Texto por defecto (opcional; se sobreescribe abajo)
	Hola.Text = "Hola, rayo de sol. Bienvenido, ¿que quieres hacer hoy?"

	' Lee nombre1.txt y actualiza (usa solo primer nombre si así lo haces en tu sub)
	ActualizarSaludoEnEstaPage


	Fondoui.Initialize("FondoUi")
	Root.AddView(Fondoui, 40dip, 290dip, 500dip, 300dip)
	Fondoui.Top = 290dip
	Fondoui.Width = 500dip
	Fondoui.Height = 300dip
	
	
	
	sv2.Initialize(200dip,300dip)
	Root.AddView(sv2,02.7dip, 290dip, 200dip, 300dip)
	
	sv3.Initialize(750dip,190dip)
	Root.AddView(sv3,05dip, 600dip, 375dip, 190dip)
	

	MostrarImagenEnFondoUi2
	
	
	

	unete.Initialize("unete")
	unete.Color=Colors.Transparent
	unete.Height=50dip
	unete.Width=615dip
	sv2.Panel.AddView(unete,0dip, 250dip,615dip ,50dip )
	
	MostrarCarruselDesdeFirebase
		
	MostrarCarruselDesdeFirebase3
	
End Sub


' Aclara u oscurece un color. p>0 aclara (0 a 1), p<0 oscurece (-1 a 0)

' Devuelve la primera palabra del nombre (o el mismo si no hay espacios)


'-Clicks-'

Private Sub unete_Click()'Accion imagenes chicas
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://wa.me/5219971804304")
	StartActivity(intent)
End Sub

Private Sub Puntuanos_Click ()'Eventos
	B4XPages.ShowPageAndRemovePreviousPages("Eventos")
	
End Sub
Private Sub qnsomos_click'Problemas


ToastMessageShow("Funcion no disponible por el momento",True)
	
'B4XPages.ShowPageAndRemovePreviousPages("Problemas")
	
End Sub

Private Sub Iniciar_Click'f_pago
	B4XPages.ShowPageAndRemovePreviousPages("Ver_Pago")
	
	
	
End Sub


Private Sub ubi_Click
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://maps.app.goo.gl/RmB8hSLAtwmQdg3H6")
	StartActivity(intent)
End Sub

Private Sub Registro_Click 'Catalogo
	
	ToastMessageShow("Funcion no disponible por el momento",True)
	'B4XPages.ShowPageAndRemovePreviousPages("Registro")
	
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
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Botones.png?alt=media&token=9c6e2b62-3cce-49de-85f4-11f4b304141b"
	CargarImagenEscaladaDesdeWeb2(url, Fondoui)
End Sub

Sub CargarImagenEscaladaDesdeWeb(url As String, iv As ImageView)
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
			' Imagen más ancha que el contenedor
			anchoFinal = contenedorAncho
			altoFinal = contenedorAncho / ratioOriginal
		Else
			' Imagen más alta que el contenedor
			altoFinal = contenedorAlto
			anchoFinal = contenedorAlto * ratioOriginal
		End If

		Dim bmpEscalado As Bitmap
		bmpEscalado.InitializeMutable(contenedorAncho, contenedorAlto)
		Dim cvs As Canvas
		cvs.Initialize2(bmpEscalado)

		' Definir el rectángulo donde se dibujará la imagen centrada
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

Sub CargarImagenEscaladaDesdeWeb3(url As String, iv As ImageView)
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
			' Imagen más ancha que el contenedor
			anchoFinal = contenedorAncho
			altoFinal = contenedorAncho / ratioOriginal
		Else
			' Imagen más alta que el contenedor
			altoFinal = contenedorAlto
			anchoFinal = contenedorAlto * ratioOriginal
		End If

		Dim bmpEscalado As Bitmap
		bmpEscalado.InitializeMutable(contenedorAncho, contenedorAlto)
		Dim cvs As Canvas
		cvs.Initialize2(bmpEscalado)

		' Definir el rectángulo donde se dibujará la imagen centrada
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




Sub temporizadorCarrusel_Tick
	indiceActual = indiceActual + 1
	If indiceActual >= totalImagenes Then indiceActual = 0

	Dim nuevoScrollX As Int = indiceActual * anchoImagen
	sv2.ScrollPosition = nuevoScrollX
End Sub

Sub temporizadorCarrusel3_Tick
	indiceActual3 = indiceActual3 + 1
	If indiceActual3 >= totalImagenes3 Then indiceActual3 = 0

	Dim nuevoScrollX As Int = indiceActual3 * anchoImagen3
	sv3.ScrollPosition = nuevoScrollX
End Sub

Sub MostrarCarruselDesdeFirebase
	
	Dim urls() As String = Array As String( _
  "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Tidal.png?alt=media&token=0d379ea6-f03d-41a6-9ef2-36092a6f828b", _ '1
  "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Donacion.png?alt=media&token=f6411416-5b20-4595-ba3f-dc6aae006293") _ '2
  '"https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/3.png?alt=media&token=6f638a14-5afb-42c7-a175-5e92d1402a09") '3
	Dim ancho As Int = 200dip
	Dim alto As Int = 300dip
	Dim espacio As Int = 05dip
	totalImagenes = urls.Length

	' Inicializar temporizador
	temporizadorCarrusel.Initialize("temporizadorCarrusel", 15000) ' 10,000 ms = 10 seg
	temporizadorCarrusel.Enabled = True

	sv2.Panel.Width = (ancho + espacio) * urls.Length

	For i = 0 To urls.Length - 1
		Dim iv As ImageView
		iv.Initialize("")
		Dim posX As Int = i * (ancho + espacio)
		sv2.Panel.AddView(iv, posX, 0, ancho, alto)

		CargarImagenEscaladaDesdeWeb(urls(i), iv)
	Next
End Sub

Private Sub AbrirUrl(u As String)
	Dim i As Intent
	i.Initialize(i.ACTION_VIEW, u)
	StartActivity(i)
End Sub


Private Sub btnCarrusel3_Click
	Dim b As Button = Sender
	Dim idx As Int = b.Tag

	Select idx
		Case 0
			
			AbrirUrl("https://wa.me/5219971804304")
			' Abrir página interna
		 ' cambia por tu Page ID
		Case 1
			AbrirUrl("https://perfiles-eclipse.jimdosite.com/lo-nuevo/")
		Case 2
			' Otra página interna
			AbrirUrl("https://perfiles-eclipse.jimdosite.com/lo-nuevo/") ' ejemplo
		Case 3
			' Otra URL externa
			AbrirUrl("https://wa.me/5219971804304")
			
		Case 4
			' Otra URL externa
			AbrirUrl("https://perfiles-eclipse.jimdosite.com/my-eclipse-app/")
	End Select
End Sub



Sub MostrarCarruselDesdeFirebase3
	Dim urls() As String = Array As String( _
        "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/grito.png?alt=media&token=8f073f58-ee3f-4fdb-b481-2e4c365bd8de", _
        "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Perritos%201.png?alt=media&token=e8df35ee-3db5-4215-9847-16132ee5f77f", _
		"https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Perritos%202.png?alt=media&token=3d6504e3-918c-4d1c-a46f-b4fb30f4397e", _
        "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/d.escu.png?alt=media&token=4bc4a955-856c-471c-b6ed-fca2d953f785", _
        "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Calificanos.png?alt=media&token=8fab8fd6-d909-45d7-ae43-f19b2d9176ce" _
    )

	Dim ancho As Int = 375dip
	Dim alto As Int = 190dip
	Dim espacio As Int = 10dip

	totalImagenes3 = urls.Length
	sv3.Panel.Width = (ancho + espacio) * urls.Length

	For i = 0 To urls.Length - 1
		Dim posX As Int = i * (ancho + espacio)

		' Imagen
		Dim iv As ImageView
		iv.Initialize("")
		sv3.Panel.AddView(iv, posX, 0, ancho, alto)
		CargarImagenEscaladaDesdeWeb3(urls(i), iv)

		' Botón transparente encima (cubre toda la imagen)
		Dim btn As Button
		btn.Initialize("btnCarrusel3")
		btn.Text = ""
		btn.Color = Colors.Transparent
		btn.Tag = i                     ' <- para saber cuál se pulsó
		sv3.Panel.AddView(btn, posX, 0, ancho, alto)
		btn.BringToFront
	Next

	temporizadorCarrusel3.Initialize("temporizadorCarrusel3", 62000)
	temporizadorCarrusel3.Enabled = True
End Sub

' Opcional: deja solo el primer nombre
' opcional: helper para primer nombre
' --- Helper: primer nombre con fallback completo ---
Private Sub PrimerNombre(n As String) As String
    n = n.Trim
    If n.Length = 0 Then Return n
    If n.EqualsIgnoreCase("rayo de sol") Then Return n  ' mantener completo
    Dim p As Int = n.IndexOf(" ")
    If p > -1 Then Return n.SubString2(0, p) Else Return n
End Sub

' --- Lee el primer nombre guardado desde LocalStore (formato por-cliente .json) ---
Private Sub LeerNombreClientePrincipal As String
    Dim L As List = LocalStore.LoadAllCustomers   ' List de Map (cada cliente)
    If L.IsInitialized And L.Size > 0 Then
        Dim m As Map = L.Get(0)
        If m.IsInitialized And m.ContainsKey("nombre") And m.Get("nombre") <> Null Then
            Dim n As String = ("" & m.Get("nombre")).Trim
            If n.Length > 0 Then Return n
        End If
    End If
    Return ""   ' si no hay, devolvemos vacío para que haga fallback
End Sub

' --- Actualiza el saludo en ESTA page ---
Public Sub ActualizarSaludoEnEstaPage
    If Hola.IsInitialized = False Then Return

    Dim nombre As String = LeerNombreClientePrincipal
    If nombre.Length = 0 Then
        nombre = "rayo de sol"              ' fallback completo
    Else
        nombre = PrimerNombre(nombre)       ' solo primera palabra si es real
    End If

    Hola.Text = "Hola, " & nombre & "." & CRLF & "¿Que quieres hacer hoy?"
End Sub

Private Sub B4XPage_Appear
    ActualizarSaludoEnEstaPage
End Sub
