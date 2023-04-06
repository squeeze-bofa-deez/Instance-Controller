variable string sZoneNameStart="Ancient's Table"
variable string sZoneNameEnd="Pillars Of Flame"
;variable string sZoneShortName="exp01_rgn_sinking_sands_epic01_lockjaw"
variable string sZoneOut_ObjectName="Pillars of Flame"

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
			Switch "${Zone}"
			{
				case exp01_rgn_sinking_sands
					echo SS
					call Obj_OgreIH.Set_VariousOptions
					Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
					Obj_OgreUtilities.OgreNavLib:LoadMap
					call Obj_OgreUtilities.NavToLocation "PofUndercityZoneline" 1
					Obj_OgreIH:SetCampSpot
					wait 5
					Obj_OgreIH:ChangeCampSpot["-41.512345, -103.675546, -222.329498"]
					call Obj_OgreUtilities.HandleWaitForCampSpot 10
					call Obj_OgreUtilities.HandleWaitForGroupDistance 3
					wait 5
					call Obj_OgreUtilities.HandleWaitForZoning 
					call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
					break
				case exp01_rgn_sinking_sands_epic01_lockjaw
					echo HC - attempt to zone out, needs added.
					break
				case exp01_rgn_pillars_of_flame_epic01_cazel
					echo Roost/AT - where we want to be.
					Ogre_Instance_Controller:ZoneSet
					call Obj_OgreIH.Set_VariousOptions
					Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
					Obj_OgreUtilities.OgreNavLib:LoadMap
					_StartingPoint:Inc
					break
				case exp01_rgn_pillars_of_flame
					echo in PoF
					wait 150
					call Obj_OgreIH.Set_VariousOptions
					Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
					Obj_OgreUtilities.OgreNavLib:LoadMap
					call Obj_OgreUtilities.NavToLocation "AT" 1
					Obj_OgreIH:Actor_Click["door_to_ancients_table"]
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
		wait 100
		Obj_OgreIH:LetsGo
		OgreBotAPI:Evac
		wait 250
		return TRUE
    }
    function:bool NamedCycle()
	{
		if ${Actor["a desert tarantula"](exists)}
		{
			do
			{
				echo Found a desert tarantula
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["a desert tarantula"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["a desert tarantula"](exists)}"
		}
		
		if ${Actor["Albino Desert Tarantula"](exists)}
		{
			do
			{
				echo Found Albino Desert Tarantula
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Albino Desert Tarantula"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Albino Desert Tarantula"](exists)}"
		}
		
		wait 150
		if ${Actor["a crag tarantula"](exists)}
		{
			do
			{
				echo Found a crag tarantula
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["a crag tarantula"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["a crag tarantula"](exists)}"
		}
		
		wait 150
		if ${Actor["Ancient Cyclops"](exists)}
		{
			do
			{
				echo Found Ancient Cyclops
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.PreCombatBuff 6
				call Obj_OgreUtilities.NavToLoc "${Actor["Ancient Cyclops"].Loc}"
				call Obj_OgreUtilities.HandleWaitForGroupDistance 5
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.Get_Chest
			}
			while "${Actor["Ancient Cyclops"](exists)}"
		}
        return TRUE
    }	
}