B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	Dim logo As ImageView
	Dim Codigo As EditText
	Dim Enviar As Button
	Dim Cuenta As WebView
	Dim x As ImageView
	Dim copi As Button
	
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
	Root.LoadLayout("Pcarga") ' Tu layout de splash\
	
	MostrarImagenEnFondoUi
	
	logo.Initialize("logo")
	logo.Bitmap = LoadBitmap(File.DirAssets, "Fondo Tarjeta.png")
	Root.AddView(logo,-340dip, -550dip, 1080dip, 1920dip)
	
	'--- En B4XPage_Created ---
	copi.Initialize("copi")
	copi.Color=Colors.Transparent
	Root.AddView(copi, 130dip, 630dip,150dip,20dip)
	
	
	
	Cuenta.Initialize("Cuenta")
	Root.AddView(Cuenta, 70dip, 350dip,250dip,400dip) ' Ajusta posición/tamaño
	QuitarScrollBars(Cuenta)
	Cuenta.Color = Colors.Transparent

	Cuenta.Visible=True
	
	x.Initialize("x")
	Root.AddView(x, 10dip, 80dip, 30dip, 30dip)
	
		
	Dim btnVolver As Button
	btnVolver.Initialize("btnVolver")
	btnVolver.Color = Colors.Transparent
	Root.AddView(btnVolver, 10dip, 80dip, 30dip, 50dip)
	
	
	AgregarEncabezadoDegradado
	
	
	
	Sleep(1000)
	
	
	Codigo.Initialize("Codigo")
	Codigo.Hint = "Escribe el codigo de betatester"
	Codigo.HintColor = Colors.Black
	Codigo.Typeface=eclipseparrafo
	Codigo.TextSize = 18
	Codigo.TextColor = Colors.Black
	Codigo.Color = Colors.White
	Codigo.Gravity = Gravity.CENTER
	Root.AddView(Codigo, (100%x - 350dip) / 2, 200dip, 90%x, -2)
	Codigo.Width = 350dip
	Codigo.Height = 50dip
	Codigo.InputType = 0x0002
	
	Dim gd2 As GradientDrawable
	gd2.Initialize("RIGHT_LEFT", Array As Int(Colors.RGB(255, 140, 0), Colors.RGB(255, 200, 0))) ' De naranja oscuro a claro
	gd2.CornerRadius = 0 ' Sin bordes redondeados
	' Botón Mostrar Clientes (debajo del ListView)
	Enviar.Initialize("Enviar")
	Enviar.Text = "Enviar el codigo de betatester"
	Enviar.Typeface=eclipseparrafo
	Enviar.Textsize=17
	Enviar.Background = gd2 ' Mostaza
	Enviar.TextColor = Colors.Black
	Root.AddView(Enviar, 10dip, 270dip, 100%x - 20dip, 50dip)


	

	
	
		
	
End Sub

Private Sub copi_click


	Dim texto As String = _
        "CUENTA DE REGALO" &CRLF& "Correo:perfileseclipse@gmail.com" &CRLF&"Contraseña: Eclipse78"

	SetClipboardText(texto)
End Sub

Private Sub SetClipboardText(t As String)
	Dim ctx As JavaObject
	ctx.InitializeContext
	Dim cm As JavaObject = ctx.RunMethod("getSystemService", Array("clipboard"))
	Dim ClipData As JavaObject
	ClipData.InitializeStatic("android.content.ClipData")
	Dim clip As JavaObject = ClipData.RunMethod("newPlainText", Array("label", t))
	cm.RunMethod("setPrimaryClip", Array(clip))
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



Sub MostrarImagenEnFondoUi
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/x.png?alt=media&token=bcfe9a91-1ac7-4e93-861b-aa60744fbe70"
	CargarImagenEscaladaDesdeWeb(url, x)
End Sub

' Carga imagen desde web.
' - Para GIF animados: usa WebView para preservarlos animados.
' - Para PNG/JPG: descarga y dibuja escalado centrado (contain).
' Carga una imagen/GIF en un WebView ocupando el contenedor (contain/cover/fill/none)
Sub CargarEnWebView(url As String, wv As WebView, fitMode As String)
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
Sub MostrarImagenEnFondoUi3
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Regalo%20de%20bienvenida.gif?alt=media&token=638ce241-8446-4232-97f5-b7d8ea04d8f0"
	CargarEnWebView(url, Cuenta, "contain") ' o "cover", "fill", "none"
	
End Sub


Sub QuitarScrollBars(wv As WebView)
	Dim jo As JavaObject = wv
	jo.RunMethod("setVerticalScrollBarEnabled", Array(False))
	jo.RunMethod("setHorizontalScrollBarEnabled", Array(False))
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
	lblTitulo.Text = "Regalo de Betatesters"
	lblTitulo.Typeface=eclipse
	lblTitulo.TextColor = Colors.White
	lblTitulo.TextSize = 24
	lblTitulo.Gravity = Gravity.CENTER
	Encabezado.AddView(lblTitulo, 0, 0, 100%x, 60dip)
End Sub


Private Sub Enviar_click
	
	Dim beta As String	
    beta="061937"
	
	If Codigo.Text.Trim = beta Then
		MostrarImagenEnFondoUi3
		
	End If
	
	If Codigo.Text.Trim <> beta Then
		
		ToastMessageShow("Codigo incorrecto",True)
		
    End If
	
	Cuenta.Visible=True
	
End Sub




Sub Codigo_TextChanged (Old As String, New As String)
	If New.Length > 6 Then
		Codigo.Text = Old
		Codigo.SelectionStart = Old.Length
	End If
End Sub


Private Sub btnVolver_click
    B4XPages.ShowPageAndRemovePreviousPages("MainPage")
	Cuenta.Visible=False
	Codigo.Text=""
	copi.Visible=False
End Sub