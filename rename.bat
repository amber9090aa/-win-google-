@echo off
setlocal enabledelayedexpansion

set num=0

echo 正在获取当前目录所有 .lnk 文件，并按文件名排序...

rem 用临时文件保存所有lnk文件列表（完整文件名）
set tempFile=%TEMP%\all_links.txt
del "%tempFile%" >nul 2>&1

for %%F in (*.lnk) do (
  echo %%F>>"%tempFile%"
)

if not exist "%tempFile%" (
  echo ❌ 当前目录没有任何 .lnk 文件，脚本结束。
  pause
  exit /b
)

rem 对文件列表排序后开始重命名
for /f "usebackq delims=" %%F in (`sort "%tempFile%"`) do (
  set /a num+=1
  set "newName=0000!num!"
  set "newName=!newName:~-4!"
  echo ✅ 重命名 %%F → !newName!.lnk
  ren "%%F" "!newName!.lnk"
)

del "%tempFile%" >nul 2>&1

echo.
echo 🎉 所有文件重命名完成！
pause