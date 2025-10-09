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
	Dim Menu_Principal_obj As Menu_Principal
	
End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Menu_Principal_obj.Initialize
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)

    

	Root = Root1
	Root.LoadLayout("Carga")
	logo.Initialize("Fondo")
	logo.Bitmap = LoadBitmap(File.DirAssets, "Eclipse2.png")
	Root.AddView(logo,-340dip, 0dip, 1080dip, 1920dip)
	B4XPages.AddPage("Menu_Principal",Menu_Principal_obj)

End Sub


Public Sub B4XPage_Appear
	' Esto se ejecuta cada vez que se muestra la MainPage
	EsperarYCambiar
End Sub

Private Sub EsperarYCambiar
	Sleep(1000)
	B4XPages.ShowPageAndRemovePreviousPages("Menu_Principal")' O puedes usar ShowPage solo si no quieres cerrar MainPage
End Sub
'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.