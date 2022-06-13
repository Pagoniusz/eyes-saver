function createNotification{
	Add-Type -AssemblyName System.Windows.Forms; 
	$global:balloon = New-Object System.Windows.Forms.NotifyIcon;
	$path = (Get-Process -id $pid).Path;
	$balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path);
	$balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning; 
	$balloon.BalloonTipText = 'Take a break from the screen...';
	$balloon.BalloonTipTitle = "Eyes saver!"; 
	$balloon.Visible = $true;
	$balloon.ShowBalloonTip(2000);
}

$WShell=New-Object -com "Wscript.Shell";

while($true) {
	$WShell.sendkeys("{SCROLLLOCK}");
	Start-Sleep -Milliseconds 100; 
	$WShell.sendkeys("{SCROLLLOCK}");
	Start-Sleep -Seconds 240;
	createNotification
	echo "Take a break from the screen..." ;
}


clear
