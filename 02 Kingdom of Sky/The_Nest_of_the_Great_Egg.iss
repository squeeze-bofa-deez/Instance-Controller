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
		call Nav
		variable string currentzone=${Zone}
		if ${currentzone.Equal["exp02_dun_shrines_of_sky_epic02_nest"]}
		{
			call RunZone
			call Exit
		}
		return TRUE
    }
	
	function Nav()
	{
		Obj_OgreIH:LetsGo
		OgreBotAPI:ChangeLootOptions["all","FreeForAll"]
		call Obj_OgreIH.Set_Follow
		OgreBotAPI:Resume
		variable string currentzone=${Zone}
		if ${currentzone.Equal["exp02_rgn_realm_of_dawn"]}
		{
			Obj_OgreIH:Actor_Click["zone_to_nest"]
			wait 300
		}
    }
   
	function RunZone()
	{	
		DeclareVariable NamedMobs collection:string
		NamedMobs:Set[1,"Aggressor Khranz"]
		NamedMobs:Set[2,"Taskmaster Rezhirz"]
		NamedMobs:Set[3,"Councilor Zhardiz"]
		NamedMobs:Set[4,"Kettleleader Ghrizhaw"]
		NamedMobs:Set[5,"Chamberlain X'Haviz"]

		if "${NamedMobs.FirstKey(exists)}"
		{
			do
			{
				call This.NamedCycle "${NamedMobs.CurrentValue}" Locs${NamedMobs.CurrentKey}
			}
			while "${NamedMobs.NextKey(exists)}"
		}
	}
	
	function NamedCycle(string named, string locs)
	{
		;all locations in index are in reverse order because of some IS bug when used in a foreach...
		variable index:point3f Locs1
		Locs1:Insert[-38.642868,86.001602,0.001278]
		Locs1:Insert[-0.323936,85.263367,-30.385441]
		Locs1:Insert[-0.131671,86.001587,-49.048740]
		Locs1:Insert[-0.116481,86.001579,48.513496]
		Locs1:Insert[-5.635118,86.001648,-0.631886]
		Locs1:Insert[50.680939,85.750870,-0.179769]
		
		variable index:point3f Locs2
		Locs2:Insert[132.707047,57.173000,0.712390]
		Locs2:Insert[102.657471,57.173000,6.014821]
		Locs2:Insert[66.382759,57.173000,5.857526]
		Locs2:Insert[28.967831,57.180367,9.541108]
		Locs2:Insert[-9.840793,57.180355,29.106728]
		Locs2:Insert[-21.727646,56.928738,0.071390]
		
		variable index:point3f Locs3
		Locs3:Insert[161.699768,57.173000,18.616428]
		Locs3:Insert[143.341888,57.173000,11.877831]
		
		variable index:point3f Locs4
		Locs4:Insert[157.535797,82.072205,-24.341890]
		Locs4:Insert[157.025253,82.072182,-0.146914]
		Locs4:Insert[182.733765,81.529907,-0.052129]
		Locs4:Insert[195.903458,56.921200,0.206467]
		Locs4:Insert[191.369339,57.172806,8.656386]
		
		variable index:point3f Locs5
		Locs5:Insert[180.541183,103.172729,1.567989]
		Locs5:Insert[173.943771,103.172729,13.739037]
		Locs5:Insert[144.650375,82.654686,0.058487]
		Locs5:Insert[157.025253,82.072182,-0.146914]

		echo New named cycle: ${named}
		"${locs}":ForEach[call LocCheck \${ForEach.Value}]
		wait 5
	}
	
	function BuffedCsMove(point3f loc)
	{
		echo Changing CS to: "${loc}"
		call This.ZoneClickies
		call Obj_OgreUtilities.PreCombatBuff 6
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${loc}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		Obj_OgreIH:LetsGo
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		call Obj_OgreIH.KillActorType 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		call Obj_OgreIH.Get_Chest
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${loc}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
	}
	
	function CsMove(point3f loc)
	{
		echo Changing CS to: "${loc}"
		call This.ZoneClickies
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${loc}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		Obj_OgreIH:LetsGo
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		call Obj_OgreIH.KillActorType 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		call Obj_OgreIH.Get_Chest
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${loc}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
	}
	
	function BodyPull(point3f pullingTo, point3f pullingFrom)
	{
		echo bodypulling
		echo pulling to ${pullingTo}
		echo pulling from ${pullingFrom}
		Obj_OgreIH:SetCampSpot
		OgreBotAPI:NoMove
		call This.ZoneClickies
		call Obj_OgreUtilities.PreCombatBuff 6
		OgreBotAPI:ChangeCampSpotWho[igw:${Me.Name},"${pullingFrom.X}","${pullingFrom.Y}","${pullingFrom.Z}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		Obj_OgreIH:ChangeCampSpot["${pullingTo}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		Obj_OgreIH:LetsGo
		call Obj_OgreIH.Get_Chest
	}
	
	function BodyWaitPull(point3f pullingTo, point3f pullingFrom)
	{
		echo bodywaitpulling
		echo pulling to ${pullingTo}
		echo pulling from ${pullingFrom}
		Obj_OgreIH:SetCampSpot
		OgreBotAPI:NoMove
		call This.ZoneClickies
		call Obj_OgreUtilities.PreCombatBuff 6
		OgreBotAPI:ChangeCampSpotWho[igw:${Me.Name},"${pullingFrom.X}","${pullingFrom.Y}","${pullingFrom.Z}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		while !${Me.IsHated}
		{
			wait 10
		}
		Obj_OgreIH:ChangeCampSpot["${pullingTo}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		Obj_OgreIH:LetsGo
		call Obj_OgreIH.Get_Chest
	}
	
	function LocCheck(point3f loc)
	{
		Switch "${loc}"
		{
			Default
				call BuffedCsMove ${loc}
				break
		}
	}
	
	function ZoneClickies()
	{
		Obj_OgreIH:Actor_Click["03_door_1_left"]
		Obj_OgreIH:Actor_Click["06_door_1_left"]
		Obj_OgreIH:Actor_Click["guardroom_door_key"]
		Obj_OgreIH:Actor_Click["07_door_1_right"]
		Obj_OgreIH:Actor_Click["10_door_1_left"]
		Obj_OgreIH:Actor_Click["floor_distillery_human_kitchen01"]
		Obj_OgreIH:Actor_Click["10_door_2_right"]
		Obj_OgreIH:Actor_Click["12_door_1_left"]
		Obj_OgreIH:Actor_Click["12_door_2_right"]
		Obj_OgreIH:Actor_Click["12_door_3_right"]
		Obj_OgreIH:Actor_Click["16_door_1_right"]
	}
	
    function Exit()
	{
		echo Exiting
		Obj_OgreIH:LetsGo
		wait 10
		echo Evacing
		oc !c -Evac
		wait 300
		oc !c -Zone
		wait 300
    }
}