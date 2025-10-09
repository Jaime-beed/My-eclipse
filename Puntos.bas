B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	Dim FondoUi As ImageView
	Dim FondoUi2 As Panel
	Dim Fondo As ImageView
	Dim Guardar_obj As Guardar
	Dim Ver_Pago_obj As Ver_Pago
	Dim btnGuardarFecha As Button
	Dim buscar As Button
	Dim Tarjeta As ImageView
	Dim ui As WebView
	Dim uif As Panel
	Dim puntosa As Label
	Dim Puntosf As Label
	Dim cangear As Button
	
	Dim eclipse As Typeface
	Dim eclipseparrafo As Typeface
	Dim eclipseparrafocursiva As Typeface
	
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub


'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("Puntos")
	
	LocalStore.EnsureCustomerFile("")
	
	eclipse = Typeface.LoadFromAssets("Kind Daily.ttf")
	eclipseparrafo = Typeface.LoadFromAssets("ZTOtez-Regular.ttf")
	eclipseparrafocursiva = Typeface.LoadFromAssets("ZTOtez-Italic.ttf")
	
	Guardar_obj.Initialize
	B4XPages.AddPage("Guardar",Guardar_obj)
	Ver_Pago_obj.Initialize
	B4XPages.AddPage("Ver_Pago", Ver_Pago_obj)
	
	Fondo.Initialize("Fondo")
	Fondo.Bitmap = LoadBitmap(File.DirAssets, "Fondo App.png") ' Asegúrate de tener fondo.png en Files
	Root.AddView(Fondo,-345dip, -400dip, 1080dip, 1920dip)
	
	AgregarEncabezadoDegradado
	
	
	
	Dim gd As GradientDrawable
	gd.Initialize("TOP_BOTTOM", Array As Int(Colors.RGB(255, 140, 0), Colors.RGB(255, 200, 0))) ' De naranja oscuro a claro
	gd.CornerRadius = 0 ' Sin bordes redondeados
	
	Sleep (1000)
	
	interui
	
	FondoUi2.Initialize("FondoUi2")
	FondoUi2.Background = gd
	Root.AddView(FondoUi2, -10dip, 720dip, 1080dip, 70dip)
	MostrarImagenEnFondoUi
	'load the layout to Root
	
	FondoUi.Initialize("FondoUi")
	Root.AddView(FondoUi, -350dip, 720dip, 1080dip, 70dip)
	FondoUi.Top = 720dip
	FondoUi.Width = 1080dip
	FondoUi.Height = 70dip
	

	ActualizarPuntosEnEstaPage
	

	btnGuardarFecha.Initialize("btnGuardarFecha")
	btnGuardarFecha.Text = ""
	btnGuardarFecha.Color = Colors.Transparent'sin color pq solo quier el click
	'btnGuardarFecha.TextColor = Colors.Black
	Root.AddView(btnGuardarFecha, 0dip, 720dip, 120dip, 70dip)
	
	
	buscar .Initialize("buscar")
	buscar .Text = ""
	buscar .Color = Colors.Transparent 'sin color pq solo quier el click
	'btnGuardarFecha.TextColor = Colors.Black
	Root.AddView(buscar,  120dip, 720dip, 150dip, 70dip)
	
	
	
End Sub

Private Sub interui
	

	Tarjeta.Initialize("Tarjeta")
	Root.AddView(Tarjeta, 05dip, 60dip, 375dip,190dip) ' Ajusta posición/tamaño
	Tarjeta.Color = Colors.Transparent
	
	MostrarImagenEnFondoUi2
	
		
	uif.Initialize("uif")
	uif.Color=Colors.ARGB(128, 0, 0, 0)
	Root.AddView(uif, -10dip, 250dip, 400dip,500dip)
	
	ui.Initialize("ui")
	QuitarScrollBars(ui)
	Root.AddView(ui, -10dip, 250dip, 400dip,500dip)

	
	MostrarImagenEnFondoui3
	
	' --- después de tu AddView ---
	puntosa.Initialize("puntosa")
	puntosa.Color = Colors.Transparent
	puntosa.TextColor = Colors.White
	puntosa.TextSize = 22
	puntosa.Typeface=eclipseparrafocursiva
	puntosa.Gravity = Gravity.CENTER_VERTICAL
	Root.AddView(puntosa, 35dip, 303dip, 100dip, 30dip)
	
	
	Puntosf.Initialize("puntosf")
	Puntosf.Color = Colors.Transparent
	Puntosf.TextColor = Colors.White
	Puntosf.TextSize = 18
	Puntosf.Typeface=eclipseparrafocursiva
	Puntosf.Gravity = Gravity.CENTER_VERTICAL
	ActualizarPuntosFaltantes
	Root.AddView(Puntosf, 210dip, 645dip, 90dip, 60dip)
   ' <- muestra los puntos al crear la UI
   
   
	cangear.Initialize("cangear")
	cangear.Text = ""
	cangear.Color = Colors.Transparent'sin color pq solo quier el click
	'btnGuardarFecha.TextColor = Colors.Black
	Root.AddView(cangear, 17dip, 655dip, 170dip, 40dip)
	

	
End Sub

' Refresca cada vez que la página aparece (opcional)




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


