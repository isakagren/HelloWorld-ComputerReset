## ############################### ##
## Clean C:\Users\Default\ folders ##
## ############################### ##
Write-Output "Cleaning upp..."
Remove-Item C:\Users\Default\Documents\* -Recurse -Force
Remove-Item C:\Users\Default\Desktop\* -Recurse -Force

## ########### ##
## Unzip files ##
## ########### ##
Write-Output "Preparing for install..."
Expand-Archive documents.zip -DestinationPath C:\Users\Default\Documents\
Expand-Archive desktop.zip -DestinationPath C:\Users\Default\Desktop\


## ###################### ##
## Log off User Deltagare ##
## ###################### ##

Write-Output "Logging off User..."

$ComputerName = "localhost"
$UserName = "deltagare"
foreach ($c in $ComputerName) {
	## Find the user's session ID
	$compArgs = "/server:$c"	
	$whereFilter = [scriptblock]::Create("`$_ -match '$UserName'")
	$sessions = ((quser $compArgs | Where-Object $whereFilter))
	($sessions -split ' +')[2] | ForEach-Object {
		logoff $_ $compArgs
    }
}

## ##################### ##
## Remove user deltagare ##
## ##################### ##

Write-Output "Removing User..."

Remove-LocalUser -Name "deltagare"


## ##################### ##
## Create user deltagare ##
## ##################### ##

Write-Output "Adding User..."

NET USER Deltagare "" /ADD

Write-Output "Done!!!"


## ################### ##
## Log on to deltagare ##
## ################### ##
## NYI


## ############### ##
## Intall software ##
## ############### ##
## NYI

