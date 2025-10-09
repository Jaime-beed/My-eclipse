B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=13.1
@EndOfDesignText@
' Code Module: LocalStore.bas
Sub Process_Globals
	Private Const SINGLE_FN As String = "cliente_unico.json"   ' un único archivo
End Sub

'========================
'  API PÚBLICA (UN SOLO ARCHIVO)
'========================

' Crea el archivo único si no existe.
' Si pasas nombre (no vacío) y el archivo no existe, lo usa como valor inicial.
Public Sub EnsureCustomerFile(OptionalNombre As String)
	If File.Exists(File.DirInternal, SINGLE_FN) = False Then
		Dim m As Map : m.Initialize
		If OptionalNombre.Trim.Length > 0 Then
			m.Put("nombre", OptionalNombre.Trim)
		Else
			m.Put("nombre", "rayo de sol")
		End If
		m.Put("cantidad_total", 0)
		m.Put("puntos_total", 0)
		m.Put("cuentas", CreateList)
		m.Put("cuentas_texto", "")
		' === Fuente de verdad para fecha de pago ===
		m.Put("dia_pago", "")                 ' ej. "01 de cada mes" o "10 de Septiembre"
		' Compatibilidad (opcional): derivados de dia_pago
		m.Put("fechas", CreateList)
		m.Put("fechas_texto", "")
		m.Put("ultima_actualizacion", DateTime.Now)
		WriteJson(m)
	End If
End Sub

' Guarda / REEMPLAZA el contenido con los datos que pases (no acumula).
' Acepta:
'   nombre
'   cantidad / cantidad_total / cantidad_a_pagar
'   puntos / puntos_total / puntos_acumulados
'   cuentas (String "a, b" o List de String)
'   dia_pago  (String, p.ej. "01 de cada mes" o "10 de Septiembre")
'   fecha (String)  o  dia/mes (si no mandas dia_pago)
Public Sub SaveOrMergeCustomer(data As Map)
	If data.IsInitialized = False Then Return
	EnsureCustomerFile("")
    
	Dim out As Map : out.Initialize
	Dim nombre As String = GetS(data, Array As String("nombre"), "").Trim
	If nombre.Length = 0 Then
		Dim cur As Map = ReadJson
		If cur.IsInitialized And cur.ContainsKey("nombre") Then
			nombre = "" & cur.Get("nombre")
		Else
			nombre = "rayo de sol"
		End If
	End If
	out.Put("nombre", nombre)
	
	' cantidad_total (prioridad: cantidad_total > cantidad > cantidad_a_pagar)
	Dim cant As Double = GetD(data, Array As String("cantidad_total","cantidad","cantidad_a_pagar"), 0)
	out.Put("cantidad_total", cant)

	' puntos_total (prioridad: puntos_total > puntos > puntos_acumulados)
	Dim pts As Int = GetI(data, Array As String("puntos_total","puntos","puntos_acumulados"), 0)
	out.Put("puntos_total", pts)

	' cuentas -> List única
	Dim cuentasList As List = CreateList
	If data.ContainsKey("cuentas") And data.Get("cuentas") <> Null Then
		If data.Get("cuentas") Is List Then
			Dim l As List = data.Get("cuentas")
			For Each c As String In l
				Dim cc As String = ("" & c).Trim
				If cc.Length > 0 Then AddUnique(cuentasList, cc)
			Next
		Else
			Dim cuentasTxt As String = ("" & data.Get("cuentas")).Trim
			If cuentasTxt.Length > 0 Then
				Dim partes() As String = Regex.Split(",", cuentasTxt)
				For Each c As String In partes
					Dim cc As String = c.Trim
					If cc.Length > 0 Then AddUnique(cuentasList, cc)
				Next
			End If
		End If
	End If
	out.Put("cuentas", cuentasList)
	out.Put("cuentas_texto", JoinList(cuentasList, ", "))

	' ============================
	'  dia_pago -> String ÚNICO
	'  Prioridad: dia_pago > fecha > (dia + mes)
	' ============================
	Dim diaPago As String = GetS(data, Array As String("dia_pago"), "").Trim
	If diaPago.Length = 0 Then
		Dim f As String = GetS(data, Array As String("fecha"), "").Trim
		If f.Length = 0 Then
			Dim dia As String = GetS(data, Array As String("dia"), "").Trim
			Dim mes As String = GetS(data, Array As String("mes"), "").Trim
			f = FechaTexto(dia, mes)   ' "10 de Septiembre" si ambos vienen
		End If
		diaPago = f
	End If
	out.Put("dia_pago", diaPago)

	' Compatibilidad (opcional): rellena "fechas" y "fechas_texto" desde dia_pago
	Dim fechasList As List = CreateList
	If diaPago.Length > 0 Then AddUnique(fechasList, diaPago)
	out.Put("fechas", fechasList)
	out.Put("fechas_texto", JoinList(fechasList, ", "))

	out.Put("ultima_actualizacion", DateTime.Now)

	WriteJson(out)   ' <<< SOBRESCRIBE el único archivo
