B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=13.1
@EndOfDesignText@
Sub Class_Globals
	Private Root As B4XView 'ignore
	Private xui As XUI 'ignore
	Private Plataforma As Spinner
	Private Problema As Spinner
	Private Resolver_problema As Button
	Private VTTS As TTS
	Private Volver As Button
	Private WebView1 As WebView

End Sub

'You can add more parameters here.
Public Sub Initialize As Object
	Return Me
End Sub

'This event will be called once, before the page becomes visible.
Private Sub B4XPage_Created (Root1 As B4XView)
	Root = Root1
	VTTS.Initialize("VTTS")
	Root.LoadLayout("Problemas")
	Llenar_Opciones
	WebView1.JavaScriptEnabled = True
	WebView1.LoadUrl("https://perfiles-eclipse.jimdosite.com")
	' Crear un ScrollView de 100% ancho x 100% alto
	
End Sub

Private Sub Llenar_Opciones ()
	
	
	Plataforma.Clear
	CambiarFondoSpinner2(Plataforma, Colors.LightGray)
	Plataforma.Add("Plataforma")

	Plataforma.Add ("Netflix")
	Plataforma.Add("Disney Plus")
	Plataforma.Add("HBO Platino")
	Plataforma.Add("Spotify")
	Plataforma.Add("Canva Pro")
	Plataforma.Add("Paqueteria Office")
	Plataforma.Add("Prime Video")
	Plataforma.Add("Chat GPT Plus")
	Plataforma.Add("Vix Premium")
	Problema.Clear
	ChangeSpinnerBackground(Problema, Colors.LightGray)
	Problema.Add("Problema")
	Problema.Add ("No formo parte del hogar")
	Problema.Add ("Pasaron mis 15 dias temporales")
	Problema.Add ("La contraseña o correo es incorrecto")
	Problema.Add ("Se alcanzo el limite de dispositivos")
	Problema.Add ("No me aparece la cuenta Premium")
	Problema.Add("No aparece el perfil con mi nombre")
	Problema.Add ("El pin que me pasaron es incorrecto")
	Problema.Add("Alguien mas esta usando mi cuenta")
	
	
	
End Sub


