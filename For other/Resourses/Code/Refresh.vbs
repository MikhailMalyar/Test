'Перезагрузка проводника без окна консоли
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd /c taskkill /f /im explorer.exe && start explorer.exe", 0, false
WScript.Sleep 500

'Скрипт правильно обновляет Рабочий стол, очищая (обновляя) кэш иконок командами в 8-ой и 9-ой строках.
'Побочным действием такой очистки кэша и обновления оболочки является создание файлов-отчётов.
'Команды, начинающиеся с 14-ой строки, отвечают за удаление этих логов после паузы в 1 секунду (10-я строка).
'13-я строка указывает сценарию переменную среду %userprofile%, которую Microsoft ® WBSH по умолчанию не понимает.
'Автор скрипта: Аванесян Х.С.

Set oShell = WScript.CreateObject ("WScript.Shell")
oShell.run "ie4uinit.exe -show"
oShell.run "ie4uinit.exe -ClearIconCache"
WScript.Sleep 1000
Set objFSO = CreateObject("Scripting.FileSystemObject")
set WshShell = CreateObject("WScript.Shell")
UserProfile = WshShell.ExpandEnvironmentStrings("%USERPROFILE%")
If objFSO.FileExists(USERPROFILE &"\AppData\Local\Microsoft\Internet Explorer\ie4uinit-ClearIconCache.log") Then
objFSO.DeleteFile USERPROFILE &"\AppData\Local\Microsoft\Internet Explorer\ie4uinit-ClearIconCache.log"
End If
If objFSO.FileExists(USERPROFILE &"\AppData\Local\Microsoft\Internet Explorer\ie4uinit-show.log") Then
objFSO.DeleteFile USERPROFILE &"\AppData\Local\Microsoft\Internet Explorer\ie4uinit-show.log"
End If
If objFSO.FileExists(USERPROFILE &"\AppData\Local\Microsoft\Internet Explorer\brndlog.txt") Then
objFSO.DeleteFile USERPROFILE &"\AppData\Local\Microsoft\Internet Explorer\brndlog.txt"
End If
If objFSO.FileExists(USERPROFILE &"\AppData\Local\Microsoft\Internet Explorer\ie4uinit-UserConfig.log") Then
objFSO.DeleteFile USERPROFILE &"\AppData\Local\Microsoft\Internet Explorer\ie4uinit-UserConfig.log"
End If