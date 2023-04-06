variable string sZoneNameStart="The Hidden Cache"
variable string sZoneNameEnd="The Sinking Sands"
variable string sZoneShortName="exp01_rgn_sinking_sands_epic01_lockjaw"
variable string sZoneIn_ObjectName="zone_to_exp01_rgn_sinking_sands_epic01_lockjaw_dorns_cache"
variable string sZoneOut_ObjectName="zone_to_antonica"

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
		call This.Nav
		variable string currentzone=${Zone}
		if ${currentzone.Equal["exp01_rgn_sinking_sands_epic01_lockjaw"]}
		{
			call This.RunZone
			call This.Exit
		}
		return TRUE
    }
	
	function Nav()
	{
		Obj_OgreIH:LetsGo
		call Obj_OgreIH.Set_Follow
		OgreBotAPI:Resume
		Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
		Obj_OgreUtilities.OgreNavLib:LoadMap
		Switch "${Zone}"
		{
			case exp01_rgn_sinking_sands
				echo SS
				call Obj_OgreUtilities.NavToLocation "HC" 1
				Obj_OgreIH:Actor_Click["${sZoneIn_ObjectName}"]
				wait 200
				call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
				break
			case exp01_rgn_sinking_sands_epic01_lockjaw
				echo HC - we are in the right zone now, lets get started.
				Ogre_Instance_Controller:ZoneSet
				break
			case exp01_rgn_pillars_of_flame
				echo in PoF
				call Obj_OgreUtilities.NavToLocation "EvacPoint" 1
				Obj_OgreIH:SetCampSpot
				wait 5
				Obj_OgreIH:ChangeCampSpot["62.219124,-86.797806,-860.138000"]
				call Obj_OgreUtilities.HandleWaitForCampSpot 10
				call Obj_OgreUtilities.HandleWaitForGroupDistance 3
				wait 5
				Obj_OgreIH:SetCampSpot
				wait 5
				Obj_OgreIH:ChangeCampSpot["49.833622,-85.504185,-867.543604"]
				call Obj_OgreUtilities.HandleWaitForCampSpot 10
				call Obj_OgreUtilities.HandleWaitForGroupDistance 3
				wait 5
				call Obj_OgreUtilities.HandleZoneDoor
				wait 200
				call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
				break
			Default
				echo Some other zone, you are somewhere the script cannot handle.
				break
		}
    }
   
	function RunZone()
	{
		DeclareVariable NamedMobs collection:string
		NamedMobs:Set[1,"Trash"]
		NamedMobs:Set[2,"Bruticus"]
		NamedMobs:Set[3,"Master Thief Adham"]
		NamedMobs:Set[4,"Mullok"]
		NamedMobs:Set[5,"Ringleader Zubair"]
		NamedMobs:Set[6,"Captain Muhanned"]
		NamedMobs:Set[7,"Mastermind Hamzah"]
		
		if "${NamedMobs.FirstKey(exists)}"
		{
			do
			{
				if "${NamedMobs.CurrentKey} == 1"
				{				
					DeclareVariable Locs1 collection:string
					Locs1:Set[a,"110.254654,-12.609457,-127.454132"]
					Locs1:Set[b,"120.385269,-13.011074,-150.654175"]
					Locs1:Set[c,"114.915237,-8.635313,-176.876709"]
					Locs1:Set[d,"143.991348,-13.973631,-157.722885"]
					Locs1:Set[e,"158.698196,-15.302853,-133.317078"]
					Locs1:Set[f,"193.265533,-15.274640,-132.023392"]
					Locs1:Set[g,"214.544937,-13.631973,-111.630257"]
					Locs1:Set[h,"211.440643,-16.708469,-143.475372"]
					Locs1:Set[i,"191.906525,-15.285242,-148.239777"]
					Locs1:Set[j,"190.778870,-16.001545,-180.934189"]
					Locs1:Set[k,"135.698593,-12.068753,-188.433777"]
					Locs1:Set[l,"97.614609,-12.684040,-202.512573"]
					Locs1:Set[m,"53.025112,-14.112488,-196.943146"]
					echo New named cycle: Trash
					if "${Locs1.FirstKey(exists)}"
					{
						do
						{
							echo Changing CS to: ${Locs1.CurrentValue}
							call Obj_OgreUtilities.PreCombatBuff 6
							Obj_OgreIH:SetCampSpot
							Obj_OgreIH:ChangeCampSpot["${Locs1.CurrentValue}"]
							call Obj_OgreUtilities.HandleWaitForCampSpot 10
							call Obj_OgreUtilities.HandleWaitForGroupDistance 3
							Obj_OgreIH:LetsGo
							call Obj_OgreUtilities.HandleWaitForCombatWithNPC
							call Obj_OgreIH.KillActorType 15
							call Obj_OgreUtilities.HandleWaitForCombatWithNPC
							call Obj_OgreIH.Get_Chest
						}
						while "${Locs1.NextKey(exists)}"
					}
					wait 5
				}
		
				echo New named cycle: ${NamedMobs.CurrentValue}
				if ${Actor["${NamedMobs.CurrentValue}"](exists)}
				{
					echo Naving to: ${Actor["${NamedMobs.CurrentValue}"].Loc}
					Obj_OgreIH:LetsGo
					call Obj_OgreIH.Set_Follow
					call Obj_OgreUtilities.PreCombatBuff 6
					call Obj_OgreUtilities.NavToLoc ${Actor["${NamedMobs.CurrentValue}"].Loc}
					call Obj_OgreUtilities.HandleWaitForGroupDistance 3
					Actor["${NamedMobs.CurrentValue}"]:DoTarget
					Obj_OgreIH:Actor_Click["bucket of fish"]
					call Obj_OgreUtilities.HandleWaitForCombatWithNPC
					call Obj_OgreIH.Get_Chest
				}
			}
			while "${NamedMobs.NextKey(exists)}"
		}
	}

    function Exit()
	{
		echo Exiting
		Obj_OgreIH:LetsGo
		call Obj_OgreUtilities.PreCombatBuff 6
		call Obj_OgreUtilities.NavToLoc "122.309059,-11.255228,-121.632851"
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		call Obj_OgreIH.Get_Chest
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["122.309059,-11.255228,-121.632851"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		Obj_OgreIH:LetsGo
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["105.590347,-1.367419,-100.246994"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		Obj_OgreIH:LetsGo
		echo Naving to door: ${Actor["zone_to_antonica"].Loc}
		Obj_OgreIH:LetsGo
		call Obj_OgreUtilities.PreCombatBuff 6
		call Obj_OgreUtilities.NavToLoc "${Actor["zone_to_antonica"].Loc}"
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		call Obj_OgreIH.Get_Chest
		Obj_OgreIH:Actor_Click["${sZoneOut_ObjectName}"]
		wait 200
    }
}