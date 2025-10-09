B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@
#Region Project Attributes
#End Region

Sub Class_Globals

	Private Root As B4XView
	Private xui As XUI
	
	Dim FondoUi As ImageView
	Dim FondoUi2 As Label

	Private lvClientes As ListView
	Private btnMostrar As Button
	Private listaOriginal As List
	Private txtBuscar As EditText
	Private listaFiltrada As List
	
	Dim puntoss As Button
	
	Dim btnGuardarFecha As Button
    Dim Fondo As ImageView
	Dim x As ImageView
	
	Dim Guardar_obj As Guardar
	Dim Puntos_obj As Puntos
	Private Dialog As B4XDialog


  
  


End Sub

Public Sub Initialize
	listaOriginal.Initialize
	listaFiltrada.Initialize
	Guardar_obj.Initialize
	Puntos_obj.Initialize

End Sub

Public Sub B4XPage_Created(Root1 As B4XView)
	Root = Root1
	Root.LoadLayout("Ver_Pago")
	B4XPages.AddPage("Guardar",Guardar_obj)
	B4XPages.AddPage("Puntos",Puntos_obj)

	Dialog.Initialize(Root)            ' inicializa con el Root de la página
	Dialog.TitleBarColor = Colors.Black
	Dialog.TitleBarTextColor = Colors.White
	Dialog.ButtonsColor = Colors.Black
	Dialog.ButtonsTextColor = Colors.White
	Dialog.OverlayColor = 0x99000000
	
	interui
	Crearinterfaz
	MostrarImagenEnFondoUi2

End Sub


Private Sub Crearinterfaz
	Fondo.Initialize("Fondo")
	Fondo.Bitmap = LoadBitmap(File.DirAssets, "Fondo App.png") ' Asegúrate de tener fondo.png en Files
	Root.AddView(Fondo,-345dip, -400dip, 1080dip, 1920dip)
	
	
	' Fondo decorativo fijo
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
	
	
	x.Initialize("x")
	Root.AddView(x, 10dip, 5dip, 30dip, 30dip)

End Sub

Private Sub interui
	Sleep (1000)
	
	
	Dim eclipse As Typeface
	eclipse = Typeface.LoadFromAssets("Kind Daily.ttf")
	
	Dim eclipseparrafo As Typeface
	eclipseparrafo = Typeface.LoadFromAssets("ZTOtez-Regular.ttf")
	
	Dim eclipseparrafocursiva As Typeface
	eclipseparrafocursiva = Typeface.LoadFromAssets("ZTOtez-Italic.ttf")

	' Botón Volver (arriba)
	Dim btnVolver As Button
	btnVolver.Initialize("btnVolver")
	btnVolver.Color = Colors.Transparent
	Root.AddView(btnVolver, 10dip, 5dip, 30dip, 30dip)
	
	
	txtBuscar.Initialize("txtBuscar")
	txtBuscar.Hint = "Buscar fecha de pago"
	txtBuscar.Typeface= eclipseparrafocursiva
	txtBuscar.TextColor = Colors.Black
	txtBuscar.Gravity=Gravity.CENTER
	txtBuscar.Color = Colors.White
	Root.AddView(txtBuscar, 10dip, 55dip, 100%x - 20dip, 45dip)
	
	Dim gdGrisAlpha As GradientDrawable
	gdGrisAlpha.Initialize("RIGHT_LEFT", Array As Int(Colors.ARGB(170, 80, 80, 80), Colors.ARGB(170, 220, 220, 220)))
	gdGrisAlpha.CornerRadius = 0

	' Lista de clientes (debajo del campo de búsqueda)
	lvClientes.Initialize("lvClientes")
	lvClientes.Background=gdGrisAlpha
	lvClientes.Color = Colors.ARGB(180, 128, 128, 128)
	Root.AddView(lvClientes, 10dip, 110dip, 100%x - 20dip, 480dip)
	
	Dim gd2 As GradientDrawable
	gd2.Initialize("RIGHT_LEFT", Array As Int(Colors.RGB(255, 140, 0), Colors.RGB(255, 200, 0))) ' De naranja oscuro a claro
	gd2.CornerRadius = 25 ' Sin bordes redondeados
	' Botón Mostrar Clientes (debajo del ListView)
	btnMostrar.Initialize("btnMostrar")
	btnMostrar.Text = "Mostrar Clientes"
	btnMostrar.Typeface=eclipseparrafo
	btnMostrar.Textsize=16
	btnMostrar.Background = gd2 ' Mostaza
	btnMostrar.TextColor = Colors.Black
	Root.AddView(btnMostrar, 10dip, 600dip, 100%x - 20dip, 40dip)
	
		
	listaOriginal.Initialize
	MostrarImagenEnFondoUi
End Sub

Private Sub txtBuscar_TextChanged (Old As String, New As String)
	Dim clean As String = New.Replace(CRLF, "").Replace(Chr(10), "").Replace(Chr(13), "")
	If clean <> New Then
		txtBuscar.Text = clean
		txtBuscar.SelectionStart = clean.Length
		Return
	End If
	ActualizarListaFiltrada(New)