End Sub

' Cargar el único cliente
Public Sub LoadSingleCustomer As Map
	If File.Exists(File.DirInternal, SINGLE_FN) = False Then
		Dim m As Map : m.Initialize
		Return m
	End If
	Return ReadJson
End Sub

' Para compatibilidad con código existente: devuelve lista con 0 o 1 elemento
Public Sub LoadAllCustomers As List
	Dim out As List : out.Initialize
	If File.Exists(File.DirInternal, SINGLE_FN) Then
		Dim m As Map = ReadJson
		If m.IsInitialized Then out.Add(m)
	End If
	Return out
End Sub

' Borra el único archivo
Public Sub ClearAll
	If File.Exists(File.DirInternal, SINGLE_FN) Then File.Delete(File.DirInternal, SINGLE_FN)
End Sub

'========================
'  HELPERS PRIVADOS
'========================
Private Sub CreateList As List
	Dim L As List : L.Initialize
	Return L
End Sub

Private Sub AddUnique(L As List, v As String)
	For Each x As String In L
		If x.EqualsIgnoreCase(v) Then Return
	Next
	L.Add(v)
End Sub

Private Sub JoinList(L As List, sep As String) As String
	Dim sb As StringBuilder : sb.Initialize
	For i = 0 To L.Size - 1
		If i > 0 Then sb.Append(sep)
		sb.Append(L.Get(i))
	Next
	Return sb.ToString
End Sub

Private Sub FechaTexto(dia As String, mes As String) As String
	dia = dia.Trim : mes = mes.Trim
	If dia.Length = 0 Or mes.Length = 0 Then Return ""
	Return $"{dia} de ${mes}"$
End Sub

' === JSON IO ===
Private Sub ReadJson As Map
	Try
		Dim s As String = File.ReadString(File.DirInternal, SINGLE_FN)
		Dim p As JSONParser
		p.Initialize(s)
		Return p.NextObject
	Catch
		Dim m As Map : m.Initialize
		Return m
	End Try
End Sub

Private Sub WriteJson(m As Map)
	Dim gen As JSONGenerator
	gen.Initialize(m)
	File.WriteString(File.DirInternal, SINGLE_FN, gen.ToString)
End Sub

' === Lectores tolerantes ===
Private Sub GetS(m As Map, names() As String, def As String) As String
	For Each k As String In names
		If m.ContainsKey(k) And m.Get(k) <> Null Then Return "" & m.Get(k)
	Next
	Return def
End Sub

Private Sub GetI(m As Map, names() As String, def As Int) As Int
	For Each k As String In names
		If m.ContainsKey(k) And m.Get(k) <> Null Then
			Dim s As String = "" & m.Get(k)
			If IsNumber(s) Then Return s
		End If
	Next
	Return def
End Sub

Private Sub GetD(m As Map, names() As String, def As Double) As Double
	For Each k As String In names
		If m.ContainsKey(k) And m.Get(k) <> Null Then
			Dim s As String = "" & m.Get(k)
			If IsNumber(s) Then Return s
		End If
	Next
	Return def
End Sub

Public Sub GetIFromMap(m As Map, key As String) As Int
	If m.ContainsKey(key) And m.Get(key) <> Null Then
		Dim s As String = "" & m.Get(key)
		If IsNumber(s) Then Return s
	End If
	Return 0
End Sub

Public Sub GetDFromMap(m As Map, key As String) As Double
	If m.ContainsKey(key) And m.Get(key) <> Null Then
		Dim s As String = "" & m.Get(key)
		If IsNumber(s) Then Return s
	End If
	Return 0
End Sub