Sub MostrarImagenEnFondoUi
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Puntos.png?alt=media&token=7a94ca96-c58f-4bd1-bff6-e2091d5af74f"
	CargarImagenEscaladaDesdeWeb(url, FondoUi)
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
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Tarjeta%20de%20puntos.png?alt=media&token=80690044-3b54-4b58-8370-640fa573acc0"
	CargarImagenEscaladaDesdeWeb2(url, Tarjeta)
End Sub




Private Sub btnGuardarFecha_Click
	'Sleep(500)
	B4XPages.ShowPageAndRemovePreviousPages("Guardar")
End Sub

Private Sub buscar_Click
	B4XPages.ShowPageAndRemovePreviousPages("Ver_Pago")
End Sub

Private Sub cangear_click
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://api.whatsapp.com/send/?phone=5219971804304&text&type=phone_number&app_absent=0")
	StartActivity(intent)
End Sub
'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Private Sub AgregarEncabezadoDegradado
	Dim Encabezado As Panel
	Encabezado.Initialize("")
	Root.AddView(Encabezado, 0, 0, 110%x, 60dip)

	Dim gd As GradientDrawable
	Dim colores() As Int = Array As Int(Colors.RGB(88, 0, 130), Colors.RGB(30, 0, 60))
	gd.Initialize("RIGHT_LEFT", colores)
	Encabezado.Background = gd

	Dim lblTitulo As Label
	lblTitulo.Initialize("")
	lblTitulo.Text = "Puntos de luz"
	lblTitulo.Typeface=eclipse
	lblTitulo.TextColor = Colors.White
	lblTitulo.TextSize = 26
	lblTitulo.Gravity = Gravity.CENTER
	Encabezado.AddView(lblTitulo, 0, 0, 100%x, 60dip)
End Sub

Sub CargarEnWebViewui3(url As String, wv As WebView, fitMode As String)
	Tarjeta.Visible=True
	Dim fit As String = fitMode.ToLowerCase
	If fit <> "contain" And fit <> "cover" And fit <> "fill" And fit <> "none" Then fit = "contain"

	Dim html As String = $"
<html>
<head>
<meta name='viewport' content='width=device-width, initial-scale=1, user-scalable=no'>
<style>
  html,body{ margin:0; height:100%; background:transparent; }
  img{ width:100%; height:100%; object-fit:${fit}; object-position:center center; display:block; }
</style>
</head>
<body>
  <img src='${url}'>
</body>
</html>"$

	wv.Color = Colors.Transparent
	wv.LoadHtml(html)
End Sub


' Detecta si la URL apunta a un GIF (considerando querystrings tipo Firebase).


'--- Tu método de mostrar (ahora usando WebView) ---
Sub MostrarImagenEnFondoui3
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Ui%20Puntos.gif?alt=media&token=861ddd99-7c25-4b8f-bbdb-b306692c15a3"
	CargarEnWebViewui3(url, ui, "contain") ' o "cover", "fill", "none"
End Sub


Sub QuitarScrollBars(wv As WebView)
	Dim jo As JavaObject = wv
	jo.RunMethod("setVerticalScrollBarEnabled", Array(False))
	jo.RunMethod("setHorizontalScrollBarEnabled", Array(False))
End Sub


Public Sub B4XPage_Appear
	ActualizarPuntosEnEstaPage
	ActualizarPuntosFaltantes
End Sub


' Refresca cada vez que la page aparece
' Lee el primer valor de puntos no vacío entre los 3 slots
' Lee el primer puntosX.txt NO vacío (X=1..3)
' ===== Helpers de lectura sobre el LocalStore NUEVO (.json por cliente) =====
' ==== Lee puntos del único cliente guardado ====
' Llama esto una sola vez cuando se crea la página

' ==== Actualiza el label con los puntos guardados en el archivo único ====
Public Sub ActualizarPuntosEnEstaPage
    If puntosa.IsInitialized = False Then Return

    ' Lee el único cliente del LocalStore
    Dim m As Map = LocalStore.LoadSingleCustomer

    Dim pts As Int = 0
    If m.IsInitialized Then
		pts = LocalStore.GetIFromMap(m, "puntos_total")   ' usa el helper del LocalStore
    End If

    puntosa.Text = pts
End Sub

' === Lee los puntos actuales del único cliente guardado en LocalStore ===
Private Sub LeerPuntosActual As Int
	Dim m As Map = LocalStore.LoadSingleCustomer     ' usa tu LocalStore “único archivo”
	If m.IsInitialized And m.ContainsKey("puntos_total") And m.Get("puntos_total") <> Null Then
		Dim o As Object = m.Get("puntos_total")
		Try
			Return o                                 ' si ya es Int/Long/Double
		Catch
			Dim s As String = "" & o
			If IsNumber(s) Then Return s
		End Try
	End If
	Return 0
End Sub

' === Actualiza el label con los puntos faltantes para llegar a 400 ===
Private Sub ActualizarPuntosFaltantes
	If Puntosf.IsInitialized = False Then Return
	
	Dim objetivo As Int = 400
	Dim pts As Int = LeerPuntosActual
	Dim faltan As Int = objetivo - pts

	If faltan > 0 Then
		Puntosf.Text = "    "&faltan&" pts"& CRLF&" ¡Ya casi!"
	Else
		' Ya llegó o superó la meta
		Puntosf.Text = "¡Meta lograda!"
	End If
End Sub


