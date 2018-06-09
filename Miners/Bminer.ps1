. .\Include.ps1

$Path = ".\Bin\NVIDIA-Bminer\bminer.exe"
$Uri = "https://www.bminercontent.com/releases/bminer-lite-v8.0.0-32928c5-amd64.zip"

$Commands = [PSCustomObject]@{
    "equihash" = " -devices $SelGPUCC" #Equihash(fastest 2% dev fee)
}
$Port = "1880"
$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | ForEach-Object {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        Arguments = " -api 127.0.0.1:$Port -uri stratum://$($Pools.(Get-Algorithm($_)).User).$($Pools.(Get-Algorithm($_)).Pass)@$($Pools.(Get-Algorithm($_)).Host):$($Pools.(Get-Algorithm($_)).Port)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Week * .98} # substract 2% devfee
        API = "Wrapper"
        Port = "1880"
        Wrap = $true
        URI = $Uri    
		User = $Pools.(Get-Algorithm($_)).User
    }
}
