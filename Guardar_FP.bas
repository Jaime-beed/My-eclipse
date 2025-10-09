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
	Dim FondoUi2 As Label
	Dim puntoss As Button
	Dim buscar As Button
	Dim btnGuardarFecha As Button
	Dim Fondo As ImageView
	Dim Ver_Pago_obj As Ver_Pago
	
End Sub

'You can add more parameters here.
Public Sub Initialize As Object

	Return Me
	
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("Guardar_FP")
	crear_interfaz
		
	Ver_Pago_obj.Initialize
	B4XPages.AddPage("Ver_Pago",Ver_Pago_obj)
	'load the layout to Root

	
	
End Sub



Private Sub crear_interfaz
	
	Fondo.Initialize("Fondo")
	Fondo.Bitmap = LoadBitmap(File.DirAssets, "Fondo 1.jpg") ' Asegúrate de tener fondo.png en Files
	Root.AddView(Fondo,-345dip, -400dip, 1080dip, 1920dip)
	
	' Botón Volver (arriba)
	Dim btnVolver As Button
	btnVolver.Initialize("btnVolver")
	btnVolver.Text = "Volver"
	btnVolver.Color = Colors.RGB(255, 102, 0)
	btnVolver.TextColor = Colors.White
	Root.AddView(btnVolver, 10dip, 5dip, 70dip, 40dip)
	
	
	Dim gd As GradientDrawable
	gd.Initialize("TOP_BOTTOM", Array As Int(Colors.RGB(255, 140, 0), Colors.RGB(255, 200, 0))) ' De naranja oscuro a claro
	gd.CornerRadius = 0 ' Sin bordes redondeados
	


	FondoUi2.Initialize("FondoUi2")
	FondoUi2.Background = gd
	Root.AddView(FondoUi2, -10dip, 720dip, 1080dip, 70dip)

	' Botón Guardar Fecha (encima del fondo)
	
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
	
	
	puntoss .Initialize("puntoss")
	puntoss .Text = ""
	puntoss .Color = Colors.Transparent'sin color pq solo quier el click
	'btnGuardarFecha.TextColor = Colors.Black
	Root.AddView( puntoss,  270dip, 720dip, 120dip, 70dip)
	
	FondoUi.Initialize("FondoUi")
	Root.AddView(FondoUi, -350dip, 720dip, 1080dip, 70dip)
	FondoUi.Top = 720dip
	FondoUi.Width = 1080dip
	FondoUi.Height = 70dip
   
	

	
	MostrarImagenEnFondoUi
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
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/selec.Guardar.png?alt=media&token=f49fc075-7683-4cef-987b-705fdd163c2e"
	CargarImagenEscaladaDesdeWeb(url, FondoUi)
End Sub


Private Sub buscar_click
	B4XPages.ShowPageAndRemovePreviousPages("Ver_Pago")
End Sub

Private Sub  puntoss_click
	
End Sub





'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.