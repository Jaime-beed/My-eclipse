B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@


Sub Class_Globals
	Private Root As B4XView
	Private xui As XUI
	Dim Fondo As  ImageView
	Dim x As ImageView
	Dim Fondoui As ImageView
	Dim Fondoui2 As ImageView
	Dim Registroevento As Button
	Dim Registro_obj As Registro
	Dim Evento As Button
	Dim Beast As Button
	Dim Dezeer As Button
	Dim Aniversario As Button
	Dim Regalo As Button
	Dim Regalo_obj As Regalo
	
	Dim eclipse As Typeface
	eclipse = Typeface.LoadFromAssets("Kind Daily.ttf")
	
	Dim eclipseparrafo As Typeface
	eclipseparrafo = Typeface.LoadFromAssets("ZTOtez-Regular.ttf")
	
	Dim eclipseparrafocursiva As Typeface
	eclipseparrafocursiva = Typeface.LoadFromAssets("ZTOtez-Italic.ttf")

End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Registro_obj.Initialize
	Regalo_obj.Initialize
	Return Me
End Sub

Private Sub B4XPage_Resize 
	FondoCover
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	
	
	Root = Root1
	Root.LoadLayout("Eventos") ' Tu layout de splash

	B4XPages.AddPage("Registro",Registro_obj)
	B4XPages.AddPage("Regalo",Regalo_obj)
	
	' Imagen 1080x1920 mostrada completa (sin recortes)

     FondoCover
	' Área destino (toda la page)
	
	' Opcional (no afecta si bmp == view):
	' Fondo.Gravity = Gravity.FILL

	
	Dim btnVolver As Button
	btnVolver.Initialize("btnVolver")
	btnVolver.Color = Colors.Transparent
	Root.AddView(btnVolver, 10dip, 80dip, 30dip, 50dip)
	
	
	
	Sleep(1000)
	Interui
	MostrarImagenEnFondoUi
	x.Initialize("x")
	Root.AddView(x, 10dip, 80dip, 30dip, 30dip)
	


End Sub


Private Sub Interui
	
	AgregarEncabezadoDegradado
	
	Fondoui.Initialize("FondoUi")
	Root.AddView(Fondoui, 05dip, 385dip, 378dip, 600dip)
	Fondoui.Top = 385dip
	Fondoui.Width = 378dip
	Fondoui.Height = 600dip
	
	MostrarImagenEnFondoUi2
	
	Fondoui2.Initialize("Fondoui2")
	Root.AddView(Fondoui2,70dip,80dip,250dip,400dip)
	
	Evento.Initialize("Evento")
    Evento.Color=Colors.Transparent
	Root.AddView(Evento,70dip,80dip,250dip,400dip)
	
	Beast.Initialize("Beast")
	Beast.Color=Colors.Transparent
	Root.AddView(Beast,05dip,660dip,150dip,250dip)
	
	Dezeer.Initialize("Dezeer")
	Dezeer.Color=Colors.Transparent
	Root.AddView(Dezeer,154dip,660dip,130dip,250dip)

	Aniversario.Initialize("Aniversario")
	Aniversario.Color=Colors.Transparent
	Root.AddView( Aniversario,285dip,690dip,100dip,100dip)
	
   ' Regalo.Initialize("Regalo")
	'Regalo.Color=Colors.Transparent
	'Root.AddView( Regalo,335dip,595dip,50dip,50dip)

	MostrarImagenEnFondoUi3
	
	Dim gd2 As GradientDrawable
	gd2.Initialize("RIGHT_LEFT", Array As Int(Colors.RGB(255, 140, 0), Colors.RGB(255, 200, 0))) ' De naranja oscuro a claro
	gd2.CornerRadius = 25 
	
	Registroevento.Initialize("Registroevento")
	Registroevento.Text = "Quiero saber mas"
	Registroevento.Typeface=eclipseparrafo
	Registroevento.Textsize=16
	Registroevento.Background = gd2 ' Mostaza
	Registroevento.TextColor = Colors.Black
	Root.AddView(Registroevento, 10dip, 500dip, 100%x - 20dip, 40dip)
	
	
	

