Import-Module D:\tools\utils\PSSlack\PSSlack

$wc = new-object System.Net.WebClient
$ip=$wc.DownloadString("http://myexternalip.com/raw")

$oip = Import-Clixml D:\tools\utils\ip.xml

if($ip -ne $oip) {
	
	$ip  | Export-Clixml D:\tools\utils\ip.xml

	$Uri = "https://hooks.slack.com/services/KEY"

Send-SlackMessage -Uri $Uri `
                  -Channel '@nenads' `
                  -Parse full `
                  -Text "Hello @nenads, your ip is $ip"
}
