VarSetCapacity(DEVMODE, 220, 0)
NumPut(220, DEVMODE, 68, "short")   ; dmSize
DllCall("EnumDisplaySettingsW", "ptr", 0, "int", -1, "ptr", &DEVMODE)
width := NumGet(DEVMODE, 172, "uint")
height := NumGet(DEVMODE, 176, "uint")



<^>!Left::
CurrentBrightness := GetCurrentBrightNess()
NumPut(width, DEVMODE, 176, "int")
NumPut(height, DEVMODE, 172, "int")
NumPut(DMDO_90 := 1, DEVMODE, 84, "int")   ; dmDisplayOrientation
DllCall("ChangeDisplaySettingsW", "ptr", &DEVMODE, "uint", 0)
ChangeBrightness(CurrentBrightness)
return

<^>!Down::
CurrentBrightness := GetCurrentBrightNess()
NumPut(width, DEVMODE, 172, "int")
NumPut(height, DEVMODE, 176, "int")
NumPut(DMDO_180 := 2, DEVMODE, 84, "int")   ; dmDisplayOrientation
DllCall("ChangeDisplaySettingsW", "ptr", &DEVMODE, "uint", 0)
ChangeBrightness(CurrentBrightness)
return

<^>!Right::
CurrentBrightness := GetCurrentBrightNess()
NumPut(width, DEVMODE, 176, "int")
NumPut(height, DEVMODE, 172, "int")
NumPut(DMDO_270 := 3, DEVMODE, 84, "int")   ; dmDisplayOrientation
DllCall("ChangeDisplaySettingsW", "ptr", &DEVMODE, "uint", 0)
ChangeBrightness(CurrentBrightness)
return

<^>!Up::
CurrentBrightness := GetCurrentBrightNess()
NumPut(width, DEVMODE, 172, "int")
NumPut(height, DEVMODE, 176, "int")
NumPut(DMDO_DEFAULT := 0, DEVMODE, 84, "int")   ; dmDisplayOrientation
DllCall("ChangeDisplaySettingsW", "ptr", &DEVMODE, "uint", 0)
ChangeBrightness(CurrentBrightness)
return


; Functions
ChangeBrightness( ByRef brightness := 50, timeout = 1 )
{
	if ( brightness >= 0 && brightness <= 100 )
	{
		For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
			property.WmiSetBrightness( timeout, brightness )	
	}
 	else if ( brightness > 100 )
 	{
 		brightness := 100
 	}
 	else if ( brightness < 0 )
 	{
 		brightness := 0
 	}
}

GetCurrentBrightNess()
{
	For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		currentBrightness := property.CurrentBrightness	

	return currentBrightness
}
