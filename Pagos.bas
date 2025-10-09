B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	Dim x As ImageView
	Dim Fondo As ImageView
    Dim Guardar_obj As Guardar
	Dim Tarjeta As WebView
	Dim ui As ImageView
	Dim domicilio As Button
	Dim domicilio2 As Button
	Dim escuela As Button
	Dim escuela2 As Button
	Dim bbva As Button
	Dim bbva2 As Button
	Dim link As Button
	Dim link2 As Button
	Dim Azteca As Button
	Dim Oxxo As Button
	Dim datosbbva As Button
	Dim Aztecadatos As Button
	Dim Oxxodatos As Button
	Dim hogar As WebView
	Dim info As Label
	Dim Ahog As Button
	
	
	 
	Dim eclipse As Typeface
	eclipse = Typeface.LoadFromAssets("Kind Daily.ttf")
	
	Dim eclipseparrafo As Typeface
	eclipseparrafo = Typeface.LoadFromAssets("ZTOtez-Regular.ttf")
	
	Dim eclipseparrafocursiva As Typeface
	eclipseparrafocursiva = Typeface.LoadFromAssets("ZTOtez-Italic.ttf")

End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("Pagos")
	
	Guardar_obj.Initialize
	B4XPages.AddPage("Guardar",Guardar_obj)
	
	Fondo.Initialize("Fondo")
	Fondo.Bitmap = LoadBitmap(File.DirAssets, "Fondo Tarjeta.png") ' Asegúrate de tener fondo.png en Files
	Root.AddView(Fondo,-345dip, -350dip, 1080dip, 1920dip)
	
	Dim btnVolver As Button
	btnVolver.Initialize("btnVolver")
	btnVolver.Color = Colors.Transparent
	Root.AddView(btnVolver, 10dip, 80dip, 30dip, 50dip)
	
	'load the layout to Root
	MostrarImagenEnFondo
	AgregarEncabezadoDegradado
	x.Initialize("x")
	Root.AddView(x, 10dip, 80dip, 30dip, 30dip)
	
	Sleep(1000)
	interui
	
	
End Sub

Private Sub interui 
	

	
	Tarjeta.Initialize("Tarjeta")
	Root.AddView(Tarjeta, 05dip, 100dip, 375dip,190dip) ' Ajusta posición/tamaño
	QuitarScrollBars(Tarjeta)
	Tarjeta.Color = Colors.Transparent
	
	
	hogar.Initialize("hogar")
	Root.AddView(hogar, 05dip, 120dip, 375dip,190dip) ' Ajusta posición/tamaño
	QuitarScrollBars(hogar)
	hogar.Color = Colors.Black
	hogar.Visible=False
	
	
	Ahog.Initialize("Ahog")
	Root.AddView(Ahog, 05dip, 220dip, 375dip,90dip) ' Ajusta posición/tamaño
	Ahog.Color = Colors.Transparent
	Ahog.Visible=False
	
	info.Initialize("info")
	info.Text = "texto de prueba"
	info.TextColor=	Colors.Red
	info.Typeface =eclipseparrafo
	info.Gravity = Gravity.CENTER
	Root.AddView(info,15dip, 150dip, 0dip,0dip)
	info.TextSize = 14
	info.Width=350dip
	info.Height=100dip
	info.Color=Colors.LightGray
	info.Visible=False
	
	ui.Initialize("ui") 
	Root.AddView(ui, -10dip, 300dip, 400dip,500dip) 
	'ui.Color=Colors.Red
	
	MostrarImagenEnFondoui
	
	
	domicilio.Initialize("domicilio")
	domicilio.Color=Colors.Transparent
	Root.AddView(domicilio,15dip, 360dip, 170dip,50dip)
	
		
	escuela.Initialize("escuela")
	escuela.Color=Colors.Transparent
	Root.AddView(escuela,200dip, 360dip, 170dip,50dip)
	
	
	domicilio2.Initialize("domicilio2")
	domicilio2.Color=Colors.Transparent
	Root.AddView(domicilio2,15dip, 360dip, 170dip,50dip)
	domicilio2.Visible=False
	
		
	escuela2.Initialize("escuela2")
	escuela2.Color=Colors.Transparent
	Root.AddView(escuela2,200dip, 360dip, 170dip,50dip)
	escuela2.Visible=False
	
	
	bbva.Initialize("bbva")
	bbva.Color=Colors.Transparent
	Root.AddView(bbva,15dip, 490dip, 170dip,50dip)
	
	link.Initialize("link")
	link.Color=Colors.Transparent
	Root.AddView(link,200dip, 490dip, 170dip,50dip)
	
		
	bbva2.Initialize("bbva2")
	bbva2.Color=Colors.Transparent
	Root.AddView(bbva2,15dip, 490dip, 170dip,50dip)
	bbva2.Visible=False
	
	link2.Initialize("link2")
	link2.Color=Colors.Transparent
	Root.AddView(link2,200dip, 490dip, 170dip,50dip)
	link2.Visible=False
	
	Azteca.Initialize("Azteca")
	Azteca.Color=Colors.Transparent
	Root.AddView(Azteca,15dip, 630dip, 170dip,50dip)
	
	Oxxo.Initialize("Oxxo")
	Oxxo.Color=Colors.Transparent
	Root.AddView(Oxxo,200dip, 630dip, 170dip,50dip)
	
	
	datosbbva.Initialize("datosbbva")
	datosbbva.Color=Colors.Transparent
	Root.AddView(datosbbva, 330dip, 240dip, 50dip, 50dip)
	datosbbva.Visible=False
	
	Aztecadatos.Initialize("Aztecadatos")
	Aztecadatos.Color=Colors.Transparent
	Root.AddView(Aztecadatos, 330dip, 240dip, 50dip, 50dip)
	Aztecadatos.Visible=False
	
	Oxxodatos.Initialize("Oxxodatos")
	Oxxodatos.Color=Colors.Transparent
	Root.AddView(Oxxodatos, 330dip, 240dip, 50dip, 50dip)
	Oxxodatos.Visible=False
	

	
	
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


