. .\Include.ps1

$Path = ".\\Bin\\Ethash-Claymore-11.0\\EthDcrMiner64.bat"
$Uri = "https://github.com/All-in-Miner/Claymore-Dual-Miner/releases/download/v11.0/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v11.0.zip"

$Commands = [PSCustomObject]@{
    "ethash" = " -di $($SelGPUCC.Replace(',',''))" #Ethash(fastest)
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | ForEach-Object {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        Arguments = "-esm 3 -allpools 1 -allcoins 1 -platform 2 -mport -$($Variables.MinerAPITCPPort) -epool $($Pools.Ethash.Host):$($Pools.Ethash.Port) -ewal $($Pools.Ethash.User) -epsw $($Pools.Ethash.Pass)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Week}
        API = "Claymore"
        Port = $Variables.MinerAPITCPPort #3333
        Wrap = $true
        URI = $Uri
		User = $Pools.(Get-Algorithm($_)).User
    }
}
