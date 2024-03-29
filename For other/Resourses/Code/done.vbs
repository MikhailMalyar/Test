'
'The script was written by Maliar Michael. Скрипт написал Маляр Михаил. GitHub: https://github.com/MichaelMaliar/Windows-10-Tweak.git
'

'Скрипт сообщает о необходимости перезагрузить ПК.
'The script reports the need to restart the PC.
'Если у вас Windows на русском, украинском, казахском, белoрусском или молдавском языке, то будет выведено сообщение на русском языке, для всех остальных языков на английском.

'Отключение вывода ошибок
On Error Resume Next

Set WshShell = CreateObject("WScript.Shell")
Lang = WShShell.RegRead("HKEY_CURRENT_USER\Control Panel\International\LocaleName")

If Lang = "ru-RU" or Lang = "uk-UA" or Lang = "ru-UA" or Lang = "be-BY" or Lang = "ru-BY" or Lang = "kk-KZ" or Lang = "ru-KZ" or Lang = "ro-MD" or Lang = "ru-MD" Then
	MsgBox "Часть изменений вступит в силу только после перезагрузки." & vbCr & "" & vbCr & "Во время загрузки необходимо будет подтвердить отключение двух параметров, нажав два раза клавишу F3."
else MsgBox "Part of the changes will take effect only after a reboot." & vbCr & "" & vbCr & "At boot time, you will need to confirm that you want to disable the two options by pressing F3 twice."
end if

'Удаление файлов твика
SystemRoot = WshShell.ExpandEnvironmentStrings("%SystemRoot%")
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.DeleteFolder SystemRoot &"\Windows_10_Tweak", true