Private Sub FuncionOpciones ()
	Dim Valor1 As String
	Dim Valor2 As String
	Valor1 = Plataforma.SelectedItem
	Valor2 = Problema.SelectedItem
	
	
	If Valor1 = "Plataforma" Or Valor2 = "Problema" Then
		ToastMessageShow ("Debes seleccionar alguna de las opciones validas",True)
		WebView1.LoadUrl("https://perfiles-eclipse.jimdosite.com")

	End If
	
	If Valor1="Netflix" And Valor2="No formo parte del hogar" Then
		WebView1.LoadUrl("https://help.netflix.com/es/node/124925")
		VTTS.Speak("Si te aparece que no formas parte del hogar de netflixt. Solo tienes que darle click en una de las dos opciones que tienes en la pantalla. la opcion de estoy fuera de casa, te pedira que envies un mail con un codigo que tendras que poner, para tener acceso, dos semanas a netflix sin este problema. la opcion de actualizar hogar de netflix, te pedira enviar un mail, para que los administradores de la cuenta te acepten el cambio y ya no tengas el problema, en ambos casos, necesitas enviarle mensaje a los administradores, para que te proporcionen la informacion y permisos necesarios",True)
	End If
	
	If Valor1="Disney Plus" And Valor2="No formo parte del hogar" Then
		WebView1.LoadUrl("https://www.mediotiempo.com/otros-mundos/que-hacer-si-aparece-mensaje-esta-tv-no-forma-parte-de-tu-hogar-de-disney-plus")
		VTTS.Speak("Si te aparece que no formas parte del hogar de Disney Plus. Solo tienes que darle click en una de las dos opciones que tienes en la pantalla. la opcion de estoy fuera de casa, te pedira que envies un mail con un codigo que tendras que poner, para tener acceso, dos semanas a Disney Plus sin este problema. la opcion de actualizar hogar de Disney Plus, te pedira enviar un mail, para que los administradores de la cuenta te acepten el cambio y ya no tengas el problema, en ambos casos, necesitas enviarle mensaje a los administradores, para que te proporcionen la informacion y permisos necesarios",True)	
	End If	
	
    If Valor1="Netflix" And Valor2="Pasaron mis 15 dias temporales" Then 
		WebView1.LoadUrl("https://www.adslzone.net/noticias/streaming-tv/ver-netflix-otro-televisor/")
		VTTS.Speak("Si ya han pasado tus dos semanas de acceso temporal a Netflixt . No te preocupes, cada mes cambiamos las cuentas, justo para que no pase esto, si no hemos cambiado las cuentas, manda mensaje a los administradores",True)   
	End If
			
    If Valor1="Disney Plus" And Valor2="Pasaron mis 15 dias temporales" Then
		WebView1.LoadUrl("https://www.adslzone.net/como-se-hace/plataformas-tv/compartir-cuenta-disney-plus/")
		VTTS.Speak("Si ya han pasado tus dos semanas de acceso temporal a Disney Plus . No te preocupes, cada mes cambiamos las cuentas, justo para que no pase esto, si no hemos cambiado las cuentas, manda mensaje a los administradores",True)    
    End If
	
	If Valor1 <> "Paqueteria Office" And Valor1 <> "Spotify" And Valor2="La contraseña o correo es incorrecto" Then
		WebView1.LoadUrl("https://perfiles-eclipse.jimdosite.com")
		VTTS.Speak("Si vez que la contraseña o correo son incorrectos, lo primero que debes de hacer es verificar si copiaste correctamente la informacion proprocionada, si aun persiste el error, habla con los administradores, constantemente cambiamos las contraseñas, por seguridad",True)
	End If  
	
	If Valor1 <> "Paqueteria Office" And Valor1 <> "Spotify" And Valor1 <> "Chat GPT Plus" And Valor1 <> "Canva Pro" And Valor1 <> "Vix Premium" And Valor2="Se alcanzo el limite de dispositivos" Then
		WebView1.LoadUrl("https://ultra.pe/blog/cuantos-dispositivos-se-pueden-conectar-para-ver-series-y-peliculas/")
		VTTS.Speak("las plataforma de estreaming tienen un limite de dispositivos que pueden reproducir peliculas al mismo tiempo, el limite mas comun, en plataformas, como netflixt o disney plus es de 4 dispositivos al mismo tiempo ",True)
    End If
	
	If Valor1 <> "Paqueteria Office" And Valor1 <> "Spotify"  And Valor2="No aparece el perfil con mi nombre" Or Valor2="El pin que me pasaron es incorrecto" Then
		WebView1.LoadUrl("https://perfiles-eclipse.jimdosite.com")
		VTTS.Speak("Primero, verifique bien si no es un error de usted o de la cuenta, cierre e inicie sesion, si el error persiste, contacte con los administradores, puede ser un error de ellos",True)
	End If
	
	If Valor1 = "Vix Premium"  And Valor2="No aparece el perfil con mi nombre" Then
		WebView1.LoadUrl("https://perfiles-eclipse.jimdosite.com")
		VTTS.Speak("Esta cuenta es compartida, es decir, no tiene un perfil por cada cliente, si no que todos pueden usar cualquier perfil que gusten, no se preocupe esta cuenta no tiene limite de dispositivos",True)
	
	End If
	
	If Valor1 = "Canva Pro"  And Valor2="No aparece el perfil con mi nombre" Then
		WebView1.LoadUrl("https://perfiles-eclipse.jimdosite.com")
		VTTS.Speak("Esta cuenta es compartida, es decir, no tiene un perfil por cada cliente, si no que los clientes pueden usar cualquier perfil que gusten, no se preocupe esta cuenta no tiene limite de dispositivos",True)
	
	End If
	
	If Valor1 = "Canva Pro" And Valor1 = "Vix Premium" And Valor2 = "El pin que me pasaron es incorrecto" Then
		ToastMessageShow("Opcion Invalida",True)
	End If
	
	If Valor1 <> "Paqueteria Office" And Valor1 <> "Vix Premium" And Valor1 <> "Canva Pro"  And Valor2="Alguien mas esta usando mi cuenta" Then
		WebView1.LoadUrl("https://perfiles-eclipse.jimdosite.com")
		VTTS.Speak("Muy Probablemente son otros clientes haciendo mal uso de las cuentas, haganle saber a los administradores y ellos resolveran el problema",True)
	End If
	
	If Valor2 = "No me aparece la cuenta Premium" Then
		WebView1.LoadUrl("https://perfiles-eclipse.jimdosite.com")
		VTTS.Speak("No se precupe, aveces por cuestiones fuera de nuestro control, no podemos pagar las cuentas, o simplemente, es error de la plataforma, esto suele pasar con fallos de spotifai o Vix",True)
	End If
	
	
End Sub

Sub ChangeSpinnerBackground(spn As Spinner, color As Int)
	Dim jo As JavaObject = spn
	jo.RunMethod("setBackgroundColor", Array As Object(color))
End Sub

Sub CambiarFondoSpinner2(spn As Spinner, color As Int)
	Dim jo As JavaObject = spn
	jo.RunMethod("setBackgroundColor", Array As Object(color))
End Sub



'You can see the list of page related events in the B4XPagesManager object. The event name is B4XPage.

Private Sub Resolver_problema_Click
	FuncionOpciones
End Sub

Private Sub Volver_Click
	B4XPages.ShowPageAndRemovePreviousPages("MainPage")
End Sub

Private Sub WebView1_OverrideUrl (Url As String) As Boolean
	Dim i As Intent
	i.Initialize(i.ACTION_VIEW, Url)
	StartActivity(i)
	Return True ' Devuelve True para evitar que WebView lo abra internamente
End Sub