Sub MostrarImagenEnFondo
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/x.png?alt=media&token=bcfe9a91-1ac7-4e93-861b-aa60744fbe70"
	CargarImagenEscaladaDesdeWeb(url, x)
End Sub


Sub CargarImagenEscaladaDesdeWebui(url As String, iv As ImageView)
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

Sub MostrarImagenEnFondoui
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Normal.png?alt=media&token=3ab2ce1b-c2ac-434f-85d5-84ce0a2a7c5d"
	CargarImagenEscaladaDesdeWebui(url, ui)
End Sub

Private Sub domicilio_click
	
	MostrarImagenEnFondoui
	hogar.Visible=True
	Ahog.Visible=True
	Tarjeta.Visible=False
	datosbbva.Visible=False
	Aztecadatos.Visible=False
	Oxxodatos.Visible=False
	hogar.LoadUrl("https://maps.app.goo.gl/RmB8hSLAtwmQdg3H6")
	escuela2.Visible=False
	escuela.Visible=True
	domicilio2.Visible=False
	bbva2.Visible=False
	bbva.Visible=True
	link2.Visible=False
	link.Visible=True
	
End Sub

Private Sub Ahog_click
	
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://maps.app.goo.gl/RmB8hSLAtwmQdg3H6")
	StartActivity(intent)
	
End Sub

Sub CargarImagenEscaladaDesdeWebuilink(url As String, iv As ImageView)
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

Sub MostrarImagenEnFondouilink
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Link%20pago.png?alt=media&token=73c672b5-b996-43c6-8b1a-c14f2448d342"
	CargarImagenEscaladaDesdeWebuilink(url, ui)
End Sub

Private Sub link_click
	MostrarImagenEnFondouilink
	datosbbva.Visible=False
	Aztecadatos.Visible=False
	Oxxodatos.Visible=False
	link.Visible=False
	link2.Visible=True
	bbva.Visible=False
	bbva2.Visible=True
	hogar.Visible=False
	Ahog.Visible=False
	escuela2.Visible=False
	escuela.Visible=True
	domicilio2.Visible=False
	domicilio.Visible=True
End Sub


Private Sub link2_click
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://prod.info.spinbyoxxo.com.mx/main/sendMoney/sendMoneyToUserWithQR/Ivannm")
	StartActivity(intent)
End Sub


Sub CargarImagenEscaladaDesdeWebuiescu(url As String, iv As ImageView)
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

Sub MostrarImagenEnFondouiescu
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Entrega%20escuela.png?alt=media&token=1808f39f-da91-4654-a31d-c09afdc804d9"
	CargarImagenEscaladaDesdeWebuiescu(url, ui)
End Sub

Private Sub escuela_click
	MostrarImagenEnFondouiescu
	datosbbva.Visible=False
	Aztecadatos.Visible=False
	Oxxodatos.Visible=False
	escuela.Visible=False
	domicilio.Visible=False
	domicilio2.Visible=True
	escuela2.Visible=True
	Tarjeta.Visible=False
	hogar.Visible=False
	info.Visible=False
	Ahog.Visible=False
End Sub

