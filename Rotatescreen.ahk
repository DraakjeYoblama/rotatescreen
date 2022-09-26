VarSetCapacity(DEVMODE, 220, 0)
NumPut(220, DEVMODE, 68, "short")   ; dmSize
DllCall("EnumDisplaySettingsW", "ptr", 0, "int", -1, "ptr", &DEVMODE)
width := NumGet(DEVMODE, 172, "uint")
height := NumGet(DEVMODE, 176, "uint")


^!Left::
<^>!Left::
NumPut(width, DEVMODE, 176, "int")
NumPut(height, DEVMODE, 172, "int")
NumPut(DMDO_90 := 1, DEVMODE, 84, "int")   ; dmDisplayOrientation
DllCall("ChangeDisplaySettingsW", "ptr", &DEVMODE, "uint", 0)
return

^!Down::
<^>!Down::
NumPut(width, DEVMODE, 172, "int")
NumPut(height, DEVMODE, 176, "int")
NumPut(DMDO_180 := 2, DEVMODE, 84, "int")   ; dmDisplayOrientation
DllCall("ChangeDisplaySettingsW", "ptr", &DEVMODE, "uint", 0)
return

^!Right::
<^>!Right::
NumPut(width, DEVMODE, 176, "int")
NumPut(height, DEVMODE, 172, "int")
NumPut(DMDO_270 := 3, DEVMODE, 84, "int")   ; dmDisplayOrientation
DllCall("ChangeDisplaySettingsW", "ptr", &DEVMODE, "uint", 0)
return

^!Up::
<^>!Up::
NumPut(width, DEVMODE, 172, "int")
NumPut(height, DEVMODE, 176, "int")
NumPut(DMDO_DEFAULT := 0, DEVMODE, 84, "int")   ; dmDisplayOrientation
DllCall("ChangeDisplaySettingsW", "ptr", &DEVMODE, "uint", 0)
return
