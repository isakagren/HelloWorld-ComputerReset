

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

NET USER Deltagare "" /delete


## ##################### ##
## Create user deltagare ##
## ##################### ##

Write-Output "Adding User..."

NET USER Deltagare "" /ADD

Write-Output "Done!!!"