Private Sub escuela2_click
	info.Visible=True
	info.Text="-Entrega en ITSSY-"&CRLF &"Horario de mañana: 9:30 A.M - 1:00 P.M" &CRLF&"Horario de tarde: 3:00 P.M - 5:00 P.M"&CRLF&"Preguntar por WhatsApp aula o lugar de encuentro"
	datosbbva.Visible=False
	Aztecadatos.Visible=False
	Oxxodatos.Visible=False
	Tarjeta.Visible=False
	hogar.Visible=False
	Ahog.Visible=False
	bbva2.Visible=False
	bbva.Visible=True
	link2.Visible=False
	link.Visible=True
End Sub

Private Sub domicilio2_click
	
	info.Visible=True
	info.Text="-Entrega en el CERT-" &CRLF&"Horario de tarde: 4:00 P.M - 7:00 P.M"&CRLF&"Preguntar por WhatsApp aula o lugar de encuentro"
	datosbbva.Visible=False
	Aztecadatos.Visible=False
	Oxxodatos.Visible=False
	Tarjeta.Visible=False
	hogar.Visible=False
	Ahog.Visible=False
	bbva2.Visible=False
	bbva.Visible=True
	link2.Visible=False
	link.Visible=True
	
End Sub


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
	lblTitulo.Text = "Metodos de Pago"
	lblTitulo.Typeface=eclipse
	lblTitulo.TextColor = Colors.White
	lblTitulo.TextSize = 26
	lblTitulo.Gravity = Gravity.CENTER
	Encabezado.AddView(lblTitulo, 0, 0, 100%x, 60dip)
End Sub

Sub CargarEnWebViewSpin(url As String, wv As WebView, fitMode As String)
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
Sub MostrarImagenEnFondoSpin
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Spin.gif?alt=media&token=69ba14e8-386b-45d9-9804-78dc9c676d9c"
	CargarEnWebViewSpin(url, Tarjeta, "contain") ' o "cover", "fill", "none"
	
End Sub


Private Sub Oxxo_click
	MostrarImagenEnFondoSpin
	MostrarImagenEnFondoui
	datosbbva.Visible=False
	Aztecadatos.Visible=False
	Oxxodatos.Visible=True
	hogar.Visible=False
	Ahog.Visible=False
	info.Visible=False
	escuela2.Visible=False
	escuela.Visible=True
	domicilio2.Visible=False
	domicilio.Visible=True
	bbva2.Visible=False
	bbva.Visible=True
	link2.Visible=False
	link.Visible=True
End Sub

Private Sub Oxxodatos_click
	Dim monto As String = LeerMontoLocal

	' Tus datos (ajústalos si cambian)
	Dim Tarjetas As String      = "4217 4701 8377 2611"
	Dim destinatario As String = "Diego Ivan Magaña Jaime"
	Dim clabe As String        = "7289 6900 0126 1638 04"

	Dim texto As String = _
        $"Importe: $${monto}${CRLF}Tarjeta: ${Tarjetas}${CRLF}Destinatario: ${destinatario}${CRLF}CLABE: ${clabe}"$

	SetClipboardText(texto)
	'ToastMessageShow("Datos de pago copiados al portapapeles.", False)
End Sub



Sub CargarEnWebViewBBVA(url As String, wv As WebView, fitMode As String)
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
Sub MostrarImagenEnFondoBBVA
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/BBVA.gif?alt=media&token=f7027525-fa7c-405b-b744-2b62e76e31fa"
	CargarEnWebViewBBVA(url, Tarjeta, "contain") ' o "cover", "fill", "none"
	
End Sub



Private Sub bbva_click
	MostrarImagenEnFondoBBVA
	MostrarImagenEnFondoui
	datosbbva.Visible=True
	Aztecadatos.Visible=False
	Oxxodatos.Visible=False
	hogar.Visible=False
	Ahog.Visible=False
	info.Visible=False
	escuela2.Visible=False
	escuela.Visible=True
	domicilio2.Visible=False
	domicilio.Visible=True
	bbva2.Visible=False
	bbva.Visible=True
	link2.Visible=False
	link.Visible=True
End Sub

Private Sub bbva2_click
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://bancoazteca.onelink.me/Y9Md/CobroQR?qrData=sagAFlJF4M5WCAx7p0oCvMaFND7NbriZtDSgB6b50wrIH-eAT4WQ7VLVkfPph_To")
	StartActivity(intent)
End Sub

' === BOTÓN ===
' ===== CLICK del botón =====
Private Sub datosbbva_Click
	Dim monto As String = LeerMontoLocal

	' Tus datos (ajústalos si cambian)
	Dim Tarjetas As String      = "4152 3144 1673 5648"
	Dim destinatario As String = "Diego Ivan Magaña Jaime"
	Dim clabe As String        = "012 180 01535363445 3"

	Dim texto As String = _
        $"Importe: $${monto}${CRLF}Tarjeta: ${Tarjetas}${CRLF}Destinatario: ${destinatario}${CRLF}CLABE: ${clabe}"$

	SetClipboardText(texto)
	'ToastMessageShow("Datos de pago copiados al portapapeles.", False)
