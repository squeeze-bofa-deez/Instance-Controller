variable string sZoneNameStart="Cazel's Mesa"
variable string sZoneNameEnd="Pillars Of Flame"
;variable string sZoneShortName="exp01_rgn_sinking_sands_epic01_lockjaw"
variable string sZoneOut_ObjectName="Sinking Sands"

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
}

atom atexit()
{
	echo ${Time}: ${Script.Filename} done
}

objectdef Object_Instance
{
	function:bool RunInstance(int _StartingPoint=0)
	{
		if ${_StartingPoint} == 0
		{
			Obj_OgreIH:LetsGo
			call Obj_OgreIH.Set_VariousOptions
			Switch "${Zone}"
			{
				case exp01_rgn_sinking_sands
					echo SS - not supported yet
					break
				case exp01_rgn_sinking_sands_epic01_lockjaw
					echo HC - attempt to zone out, needs added.
					break
				case exp01_rgn_pillars_of_flame_epic01_cazel
					echo Roost/AT/CM - where we want to be.
					Ogre_Instance_Controller:ZoneSet
					call Obj_OgreIH.Set_VariousOptions
					Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
					Obj_OgreUtilities.OgreNavLib:LoadMap
					_StartingPoint:Inc
					break
				case exp01_rgn_pillars_of_flame
					echo in PoF
					Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
					Obj_OgreUtilities.OgreNavLib:LoadMap
					call Obj_OgreUtilities.NavToLocation "CM" 1
					Obj_OgreIH:Actor_Click["Cazel Entrance"]
					wait 20
					call Obj_OgreUtilities.HandleWaitForZoning 
					call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
					break
				Default
					echo Some other zone, you are somewhere the script cannot handle.
					break
			}
		}
        call This.NamedCycle
		call This.Exit
		wait 150
		return TRUE
    }
	
	function:bool NamedCycle()
	{
		if ${Actor["a sandfang prowler"](exists)}
		{
			do
			{
				echo Found a sandfang prowler
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["a sandfang prowler"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["a sandfang prowler"](exists)}"
		}
		
		if ${Actor["a sandfang razorclaw"](exists)}
		{
			do
			{
				echo Found a sandfang razorclaw
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["a sandfang razorclaw"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["a sandfang razorclaw"](exists)}"
		}
		
		if ${Actor["a sandfang stalker"](exists)}
		{
			do
			{
				echo Found a sandfang stalker
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["a sandfang stalker"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["a sandfang stalker"](exists)}"
		}
		
		if ${Actor["a Dunefury Brawler"](exists)}
		{
			do
			{
				echo Found a Dunefury Brawler
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["a Dunefury Brawler"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["a Dunefury Brawler"](exists)}"
		}
		
		if ${Actor["a Dunefury bandit"](exists)}
		{
			do
			{
				echo Found a Dunefury bandit
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["a Dunefury bandit"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["a Dunefury bandit"](exists)}"
		}
		
		if ${Actor["a Dunefury mystic"](exists)}
		{
			do
			{
				echo Found a Dunefury mystic
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["a Dunefury mystic"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["a Dunefury mystic"](exists)}"
		}
		
		if ${Actor["a sand giant assassin"](exists)}
		{
			do
			{
				echo Found a sand giant assassin
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["a sand giant assassin"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["a sand giant assassin"](exists)}"
		}
		
		if ${Actor["Rarantar"](exists)}
		{
			do
			{
				echo Found Rarantar
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Rarantar"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Rarantar"](exists)}"
		}
		
		if ${Actor["Fotar"](exists)}
		{
			do
			{
				echo Found Fotar
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Fotar"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Fotar"](exists)}"
		}
		
		if ${Actor["Shotar"](exists)}
		{
			do
			{
				echo Found Shotar
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Shotar"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Shotar"](exists)}"
		}
		
		if ${Actor["Votar"](exists)}
		{
			do
			{
				echo Found Votar
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Votar"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Votar"](exists)}"
		}
		
		if ${Actor["Yotar"](exists)}
		{
			do
			{
				echo Found Yotar
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Yotar"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Yotar"](exists)}"
		}
		
		if ${Actor["Fang"](exists)}
		{
			do
			{
				echo Found Fang
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Fang"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Fang"](exists)}"
		}
		
		if ${Actor["Gorefang"](exists)}
		{
			do
			{
				echo Found Gorefang
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Gorefang"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Gorefang"](exists)}"
		}
		
		if ${Actor["Venom Tail"](exists)}
		{
			do
			{
				echo Found Venom Tail
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Venom Tail"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Venom Tail"](exists)}"
		}
		
		if ${Actor["Darantar the Tamer"](exists)}
		{
			do
			{
				echo Found Darantar the Tamer
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Darantar the Tamer"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Darantar the Tamer"](exists)}"
		}
        return TRUE
    }
    
    function:bool Exit()
	{
		Obj_OgreIH:LetsGo
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		call Obj_OgreUtilities.NavToLocation "AT1" 1
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 10
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		Obj_OgreIH:Actor_Click["${sZoneOut_ObjectName}"]
		wait 20
		call Obj_OgreUtilities.HandleWaitForZoning 
        return TRUE
    }
}