End Sub

' Llenar toda el área visible (9:16) recortando lo que sobre
Private Sub FondoCover
	Dim imgW As Int = 1080, imgH As Int = 1920                ' tamaño original
	Dim vr As Rect = GetVisibleFrame(Root)                    ' evita la status bar
	Dim contW As Int = 100%x
	Dim contH As Int = vr.Bottom - vr.Top

	' Escala tipo COVER (llenar, recortando)
	Dim s As Float = Max(contW / imgW, contH / imgH)
	Dim wS As Int = Round(imgW * s)
	Dim hS As Int = Round(imgH * s)

	' Bitmap destino = tamaño del contenedor
	Dim bmpDst As Bitmap
	bmpDst.InitializeMutable(contW, contH)
	Dim cvs As Canvas
	cvs.Initialize2(bmpDst)

	' Centrar y recortar lo que sobre
	Dim offX As Int = (contW - wS) / 2
	Dim offY As Int = (contH - hS) / 2
	Dim r As Rect
	r.Initialize(offX, offY, offX + wS, offY + hS)

	' Dibujar la imagen escalada
	Dim bmpSrc As Bitmap = LoadBitmap(File.DirAssets, "Fondo event.png")
	cvs.DrawBitmap(bmpSrc, Null, r)

	' Colocar el ImageView en todo el área visible
	If Fondo.IsInitialized = False Then
		Fondo.Initialize("Fondo")
		Root.AddView(Fondo, 0, vr.Top, contW, contH)
	Else
		Fondo.SetLayoutAnimated(0, 0, vr.Top, contW, contH)
	End If
	Fondo.Bitmap = bmpDst
End Sub

' Rect visible bajo status bar
Private Sub GetVisibleFrame(v As View) As Rect
	Dim jo As JavaObject = v
	Dim outRect As JavaObject
	outRect.InitializeNewInstance("android.graphics.Rect", Null)
	jo.RunMethod("getWindowVisibleDisplayFrame", Array(outRect))
	Dim rr As Rect
	rr.Initialize(outRect.GetField("left"), outRect.GetField("top"), outRect.GetField("right"), outRect.GetField("bottom"))
	Return rr
End Sub

' Llama aquí:
' B4XPage_Created:   FondoCover
' B4XPage_Resize:    FondoCover


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
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Otros%20eventos.png?alt=media&token=d118be4e-163d-4e4d-b923-b6e9e9f1887c"
	CargarImagenEscaladaDesdeWeb2(url, Fondoui)
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


Sub MostrarImagenEnFondoUi3
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Donacion.png?alt=media&token=f6411416-5b20-4595-ba3f-dc6aae006293"
	CargarImagenEscaladaDesdeWeb3(url, Fondoui2)
	
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
	lblTitulo.Text = "Eventos del mes"
	lblTitulo.Typeface=eclipse
	lblTitulo.TextColor = Colors.White
	lblTitulo.TextSize = 26
	lblTitulo.Gravity = Gravity.CENTER
	Encabezado.AddView(lblTitulo, 0, 0, 100%x, 60dip)
End Sub



Private Sub btnVolver_click
	B4XPages.ShowPageAndRemovePreviousPages("MainPage")
End Sub

Private Sub Registroevento_click
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://api.whatsapp.com/send/?phone=5219971804304&text&type=phone_number&app_absent=0")
	StartActivity(intent)
End Sub

'

Private Sub Beast_click
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://perfiles-eclipse.jimdosite.com/lo-nuevo/")
	StartActivity(intent)
End Sub

Private Sub Evento_click
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://www.facebook.com/groups/202860610420038/")
	StartActivity(intent)
End Sub

Private Sub Aniversario_click
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://wa.me/5219971804304")
	StartActivity(intent)
End Sub

Private Sub Dezeer_click
	Dim intent As Intent
	intent.Initialize(intent.ACTION_VIEW, "https://wa.me/5219971804304")
	StartActivity(intent)
End Sub

Private Sub Regalo_click
	B4XPages.ShowPageAndRemovePreviousPages("Regalo")
End Sub