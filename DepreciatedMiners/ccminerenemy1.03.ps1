. .\Include.ps1

$Path = ".\Bin\NVIDIA-ccminerenemy\ccminer.exe"
$Uri = "http://nemos.dx.am/opt/nemos/ccminerenemy1.03.7z"

$Commands = [PSCustomObject]@{
    #"phi" = " -d $SelGPUCC" #Phi
    #"bitcore" = " -d $SelGPUCC" #Bitcore
    #"jha" = " -d $SelGPUCC" #Jha
    #"blake2s" = " -d $SelGPUCC" #Blake2s
    #"blakecoin" = " -d $SelGPUCC" #Blakecoin
    #"vanilla" = "" #BlakeVanilla
    #"cryptonight" = " -i 10.5 -l 8x120 --bfactor=8 -d $SelGPUCC --api-remote" #Cryptonight
    #"decred" = "" #Decred
    #"equihash" = "" #Equihash
    #"ethash" = "" #Ethash
    #"groestl" = " -d $SelGPUCC" #Groestl
    #"hmq1725" = " -d $SelGPUCC" #hmq1725
    #"keccak" = "" #Keccak
    #"lbry" = " -d $SelGPUCC" #Lbry
    #"lyra2v2" = "" #Lyra2RE2
    #"lyra2z" = " -d $SelGPUCC --api-remote --api-allow=0/0 --submit-stale" #Lyra2z
    #"myr-gr" = "" #MyriadGroestl
    #"neoscrypt" = " -d $SelGPUCC" #NeoScrypt
    #"nist5" = "" #Nist5
    #"pascal" = "" #Pascal
    #"qubit" = "" #Qubit
    #"scrypt" = "" #Scrypt
    #"sia" = "" #Sia
    #"sib" = "" #Sib
    #"skein" = "" #Skein
    #"skunk" = " -d $SelGPUCC" #Skunk
    #"timetravel" = " -d $SelGPUCC" #Timetravel
    #"tribus" = " -d $SelGPUCC" #Tribus
    #"x11" = "" #X11
    #"veltor" = "" #Veltor
    #"x11evo" = " -d $SelGPUCC" #X11evo
    "x17" = " -r 0 -i 19 -d $SelGPUCC -N 1" #X17(Alexis 78-v1.2 faster)
    #"x16r" = " -d $SelGPUCC -N 3" #X16r(ccminerx16r faster)
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        Arguments = "-b $($Variables.MinerAPITCPPort) -a $_ -o stratum+tcp://$($Pools.(Get-Algorithm($_)).Host):$($Pools.(Get-Algorithm($_)).Port) -u $($Pools.(Get-Algorithm($_)).User) -p $($Pools.(Get-Algorithm($_)).Pass)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Week}
        API = "Ccminer"
        Port = $Variables.MinerAPITCPPort
        Wrap = $false
        URI = $Uri
        User = $Pools.(Get-Algorithm($_)).User
    }
}
