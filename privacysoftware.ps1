$downloadsPath = [Environment]::GetFolderPath("MyDocuments")

Write-Host "Downloading WPD & ShutUp10 from the internet..."
New-Item -ItemType Directory -Path $downloadsPath -ErrorAction SilentlyContinue

$outputPath = Join-Path $downloadsPath OOSU10.exe
Invoke-WebRequest -Uri https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe -OutFile $outputPath

$outputPath = Join-Path $downloadsPath WindowsPrivacyDashboard.zip
Invoke-WebRequest -Uri https://wpd.app/get/latest.zip -OutFile $outputPath

Write-Host "Privacy programs downloaded."