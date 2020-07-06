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

$url_global = "https://drive.google.com/uc?export=download&id=1RqcX7JZ1rVE6zAIuJJR1lkJNB2mffERx"
$url_user = "https://drive.google.com/uc?export=download&id=1WCzscsc8Wn7URTZU93GEIXgP_DSDcdra"
$url_desktop = "https://drive.google.com/uc?export=download&id=1v_2ibnM0LJRwTBKr0cB5cvHPNW1tn4qQ"


# Download user context files
Invoke-WebRequest -Uri $url_user -OutFile $user_download

# Download global context files
Invoke-WebRequest -Uri $url_global -OutFile $global_download

# Download desktop context files
Invoke-WebRequest -Uri $url_desktop -OutFile $desktop_download

Remove-Item "C:\reset\config.json" -Force -ErrorAction Ignore
Start-BitsTransfer -Source "https://raw.githubusercontent.com/isakagren/HelloWorld-ComputerReset/master/config_1.0" -Destination "C:\reset\config.json"

	
# Expand to folders
expand-archive -Path $user_download -DestinationPath $user_context_folder
expand-archive -Path $global_download -DestinationPath $global_context_folder
expand-archive -Path $desktop_download -DestinationPath $desktop_context_folder
