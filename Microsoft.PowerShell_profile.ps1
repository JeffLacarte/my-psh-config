
function prompt
{
    $myusername = $env:username
    $myhostname = $env:computername
	$mydomain = $env:UserDomain
    $myhostname = $myhostname.tolower()
	$myprompt = 26..27|%{[char]$_}
    
    $mypwd = "$(Get-Location)`r`n$("+"*(Get-Location -Stack).Count)"
	$mycustomprompt = echo $myusername`@$myhostname + "." + $mydomain + " in " + $pwd
    
    write-host -NoNewLine -ForegroundColor Yellow "$myusername"
    
    write-host -NoNewLine -ForegroundColor White "`@"
    write-host -NoNewLine -ForegroundColor Blue "$myhostname"
    write-host -NoNewLine -ForegroundColor White " in "
    write-host -NoNewLine -ForegroundColor Green "$mypwd"
    write-host -NoNewLine -ForegroundColor Yellow  "$myprompt"
    " "
}

if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource History
}