# Clean up and uninstall old programs

$user_context_folder = "C:\Users\Default\HW-User-Programs"
$global_context_folder = "C:\HW-Global-Programs"

Remove-Item $user_context_folder -Force -Recurse -ErrorAction Ignore
Remove-Item $global_context_folder -Force -Recurse -ErrorAction Ignore


mkdir $user_context_folder
mkdir $global_context_folder


# Download files


Remove-Item "C:/reset/update/downloads" -Force -Recurse -ErrorAction Ignore
mkdir "C:/reset/update/downloads"

$user_download = "C:\reset\update\downloads\userctx.zip"
$global_download = "C:\reset\update\downloads\globalctx.zip"

$url_global = "https://github.com/isakagren/HelloWorld-ComputerReset/raw/master/globalctx_1.zip"
$url_user = "https://github.com/isakagren/HelloWorld-ComputerReset/raw/master/userctx_1.zip"


# Download user context files
Start-BitsTransfer -Source $url_user -Destination $user_download

# Download global context files
Start-BitsTransfer -Source $url_global -Destination $global_download

Remove-Item "C:\reset\config.json" -Force -ErrorAction Ignore
Start-BitsTransfer -Source "https://raw.githubusercontent.com/isakagren/HelloWorld-ComputerReset/master/config_1.0" -Destination "C:\reset\config.json"

	
# Expand to folders
expand-archive -Path $user_download -DestinationPath $user_context_folder
expand-archive -Path $global_download -DestinationPath $global_context_folder
