'
'The script was written by Maliar Michael. Скрипт написал Маляр Михаил. GitHub: https://github.com/MichaelMaliar/Windows-10-Tweak.git
'

'Скрипт сообщающает о необходимости отключить защиту от подделки в Windows Defender.
'The script reports the need to disable Tamper Protection in Windows Defender.
'Если у вас Windows на русском, украинском, казахском, белoрусском или молдавском языке, то будет выведено сообщение на русском языке, для всех остальных языков на английском.

'Отключение вывода ошибок
On Error Resume Next

Set WshShell = CreateObject("WScript.Shell")
Lang = WShShell.RegRead("HKEY_CURRENT_USER\Control Panel\International\LocaleName")

'Сообщение
If Lang = "ru-RU" or Lang = "uk-UA" or Lang = "ru-UA" or Lang = "be-BY" or Lang = "ru-BY" or Lang = "kk-KZ" or Lang = "ru-KZ" or Lang = "ro-MD" or Lang = "ru-MD" Then
	Choice = MsgBox("Убедитесь, что у вас отключена функция «Защита от подделки»! Иначе Windows Defender и SmartScreen не будут выключены." & vbCr & "" & vbCr & "Она находится по пути: «Параметры\Обновление и безопасность\Безопасность Windows\Защита от вирусов и угроз\Параметры защиты от вирусов и других угроз\Управление настройками\Защита от подделки: откл»" & vbCr & "" & vbCr & "Нажмите «OK» чтобы перейти к параметрам.", 48 + 1, "Предупреждение!")
else Choice = MsgBox("Make sure you have Tamper Protection disabled! Otherwise, Windows Defender and SmartScreen will not be turned off." & vbCr & "" & vbCr & "It is on the way: «Settings\Update & Security\Windows Security\Virus & threat protection\Virus & threat protection settings\Manage settings\Tamper Protection: off»" & vbCr & "" & vbCr & "Click «OK» to proceed to the options.", 48 + 1, "Warming!")
end if

'Если пользователь нажмёт «OK» откроется Windows Defender
If Choice = 1 Then
	WshShell.Run "explorer windowsdefender:", 0, false
end if

'Удаление файлов твика
SystemRoot = WshShell.ExpandEnvironmentStrings("%SystemRoot%")
Set FSO = CreateObject("Scripting.FileSystemObject")
FSO.DeleteFolder SystemRoot &"\Windows_10_Tweak", true