End Sub


Private Sub ActualizarListaFiltrada(filtro As String)
	lvClientes.Clear
	listaFiltrada.Clear

	For Each clienteMap As Map In listaOriginal
		Dim linea As String = clienteMap.Get("linea")
		If filtro = "" Or linea.ToLowerCase.Contains(filtro.ToLowerCase) Then
			lvClientes.AddSingleLine(linea)
			listaFiltrada.Add(clienteMap) ' Agrega el Map completo, no solo texto
		End If
	Next
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
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/Buscar.png?alt=media&token=5a83f02a-b493-4529-8a5b-cb36d92c0d92"
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
	
	Dim url As String = "https://firebasestorage.googleapis.com/v0/b/my-eclipse-bb053.firebasestorage.app/o/x.png?alt=media&token=bcfe9a91-1ac7-4e93-861b-aa60744fbe70"
	CargarImagenEscaladaDesdeWeb2(url, x)
End Sub


Private Sub JobDone(job As HttpJob)
	If job.Success Then
		Select job.JobName

			Case "mostrar_clientes"
				lvClientes.Clear
				listaOriginal.Clear
				listaFiltrada.Clear

				Dim parser As JSONParser
				parser.Initialize(job.GetString)
				Dim clientes As Map
				Try
					clientes = parser.NextObject
				Catch
					clientes.Initialize
				End Try

				For Each idCliente As String In clientes.Keys
					Dim datos As Map = clientes.Get(idCliente)

					Dim nombreCliente As String = datos.GetDefault("cliente", "-")
					Dim cuenta As String        = datos.GetDefault("cuentas", "-")
					Dim cantidad As String      = "" & datos.GetDefault("cantidad_a_pagar", "0")
					Dim pagadoRaw As Object     = datos.GetDefault("pagado", False)
					Dim pagadoTxt As String     = BoolAText(pagadoRaw)
					Dim dia As String           = datos.GetDefault("dia_pago", "-")   ' ← "DD de cada mes"
					Dim combo As String         = "" & datos.GetDefault("combo", "false")
					Dim puntos As String        = "" & datos.GetDefault("puntos_acumulados", "0")
					Dim notas As String         = datos.GetDefault("notas", "")

					' Mostrar SOLO el campo día de pago (ya incluye "de cada mes")
					Dim linea As String = $"Cliente: ${nombreCliente}${CRLF}Cuenta: ${cuenta}${CRLF}Cantidad: $${cantidad}${CRLF}Pagado: ${pagadoTxt}${CRLF}Fecha: ${dia}${CRLF}Combo: ${combo}${CRLF}Puntos: ${puntos}${CRLF}Notas: ${notas}"$

					Dim m As Map
					m.Initialize
					m.Put("id", idCliente)
					m.Put("linea", linea)
					m.Put("cliente", nombreCliente)
					m.Put("cuentas", cuenta)
					m.Put("cantidad", cantidad)
					m.Put("pagado_txt", pagadoTxt)
					m.Put("dia", dia)
					m.Put("combo", combo)
					m.Put("puntos", puntos)
					m.Put("notas", notas)
					m.Put("orden", OrdenFecha(dia)) 

					listaOriginal.Add(m)
				Next

				' Ordenar y cargar
				SortByOrden(listaOriginal)
				For Each m As Map In listaOriginal
					lvClientes.AddSingleLine(m.Get("linea"))
				Next

				listaFiltrada.Clear
				listaFiltrada.AddAll(listaOriginal)

		End Select
	Else
		Log("Error: " & job.ErrorMessage)
		xui.MsgboxAsync("Error: " & job.ErrorMessage, "Error HTTP")
	End If
	job.Release
End Sub






' ---- Helpers ----


Private Sub OrdenFecha(dia As String) As Int
	' Soporta: "09 de cada mes", "9 de cada mes" o "9"
	Dim s As String = dia.Trim
	Dim p As Int = s.IndexOf(" ")
	If p > -1 Then s = s.SubString2(0, p)
	If IsNumber(s) Then Return s Else Return 0
End Sub


Private Sub BoolAText(v As Object) As String
	If v Is Boolean Then Return IIf(v, "sí", "no")
	Dim s As String = ("" & v).ToLowerCase
	If s = "true" Or s = "1" Or s = "si" Or s = "sí" Then Return "sí"
	Return "no"
End Sub

Private Sub SortByOrden(lst As List)
	For i = 0 To lst.Size - 2
		For j = i + 1 To lst.Size - 1
			Dim a As Map = lst.Get(i)
			Dim b As Map = lst.Get(j)
			If a.Get("orden") > b.Get("orden") Then
				lst.Set(i, b)
				lst.Set(j, a)
			End If
		Next
	Next
End Sub



