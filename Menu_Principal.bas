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
	End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
	
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)

	Root = Root1
	Root.LoadLayout("Pcarga") ' Tu layout de splash
	
	logo.Initialize("Fondo")
	logo.Bitmap = LoadBitmap(File.DirAssets, "Cargar.png")
	Root.AddView(logo,-340dip, -550dip, 1080dip, 1920dip)
End Sub

Public Sub B4XPage_Appear
	' Esto se ejecuta cada vez que se muestra la MainPage
	EsperarYCambiar
End Sub
Private Sub EsperarYCambiar
	Sleep(1000)
	B4XPages.ClosePage(Me) ' O puedes usar ShowPage solo si no quieres cerrar MainPage
End Sub

