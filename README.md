 # All-in-Miner

Why another mining suite? Because not all mining software performs the same on every GPU/OS/drivers/etc...

Hence, our idea is to build a mining suite that contains all contemporary mining software. That means the initial benchmarking process might take longer, however, you will get better results with your individual setup!

Do we miss any (new) mining software? Let us know and open an issue on Github!

All-in-Miner monitors mining pools in real-time in order to find the most profitable algo.
 
*****

All-in-Miner monitors mining pools in real-time in order to find the most profitable algo

	 GUI and easy configuration
	 Auto Benchmarks Each algo to get optimal speeds 
	 Fully automated 
	 Auto Downloads Miners

*****

Easy configuration, easy start:

      Run All-in-Miner.bat
      1. Config tab
      2. Set your Wallet address and Username
      3. Select your pool/s and load default Algos button. (Remove any algos you do not want to mine)
      4. "Save Config"
      5. Close
      Run All-in-Miner.bat
      6."Start"
      
      note: 2. you only need to change Username if you are using Miningpoolhub
      
  Fee:
     
      There is a 8 minute per day fee (0.5%), that can be changed in the config (Minimum is 3)0.2%
      We want to stay completely transparent on the way fees are managed in the product. Donations occurs once every 24 hours for the selected amount of time (default 8 minutes). The first donation sequence occurs 1 hour after miners are started. If Interval is set higher than the donation time, the interval will prime. Example for default parameters. Miners started at 10, First donation cycle runs at 10:52 untill 11, Next donation cycle occurs 24 hours after.All donation time and addresses are recording in the logs folder.

*****

Additional features list, made possible by "MrPlus"
Speical Thankyou To "MrPlus" amazing work with the GUI, PLUS profit calculations & Earnings Tracking

   GUI
   
      All-in-Miner has a GUI making it easy to configure and run.
	  Relies on config files. No need to edit bat files. Simply run All-in-Miner 
	  Set the config on the config tab, save, close, run

   Pause mining
   
      Ability to pause miners while keeping other jobs running (pause button)
      This will stop mining activity
      BrainPlus will still run in the background avoiding the learning phase on resume
      EarningTracker will still run in the background avoiding the learning phase on resume

   prerun
   
      Ability to run a batch prior switching to a specific algo.
      For example, can be used to set per algo OC via nvidiaInspector
      Simply create a file named <AlgoName>.bat in prerun folder
      If <AlgoName>.bat does not exist, will try to launch prerun/default.bat
      Use overclock with caution

   Per pools config (Advanced)
   
        - **This is for advanced users. Do not use if you do not know what you are doing.**
        - You can now set specific options per pool. For example, you can mine NiceHash on the internal wallet and other pools on a valid wallet. This configuration is provided as an example in Config\PoolsConfig-NHInternal.json
          - Available options
            - Wallet = your wallet address
            - UserName = your MPH user name
            - WorkerName = your worker name
            - PricePenaltyFactor = See explanation below
          - Usage
            - The file Config\PoolsConfig.json contains per pool configuration details. If a pool is listed in this file,
	    the specific settings will be taken into account. If not, the setting for the entry name default will be used.
	    **Do not delete the default entry.**
            - Edit Config\PoolsConfig.json
            - Add an entry for the pool you want to customize
              - The name must be the All-in-Miner name for the pool. ie. for ahashpool, if you use Plus. The name is ahashpoolplus.
              - (**careful with json formating ;)**)
              - Best way is to duplicate the default entry
        - Note that the GUI only updates the default entry. Any other changes need to be done manualy

   PricePenaltyFactor

        - When using advanced per pool configuration, it is possible to add a penalty factor for a specific pool. This simply adds as a multiplicator on estimations presented by the pool.
        - Example scenario
          - NiceHash as a 4% fee - Set PricePenaltyFactor to 0.96 (1-0.04)
          - You feel like a pool is exaggerating his estimations by 10% - Set PricePenaltyFactor to 0.9

   ahashpoolplus / zergpoolplus / zpoolplus / blazepoolplus / phiphipoolplus / blockmastersplus / hashrefineryplus / starpoolplus
   
      Uses calculations based on 24hractual and currentestimate ahashpool prices to get more realistic estimate.
      Includes some trust index based on past 1hr currentestimate variation from 24hr.
      AND is NOT sensible to spikes.
      This shows less switching than following Current Estimate and more switching that following the 24hr Actual.
      Better profitability.

   Earnings Tracking
   
      Displays BTC/H and BTC/D as well a estimation of when the pool payment threshold will be reached.
      Supported pools:
            ahashpool
            zergpool
            zpool
            nicehash
            miningpoolhub (partial)
      If mining more that one pools, shows stats for any supported pool
      Press key e in the console window to show/hide earnings

   Support running multiple instances
   
      **Experimental**
      More than one instance of All-in-Miner can run on the same rig
      Each instance must be placed in it's own directory
      Miner has to be started prior the launch of the next instance

   Optional miners (Advanced)
   
      Some miners are not enabled by default in All-in-Miner for a variety of reasons
      A new folder can be found called "OptionalMiners" containing .ps1 files for some miners
      For advanced users, refer to OptionalMiners\Readme.txt on how to use

   Algo switching log
   
      Simple algo switching log in csv switching.log file found in Logs folder.
      You can easily track switching rate.

   Pools variants

      24hr - uses last 24hour Actual API too request profit
         -Low switching rate
      plus - uses advanced calculations to maximize profit
         -Best switching rate
      normal - uses current estimate API too request profit
         -High switching rate

   Console Display Options
   
      Use -UIStyle Light or -UIStyle Full in config.json
            Full = Usual display (Default)
            Light = Show only currently mining info
      UIStyle automaticaly swtiches to Full during benchmarking.

   In session console display toggle
   
      Press key s in the window to switch between light and full display
      Press key e in the window to show/hide earnings 
      Will toggle display at next refresh

   New version notification
   
      All-in-Miner will notify new version availability
*****
 

If you have Windows 7, 8, or 8.1, please update PowerShell:
https://www.microsoft.com/en-us/download/details.aspx?id=50395

CCMiner may need 'MSVCR120.dll' if you don't already have it:
https://www.microsoft.com/en-gb/download/details.aspx?id=40784

CCMiner may need 'VCRUNTIME140.DLL' if you don't already have it:
https://www.microsoft.com/en-us/download/details.aspx?id=48145

running multiple cards its recommended to increase Virtual Memory 64gb is optimal

Requires Nvidia driver 397.44 or newer

Some miners do not support more that 9 cards

*****

Any BTC donations will be much appreciated by the contributors:

All-in-Miner: 13XUToznfHibz4yzuJ3yVANzfUch384vUL

aaronsace: 1MsrCoAt8qM53HUMsUxvy9gMj3QVbHLazH

nemo: 1QGADhdMRpp9Pk5u5zG1TrHKRrdK5R81TE

MrPlus: 134bw4oTorEJUUVFhokDQDfNqTs7rBMNYy


Licensed under the GNU General Public License v3.1
Permissions of this strong copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights. https://github.com/All-in-Miner/All-in-Miner/blob/master/LICENSE
