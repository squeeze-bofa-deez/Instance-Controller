variable string sZoneName="Vasty Deep: The Conservatory"
variable string sZoneShortName="exp06_dun_vastydeep01"
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
			call Obj_OgreIH.CD.GetIntoZone
			if !${Return}
			{
				Obj_OgreIH:Actor_Click["zone_to_vastydeep01"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}
			Ogre_Instance_Controller:ZoneSet

			call Obj_OgreIH.Set_VariousOptions
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "25"]
			
			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 1
		{
			call This.Named1 "Brappalec"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Brappalec"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 2
		{
			call This.Named2 "Bilkozan the Hungry"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Bilkozan the Hungry"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Riyadh"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Riyadh"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		
		if ${_StartingPoint} == 4
		{
			call This.Named4 "Delahnus the Dauntless"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Delahnus the Dauntless"]
				return FALSE
			}
			_StartingPoint:Inc
		}	

		;// Finish zone (zone out)
		if ${_StartingPoint} == 5
		{
			Obj_OgreIH:SetCampSpot
            echo Evacing
			oc !c -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			Obj_OgreIH:SetCampSpot
			call Obj_OgreIH.CD.ZoneOut
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZoneOut
				return FALSE
			}
			_StartingPoint:Inc
		}

        return TRUE
    }
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		;// Skipping snake & moving to Brappalec
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-13.240000,-7.497500,-33.709999"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-17.580063,-7.497500,-51.378273"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-10.340768,-7.497500,-67.829330"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-3.085890,-3.914709,-89.238533"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-10.170226,0.171741,-105.584320"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-2.653348,3.715069,-119.757622"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-10.250754,7.502500,-136.367157"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-11.065497,7.502500,-162.860962"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-11.673089,7.502501,-182.467010"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["53.569813,7.063810,-186.761597"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["52.678429,14.742041,-226.861786"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["91.625420,15.325794,-225.064850"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 100

		Obj_OgreIH:ChangeCampSpot["95.024864,16.221943,-204.670929"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["118.215981,26.400703,-201.565323"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["137.199417,30.002501,-218.340408"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["164.315506,30.313398,-205.532410"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["181.960968,30.002501,-205.908798"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["182.606995,30.002501,-217.417801"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["192.286499,30.921644,-225.150375"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10		

		Obj_OgreIH:ChangeCampSpot["221.393631,30.002501,-228.444031"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["222.644485,36.825401,-187.261383"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["284.328583,37.502499,-187.655502"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["293.373016,37.502499,-182.067886"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["291.571930,37.502499,-152.275757"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["264.439484,37.502502,-149.823990"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["297.585846,37.502499,-162.907700"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["312.337372,34.326687,-164.408829"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Brappalec
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		;// Loot
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
    }
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Bilkozan the Hungry
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["284.180878,37.502499,-147.846039"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["277.816345,41.820152,-117.821968"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["285.457764,45.658138,-102.470108"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["277.548737,48.602959,-90.690826"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["286.970062,52.502499,-70.314957"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["314.356323,52.502499,-42.007313"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["324.587891,52.502499,-39.338158"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["331.533875,56.831676,-12.775949"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["324.188324,60.279530,1.015454"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["331.948669,64.184464,16.635183"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["324.354004,67.502502,32.707001"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["332.183380,67.502510,88.589760"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["355.495453,67.502502,56.891514"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["377.756866,64.326668,60.253281"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Bilkozan the Hungry
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		;// Loot
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
    }
    function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Riyadh
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["303.525940,66.777443,83.100639"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["281.494232,67.024780,82.494392"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["282.842224,74.856491,42.950722"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["245.546875,76.403976,44.065872"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["223.821548,78.050705,64.420929"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["237.318192,75.841614,75.954887"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["214.150085,83.703438,47.988777"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["199.680878,84.276741,59.551598"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["200.218704,86.448502,84.015305"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["185.556870,87.553406,81.818825"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["181.562912,83.981232,59.728226"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["165.543976,83.831543,60.516033"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["162.476532,89.346786,86.080231"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;//Removed these because not needed, but keeping for now
		;Obj_OgreIH:ChangeCampSpot["142.632370,89.698128,85.215836"]
		;call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		;wait 10

		;Obj_OgreIH:ChangeCampSpot["134.951721,93.305382,44.945084"]
		;call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		;wait 10

		Obj_OgreIH:ChangeCampSpot["127.844711,90.542000,87.977165"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Riyadh
		Ob_AutoTarget:AddActor["a topiaric ripper",0,FALSE,TRUE]
		Actor["Riyadh"]:DoTarget

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		;// Loot
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
    }
	    function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Delahnus the Dauntless
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["122.971268,89.743423,73.773712"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["80.578659,89.998383,74.546974"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["82.451797,97.041817,113.533737"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["59.830883,96.962906,112.538559"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["21.321842,97.526237,107.881157"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-1.265019,97.193802,97.890022"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-0.004581,108.841187,67.044952"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 150

		;// Prep for Delahnus the Dauntless
		Actor["Delahnus the Dauntless"]:DoTarget
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 5
		OgreBotAPI:CastAbility_Relay["all","Bladedance"]
		wait 100

		;// Delahnus the Dauntless
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		;// Loot
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE	

		;// Evac to front    
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
		wait 150
		OgreBotAPI:CastAbility_Relay[all,"Escape"]
		wait 30
		Obj_OgreIH:SetCampSpot
        return TRUE
    }
}