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

$url_global = "https://drive.google.com/file/d/1RqcX7JZ1rVE6zAIuJJR1lkJNB2mffERx/view?usp=sharing"
$url_user = "https://drive.google.com/file/d/1WCzscsc8Wn7URTZU93GEIXgP_DSDcdra/view?usp=sharing"
$url_desktop = "https://drive.google.com/file/d/1v_2ibnM0LJRwTBKr0cB5cvHPNW1tn4qQ/view?usp=sharing"


# Download user context files
Start-BitsTransfer -Source $url_user -Destination $user_download

# Download global context files
Start-BitsTransfer -Source $url_global -Destination $global_download

# Download desktop context files
Start-BitsTransfer -Source $url_ddesktop -Destination $desktotp_download

Remove-Item "C:\reset\config.json" -Force -ErrorAction Ignore
Start-BitsTransfer -Source "https://raw.githubusercontent.com/isakagren/HelloWorld-ComputerReset/master/config_1.0" -Destination "C:\reset\config.json"

	
# Expand to folders
expand-archive -Path $user_download -DestinationPath $user_context_folder
expand-archive -Path $global_download -DestinationPath $global_context_folder
expand-archive -Path $desktop_download -DestinationPath $desktop_context_folder
