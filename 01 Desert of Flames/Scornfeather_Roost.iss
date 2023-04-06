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
		if ${currentzone.Equal["exp01_rgn_pillars_of_flame_epic01_cazel"]}
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
				call Obj_OgreUtilities.NavToLocation "Roost" 1
				Obj_OgreIH:Actor_Click["door_to_clefts_of_rujark"]
				wait 50
				OgreBotAPI:ZoneDoorForWho[${Me.Name},"Scornfeather Roost"]
				wait 200
				call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
				break
			case exp01_rgn_pillars_of_flame_epic01_cazel
				echo Roost
				Ogre_Instance_Controller:ZoneSet
				break
			case exp01_rgn_pillars_of_flame
				echo in PoF
				Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
				Obj_OgreUtilities.OgreNavLib:LoadMap
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
		NamedMobs:Set[1,"Hurika-Urz"]
		NamedMobs:Set[2,"Matron Suhailah"]
		NamedMobs:Set[3,"That Which Relentlessly Waits"]
		NamedMobs:Set[4,"Ishka-Urz"]
		NamedMobs:Set[5,"Matron Zaqibai"]
		NamedMobs:Set[6,"Ibtinaya the Scorned"]

		if "${NamedMobs.FirstKey(exists)}"
		{
			do
			{
				call This.NamedCycle "${NamedMobs.CurrentValue}" Locs${NamedMobs.CurrentKey}
			}
			while "${NamedMobs.NextKey(exists)}"
		}
	}
	
	function NamedCycle(string _NamedNPC="Doesnotexist", string _Locs)
	{
		DeclareVariable Locs1 collection:string
		Locs1:Set[a,"6.440000,0.040000,33.020000"]
		Locs1:Set[b,"15.320000,0.240000,61.060001"]
		Locs1:Set[c,"30.549999,-1.190000,94.339996"]
		Locs1:Set[d,"37.980000,2.880000,118.070000"]
		DeclareVariable Locs2 collection:string
		Locs2:Set[a,"26.430000,-1.770000,161.160004"]
		Locs2:Set[b,"4.700000,1.250000,162.509995"]
		Locs2:Set[c,"14.280000,1.240000,179.990005"]
		DeclareVariable Locs3 collection:string
		Locs3:Set[a,"26.430000,-1.770000,161.160004"]
		Locs3:Set[b,"3.750000,1.820000,126.879997"]
		DeclareVariable Locs4 collection:string
		Locs4:Set[a,"-23.840000,0.630000,124.019997"]
		Locs4:Set[b,"-35.439999,0.170000,124.269997"]
		DeclareVariable Locs5 collection:string
		Locs5:Set[a,"-57.669998,-1.820000,102.610001"]
		Locs5:Set[b,"-74.690002,-0.500000,87.000000"]
		Locs5:Set[c,"-63.290001,-0.080000,51.990002"]
		Locs5:Set[d,"-60.709999,-0.330000,39.770000"]
		Locs5:Set[e,"-71.360001,0.640000,27.559999"]
		DeclareVariable Locs6 collection:string
		Locs6:Set[a,"-45.860001,-0.150000,51.820000"]
		Locs6:Set[b,"-6.960000,0.370000,41.560001"]
		Locs6:Set[c,"-8.940000,0.130000,99.260002"]
		
		echo New named cycle: ${_NamedNPC}
		if "${${_Locs}.FirstKey(exists)}"
		{
			do
			{
				echo Changing CS to: ${${_Locs}.CurrentValue}
				call Obj_OgreUtilities.PreCombatBuff 6
				Obj_OgreIH:SetCampSpot
				Obj_OgreIH:ChangeCampSpot["${${_Locs}.CurrentValue}"]
				call Obj_OgreUtilities.HandleWaitForCampSpot 10
				call Obj_OgreUtilities.HandleWaitForGroupDistance 3
				Obj_OgreIH:LetsGo
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				call Obj_OgreIH.KillActorType 15
				call Obj_OgreUtilities.HandleWaitForCombatWithNPC
				
				call Obj_OgreIH.Get_Chest
			}
			while "${${_Locs}.NextKey(exists)}"
		}
		wait 5
		NamedMobs:Erase[${NamedMobs.CurrentKey}]
		wait 5
    }
    
	function Exit()
	{			
		if ${Me.Inventory["A Mysterious Unhatched Egg"](exists)}
		{
			Me.Inventory["A Mysterious Unhatched Egg"]:Destroy
		}
		variable point3f Leaving1="-11.522300, -0.180747, 94.987694"
		variable point3f Leaving2="4.52,0.27,40.54"
		variable point3f Leaving3="1.60,-0.10,6.06"
		
		Obj_OgreIH:LetsGo
		;// Leaving 1
		echo Leaving 1 ${Leaving1}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${Leaving1}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5			
		;// Leaving 2
		echo Leaving 2 ${Leaving2}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${Leaving2}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5		
		;//Leaving 3
		echo Leaving 3 ${Leaving3}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${Leaving3}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		Obj_OgreIH:Actor_Click["01_door_to_clefts_of_rujark"]
		wait 200
    }
}