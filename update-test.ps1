# Clean up and uninstall old programs

$user_context_folder = "C:\Users\Default\HW-User-Programs"
$global_context_folder = "C:\HW-Global-Programs"
$desktop_context_folder = "C:\Users\Default\Desktop"

Remove-Item $user_context_folder -Force -Recurse -ErrorAction Ignore
Remove-Item $global_context_folder -Force -Recurse -ErrorAction Ignore
Remove-Item $desktop_context_folder -Force -Recurse -ErrorAction Ignore


mkdir $user_context_folder
mkdir $global_context_folder
mkdir $desktop_context_folder


# Download files

Remove-Item "C:/reset/update/downloads" -Force -Recurse -ErrorAction Ignore
mkdir "C:/reset/update/downloads"

$user_download = "C:\reset\update\downloads\userctx.zip"
$global_download = "C:\reset\update\downloads\globalctx.zip"
$desktop_download = "C:\reset\update\downloads\desktopctx.zip"

$url_global = "https://drive.google.com/uc?export=download&confirm=2fTm&id=1RqcX7JZ1rVE6zAIuJJR1lkJNB2mffERx"
$url_user = "https://drive.google.com/uc?export=download&confirm=tZCB&id=1WCzscsc8Wn7URTZU93GEIXgP_DSDcdra"
$url_desktop = "https://drive.google.com/uc?export=download&id=1v_2ibnM0LJRwTBKr0cB5cvHPNW1tn4qQ"


## Funktion för att ladda ner stora filer från Google Drive, då de kräver att man klickar OK för stora filer. 
function large_file_download {
param(
[string]$GoogleFileId,
[string]$FileDestination)

# set protocol to tls version 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

echo "https://drive.google.com/uc?export=download&id=$GoogleFileId"

# Download the Virus Warning into _tmp.txt
Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=$GoogleFileId" -OutFile "_tmp.txt" -SessionVariable googleDriveSession

# Get confirmation code from _tmp.txt
$searchString = Select-String -Path "_tmp.txt" -Pattern "confirm="
$searchString -match "confirm=(?<content>.*)&amp;id="
$confirmCode = $matches['content']

# Delete _tmp.txt
Remove-Item "_tmp.txt"

# Download the real file
Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&confirm=${confirmCode}&id=$GoogleFileId" -OutFile $FileDestination -WebSession $googleDriveSession
}

# Download user context files
large_file_download -GoogleFileId "1RqcX7JZ1rVE6zAIuJJR1lkJNB2mffERx" -FileDestination $global_download
large_file_download -GoogleFileId "1WCzscsc8Wn7URTZU93GEIXgP_DSDcdra" -FileDestination $user_download


# Download desktop context files
Invoke-WebRequest -Uri $url_desktop -OutFile $desktop_download

Remove-Item "C:\reset\config.json" -Force -ErrorAction Ignore
Start-BitsTransfer -Source "https://raw.githubusercontent.com/isakagren/HelloWorld-ComputerReset/master/config_1.0" -Destination "C:\reset\config.json"

	
# Expand to folders
expand-archive -Path $user_download -DestinationPath $user_context_folder
expand-archive -Path $global_download -DestinationPath $global_context_folder
expand-archive -Path $desktop_download -DestinationPath $desktop_context_folder
