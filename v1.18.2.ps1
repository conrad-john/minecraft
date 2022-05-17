# Variables for Versioning
$OptiFineVersion = "OptiFine_1.18.2_HD_U_H7.jar"
$BslVersion = "BSL_v8.1.02.2.zip"
$BetterLeavesVersion = "Better+Leaves+Addon+V2.8-1.18.zip"

# Set working directory t\o executable directory
Set-Location $PSScriptRoot

# Install Java
Start-Process -FilePath ".\jre-8u281-windows-x64.exe" -Wait

# Install OptiFine
$OptiFinePath = $PSScriptRoot + "\" + $OptiFineVersion
$arr = @("-jar",[String]$OptiFinePath)
Start-Process -FilePath "C:\Program Files\Java\jre1.8.0_281\bin\java.exe" -ArgumentList $arr -Wait

# Copy BSL to shaderpacks folder
$BslPath = $PSScriptRoot + "\" + $BslVersion
$shaderpacksPath = $env:APPDATA + "\Roaming\.minecraft\shaderpacks"
Copy-Item -Path $BslPath -Destination $shaderpacksPath

# Copy Better Leaves to resourcepacks folder
$BetterLeavesPath = $PSScriptRoot + "\" + $BetterLeavesVersion
$resourcepacksPath = $env:APPDATA + "\Roaming\.minecraft\resourcepacks"
Copy-Item -Path $BetterLeavesPath -Destination $resourcepacksPath

# Open Read Me
$readMePath = $PSScriptRoot + "\AfterRunning.txt"
Invoke-Item -Path $readMePath