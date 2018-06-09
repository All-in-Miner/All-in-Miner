. .\Include.ps1

try {
    $starpool_Request = Invoke-WebRequest "https://www.starpool.biz/api/status" -UseBasicParsing -Headers @{"Cache-Control" = "no-cache"} | ConvertFrom-Json 
}
catch { return }

if (-not $starpool_Request) {return}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Location = "US"

$starpool_Request | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | foreach {
	$starpool_Host = "$_.starpool.biz"
	$starpool_Port = $starpool_Request.$_.port
	$starpool_Algorithm = Get-Algorithm $starpool_Request.$_.name
	$starpool_Coin = ""

	$Divisor = 1000000

	switch ($starpool_Algorithm) {
		"equihash" {$Divisor /= 1000}
		"blake2s" {$Divisor *= 1000}
		"blakecoin" {$Divisor *= 1000}
		"decred" {$Divisor *= 1000}
		"keccak" {$Divisor *= 1000}
		"keccakc" {$Divisor *= 1000}
		"lbry" {$Divisor *= 1000}
	}

	if ((Get-Stat -Name "$($Name)_$($starpool_Algorithm)_Profit") -eq $null) {$Stat = Set-Stat -Name "$($Name)_$($starpool_Algorithm)_Profit" -Value ([Double]$starpool_Request.$_.estimate_last24h / $Divisor)}
	else {$Stat = Set-Stat -Name "$($Name)_$($starpool_Algorithm)_Profit" -Value ([Double]$starpool_Request.$_.estimate_current / $Divisor * (1 - ($starpool_Request.$_.fees / 100)))}

	$ConfName = if ($Config.PoolsConfig.$Name -ne $Null) {$Name}else {"default"}
	$PwdCurr = if ($Config.PoolsConfig.$ConfName.PwdCurrency) {$Config.PoolsConfig.$ConfName.PwdCurrency}else {$Config.Passwordcurrency}

	if ($Config.PoolsConfig.default.Wallet) {
		[PSCustomObject]@{
			Algorithm     = $starpool_Algorithm
			Info          = $starpool
			Price         = $Stat.Live * $Config.PoolsConfig.$ConfName.PricePenaltyFactor
			StablePrice   = $Stat.Week
			MarginOfError = $Stat.Fluctuation
			Protocol      = "stratum+tcp"
			Host          = $starpool_Host
			Port          = $starpool_Port
			User          = $Config.PoolsConfig.$ConfName.Wallet
			Pass          = "$($Config.PoolsConfig.$ConfName.WorkerName),c=$($PwdCurr)"
			Location      = $Location
			SSL           = $false
		}
	}
}

