# update-links.ps1
$baseDir = "D:\xm\USERDATA"

if (-not (Test-Path $baseDir)) {
    New-Item -Path $baseDir -ItemType Directory | Out-Null
}

foreach ($lnk in Get-ChildItem -Filter *.lnk) {
    $name = [System.IO.Path]::GetFileNameWithoutExtension($lnk.Name)
    $userDataDir = Join-Path $baseDir $name

    if (-not (Test-Path $userDataDir)) {
        New-Item -Path $userDataDir -ItemType Directory | Out-Null
    }

    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($lnk.FullName)

    $shortcut.Arguments = "--user-data-dir=$userDataDir"
    $shortcut.Save()

    Write-Host "✅ 已修改：$($lnk.Name) → --user-data-dir=$userDataDir"
}