End Sub

' ===== Portapapeles sin Phone (compatible B4XPages) =====
' ===== Portapapeles sin Phone (compatible B4XPages) =====
' ===== Portapapeles (funciona en B4XPages y módulos normales) =====
Private Sub SetClipboardText(t As String)
	Try
		Dim ctx As JavaObject
		ctx.InitializeContext                              ' <- obtiene el Activity actual
		Dim cm As JavaObject = ctx.RunMethod("getSystemService", Array("clipboard"))
		Dim cd As JavaObject
		cd.InitializeStatic("android.content.ClipData")
		Dim clip As JavaObject = cd.RunMethod("newPlainText", Array("label", t))
		cm.RunMethod("setPrimaryClip", Array(clip))
		ToastMessageShow("Copiado al portapapeles.", False)
	Catch
		Log(LastException)
		ToastMessageShow("No se pudo copiar al portapapeles.", False)
	End Try
End Sub

' ===== Lee el monto priorizando el LocalStore (archivo único) =====
Private Sub LeerMontoLocal As String
	' 0) Intentar desde el LocalStore JSON único
	Try
		Dim m As Map = LocalStore.LoadSingleCustomer
		If m.IsInitialized And m.ContainsKey("cantidad_total") And m.Get("cantidad_total") <> Null Then
			Dim s As String = ("" & m.Get("cantidad_total")).Trim
			If s.Length > 0 Then Return s
		End If
	Catch
		Log(LastException)
	End Try

	' 1) Fallback: archivo suelto que ya usabas
	Dim fn As String = "cantidad de pago.txt"
	If File.Exists(File.DirInternal, fn) Then
		Dim v As String = File.ReadString(File.DirInternal, fn).Trim
		If v.Length > 0 Then Return v
	End If

	' 2) Fallback: slots antiguos (cantidad1.txt, cantidad2.txt, cantidad3.txt)
	For i = 1 To 3
		Dim f As String = $"cantidad${i}.txt"$
		If File.Exists(File.DirInternal, f) Then
			Dim v2 As String = File.ReadString(File.DirInternal, f).Trim
			If v2.Length > 0 Then Return v2
		End If
	Next

	Return "0"
End Sub





Sub CargarEnWebViewAzteca(url As String, wv As WebView, fitMode As String)
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


'--- Tu método de mostrar (ahora usando WebView) ---
Sub MostrarImagenEnFondoAzteca
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Azteca.gif?alt=media&token=cbae1a53-13ce-4c00-bf76-6815325e00d5"
	CargarEnWebViewAzteca(url, Tarjeta, "contain") ' o "cover", "fill", "none"
End Sub

Private Sub Azteca_click
	MostrarImagenEnFondoAzteca
	MostrarImagenEnFondoui
	datosbbva.Visible=False
	Aztecadatos.Visible=True
	Oxxodatos.Visible=False
	hogar.Visible=False
	Ahog.Visible=False
	info.Visible=False
	escuela2.Visible=False
	escuela.Visible=True
	domicilio2.Visible=False
	domicilio.Visible=True
	bbva2.Visible=False
	bbva.Visible=True
	link2.Visible=False
	link.Visible=True
End Sub

Private Sub Aztecadatos_click
	Dim monto As String = LeerMontoLocal

	' Tus datos (ajústalos si cambian)
	Dim Tarjetas As String      = "4027 6600 0727 5151"
	Dim destinatario As String = "Diego Ivan Magaña Jaime"
	Dim clabe As String        = "1279 1701 3065 7766 33"

	Dim texto As String = _
        $"Importe: $${monto}${CRLF}Tarjeta: ${Tarjetas}${CRLF}Destinatario: ${destinatario}${CRLF}CLABE: ${clabe}"$

	SetClipboardText(texto)
	'ToastMessageShow("Datos de pago copiados al portapapeles.", False)
End Sub

Sub QuitarScrollBars(wv As WebView)
	Dim jo As JavaObject = wv
	jo.RunMethod("setVerticalScrollBarEnabled", Array(False))
	jo.RunMethod("setHorizontalScrollBarEnabled", Array(False))
End Sub

Private Sub btnVolver_click
	B4XPages.ShowPageAndRemovePreviousPages("Guardar")
	MostrarImagenEnFondoui
	link.Visible=True
	link2.Visible=False
	bbva.Visible=True
	bbva2.Visible=False
	info.Visible=False
	hogar.Visible=False
	Ahog.Visible=False
	escuela2.Visible=False
	escuela.Visible=True
	domicilio2.Visible=False
	domicilio.Visible=True
End Sub

