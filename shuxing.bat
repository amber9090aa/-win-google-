@echo off
echo 正在调用 PowerShell 脚本执行批量快捷方式修改...

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0update-links.ps1"

echo.
echo ✅ 执行完成！按任意键退出...
pause >nul