Private Sub lvClientes_ItemClick (Position As Int, Value As Object)
	Dim clienteMap As Map = listaFiltrada.Get(Position)

	Dim nombre As String = "Cliente"
	Dim cuerpo As String = ""

	If clienteMap.ContainsKey("raw") And clienteMap.Get("raw") <> Null Then
		Dim m As Map = clienteMap.Get("raw")

		nombre = GetStrFromMap(m, "cliente", nombre)
		Dim cuenta   As String = GetStrFromMap(m, "cuentas", "-")
		Dim cantidad As String = GetStrFromMap(m, "cantidad_a_pagar", "0")
		Dim dia      As String = GetStrFromMap(m, "dia_pago", "-")
		Dim puntos   As String = GetStrFromMap(m, "puntos_acumulados", "0")
		Dim notas    As String = GetStrFromMap(m, "notas", "")

		Dim comboTxt  As String = BoolToSiNo(GetStrFromMap(m, "combo", "false"))
		Dim pagadoTxt As String = BoolToSiNo(GetStrFromMap(m, "pagado", "false"))

		cuerpo = _
$"Cuenta: ${cuenta}
Cantidad: $${cantidad}
Pagado: ${pagadoTxt}
Fecha: ${dia}
Combo: ${comboTxt}
Puntos: ${puntos}
Notas: ${notas}"$

	Else
		' Fallback: partir de la línea completa guardada
		Dim linea As String = ""
		If clienteMap.ContainsKey("linea") Then linea = "" & clienteMap.Get("linea")

		' Extrae nombre de la 1ª línea y el resto como cuerpo
		Dim idx As Int = linea.IndexOf("Cliente: ")
		If idx > -1 Then
			idx = idx + 9
			Dim e As Int = linea.IndexOf2(CRLF, idx)
			If e = -1 Then e = linea.Length
			nombre = linea.SubString2(idx, e).Trim
			If e < linea.Length Then cuerpo = linea.SubString(e + CRLF.Length)
		Else
			cuerpo = linea
		End If
		cuerpo = cuerpo.Replace("Pagado: true","Pagado: Sí").Replace("Pagado: false","Pagado: No")
	End If

	' ==== Diálogo negro con título gris y fondo opcional ====
	Dim dlg As B4XDialog
	dlg.Initialize(Root)
	dlg.BackgroundColor = Colors.Black
	dlg.ButtonsTextColor = Colors.White
	dlg.BorderWidth = 0

	Dim p As B4XView = xui.CreatePanel("")
	p.Color = Colors.Black
	p.SetLayoutAnimated(0, 0, 0, 90%x, 260dip)

	' (Opcional) imagen de fondo -> coloca "dlg_bg.png" en Files si quieres usarla
	Dim bgFile As String = "Eclipse2"   ' deja "" si no quieres imagen
	If bgFile <> "" And File.Exists(File.DirAssets, bgFile) Then
		Dim bg As ImageView
		bg.Initialize("")
		p.AddView(bg, 0, 0, p.Width, p.Height)
		bg.Bitmap = LoadBitmapResize(File.DirAssets, bgFile, p.Width, p.Height, True)
		bg.SendToBack
	End If

	' Título (franja gris con el nombre)
	Dim title As Label
	title.Initialize("")
	title.Text = nombre
	title.TextColor = Colors.White
	title.TextSize = 18
	title.Typeface = Typeface.DEFAULT_BOLD
	title.Gravity = Gravity.CENTER
	title.Color = Colors.RGB(60,60,60)     ' gris de título
	Dim titleH As Int = 44dip
	p.AddView(title, 0, 0, p.Width, titleH)

	' Cuerpo (resto de datos)
	Dim lbl As Label
	lbl.Initialize("")
	lbl.TextColor = Colors.White
	lbl.TextSize = 15
	lbl.Gravity = Gravity.TOP
	lbl.Text = cuerpo
	p.AddView(lbl, 12dip, titleH + 10dip, p.Width - 24dip, p.Height - titleH - 20dip)

	Wait For (dlg.ShowCustom(p, "Vale", "", "")) Complete (r As Int)
End Sub

' ---------- helpers locales (sin Object) ----------
Private Sub GetStrFromMap(m As Map, k As String, def As String) As String
	If m.IsInitialized And m.ContainsKey(k) And m.Get(k) <> Null Then Return "" & m.Get(k)
	Return def
End Sub

Private Sub BoolToSiNo(s As String) As String
	s = s.ToLowerCase
	If s = "true" Or s = "1" Or s = "si" Or s = "sí" Or s = "yes" Then Return "Sí"
	Return "No"
End Sub

' ==== BOTONES ====


Private Sub btnGuardarFecha_Click
	
	
	'Sleep(500)
	B4XPages.ShowPageAndRemovePreviousPages("Guardar")
	
End Sub


Private Sub puntoss_Click
    
      B4XPages.ShowPageAndRemovePreviousPages("Puntos")
	
End Sub

Private Sub btnVolver_Click
	B4XPages.ShowPageAndRemovePreviousPages("MainPage")
End Sub

Private Sub btnMostrar_Click
	Dim job As HttpJob
	job.Initialize("mostrar_clientes", Me)
	job.Download("https://my-admin-f0d0f-default-rtdb.firebaseio.com/clientes.json")
	
End Sub

