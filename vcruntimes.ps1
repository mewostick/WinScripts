$downloadsPath = [Environment]::GetFolderPath("MyDocuments")
$WinScriptsDownloadsPath = Join-Path $downloadsPath "WinScripts - Downloads"
$urlBase = "https://dl.catdomeow.xyz/Windows/VC-Runtimes/"

$fileNames = @("vcredist2005_x86.exe", "vcredist2005_x64.exe", "vcredist2008_x86.exe", "vcredist2008_x64.exe", "vcredist2010_x86.exe", "vcredist2010_x64.exe", "vcredist2012_x86.exe", "vcredist2012_x64.exe", "vcredist2013_x86.exe", "vcredist2013_x64.exe", "vcredist2015_2017_2019_2022_x86.exe", "vcredist2015_2017_2019_2022_x64.exe")

Write-Host "Downloading VC Runtimes..."
New-Item -ItemType Directory -Path $WinScriptsDownloadsPath -ErrorAction SilentlyContinue

foreach ($fileName in $fileNames) {
    $url = $urlBase + $fileName
    $outputPath = Join-Path $WinScriptsDownloadsPath $fileName
    Invoke-WebRequest -Uri $url -OutFile $outputPath
}

Write-Host "Installing VC Runtimes..."
foreach ($fileName in $fileNames) {
    $filePath = Join-Path $WinScriptsDownloadsPath $fileName
    Start-Process -FilePath $filePath -ArgumentList "/q" -Wait
}

Write-Host "VC Runtimes installed."