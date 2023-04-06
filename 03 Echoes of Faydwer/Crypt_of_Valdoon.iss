;==========================================
;   Title: Crypt of Valdoon IC
;  Author: The Marty Party
;    Date: 02 Nov 2021
; Version: 1.0
;==========================================

variable string sZoneName="Crypt of Valdoon"
variable string sZoneShortName="exp03_dun_mistmoore_catacombs_epic02_oldcatacombs"

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
            call Obj_OgreIH.ZoneNavigation.GetIntoZone "${sZoneName}"
			if !${Return}
			{
                Obj_OgreIH:Actor_Click["zone_to_crypt_of_valdoon"]
			    call Obj_OgreUtilities.HandleWaitForZoning
			    Ogre_Instance_Controller:ZoneSet
			    call Obj_OgreIH.Set_VariousOptions
			    call Obj_OgreIH.Set_PriestAscension FALSE
			    Obj_OgreIH:Set_NoMove
			    Obj_OgreIH:SetCampSpot
			    call Obj_OgreUtilities.PreCombatBuff 5
			    _StartingPoint:Inc
			    Obj_OgreIH:Message_FailedZone
			    return FALSE
			}
			Ogre_Instance_Controller:ZoneSet
			call Obj_OgreIH.Set_VariousOptions
			call Obj_OgreIH.Set_PriestAscension FALSE
			Obj_OgreIH:Set_NoMove
			Obj_OgreIH:SetCampSpot
			call Obj_OgreUtilities.PreCombatBuff 5
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 1
		{
			call This.Named1 "Elenorel the Beast Tamer"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Elenorel the Beast Tamer"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 2
		{
			call This.Named2 "Irodal the Originator"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Irodal the Originator"]
				return FALSE
			}
			_StartingPoint:Inc
		}        
		if ${_StartingPoint} == 3
		{
			call This.Named3 "Count Valdoon"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Count Valdoon"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		
		;// Finish zone (zone out)
		if ${_StartingPoint} == 4
		{
			call This.Named7
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
		;// Moving to Elenorel the Beast Tamer
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-1.029030,-1.313901,-7.585927"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["0.091702,-1.065345,23.417063"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["6.344908,-0.716831,24.033495"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["14.767776,-1.104806,25.257420"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["26.637575,-1.097288,25.574211"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["29.185030,-1.182285,22.231869"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["46.313980,-1.354128,21.825668"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["46.521885,-1.583308,12.256071"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["46.618423,-1.245820,2.387121"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["45.789780,-0.318731,-5.238533"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["42.355030,-0.360628,-17.196218"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["42.495960,-0.348915,-29.076485"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["42.414566,-0.037200,-43.62851"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["40.341545,0.469537,-52.546089"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["38.896095,0.510178,-66.010292"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["38.281822,0.577219,-85.289871"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["37.971024,1.142230,-91.413109"]
		Obj_OgreIH:Jump
		wait 10
		Obj_OgreIH:Jump
		wait 10
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		Obj_OgreIH:Jump
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["38.186211,-1.019789,-108.321991"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["59.532082,-4.070278,-108.957077"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["78.087479,-6.096947,-109.149925"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["86.504318,-8.198595,-101.283119"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		call Obj_OgreUtilities.PreCombatBuff 5
		Obj_OgreIH:ChangeCampSpot["86.267723,-6.812878,-84.794632"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["86.215927,-8.198595,-107.046616"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["105.294044,-9.875094,-107.345795"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		call Obj_OgreUtilities.PreCombatBuff 5
		Obj_OgreIH:ChangeCampSpot["111.979813,-10.475395,-114.230309"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["108.464714,-10.563972,-108.3723"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		call Obj_OgreUtilities.PreCombatBuff 5
		Obj_OgreIH:ChangeCampSpot["112.588943,-9.584000,-89.664619"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Elenorel the Beast Tamer
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["121.172630,-10.674042,-102.421700"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 10
		Actor["${_NamedNPC}"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
	}

	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Irodal the Originator
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["105.722397,-9.875094,-107.658722"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["38.681778,-1.019790,-106.011963"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["38.133289,0.447219,-83.081512"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["38.914749,0.543149,-63.115524"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["41.835957,0.471225,-49.111778"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["42.431717,-0.358257,-16.756445"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["47.046383,-0.875007,-0.446196"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["46.654819,-1.311658,21.319672"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["56.544315,-1.257766,21.093527"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["65.179787,-1.189108,21.007278"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["78.266632,-1.117719,20.876572"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["89.445656,-0.131407,20.764927"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["101.025398,0.043541,25.827686"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["100.759178,-0.111741,36.361858"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["100.158218,0.006750,42.310959"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["112.904839,1.030145,42.855740"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["128.305908,0.705868,42.891079"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["137.573547,0.703692,42.785316"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["162.226685,1.030169,42.737183"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["174.639847,-1.131848,42.746563"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["175.140182,-4.180927,19.519005"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["176.202789,-4.024463,-1.792094"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["179.222031,-3.865524,-7.057582"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 300
		call Obj_OgreUtilities.PreCombatBuff 5

		;// Killing adds to spawn Irodal the Originator
		Actor["a malevolent creation"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Actor["a malevolent creation"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Actor["a malevolent creation"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Actor["a malevolent creation"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 400

		;// Killing Irodal the Originator
		call Obj_OgreUtilities.PreCombatBuff 5
		Actor["${_NamedNPC}"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
	}

	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Count Valdoon
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["175.346039,-3.745965,10.647637"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["175.728806,-1.131847,43.077415"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10

		Obj_OgreIH:ChangeCampSpot["156.158951,1.030148,42.460861"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10	

		Obj_OgreIH:ChangeCampSpot["145.936432,0.702065,42.708031"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10	

		Obj_OgreIH:ChangeCampSpot["138.212402,0.706121,42.902866"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10	

		Obj_OgreIH:ChangeCampSpot["129.250488,0.704826,42.842159"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10	

		Obj_OgreIH:ChangeCampSpot["119.648491,0.704223,42.777111"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10	

		Obj_OgreIH:ChangeCampSpot["100.836418,-0.004835,42.649643"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10	

		Obj_OgreIH:ChangeCampSpot["95.570320,0.850390,19.684338"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10	

		Obj_OgreIH:ChangeCampSpot["95.737808,0.850390,9.149971"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10	

		Obj_OgreIH:ChangeCampSpot["95.732521,0.850415,-2.588547"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		Obj_OgreIH:ChangeCampSpot["96.048561,0.811532,-11.733341"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10	

		Obj_OgreIH:ChangeCampSpot["95.491310,0.850393,-18.699110"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10	

		Obj_OgreIH:ChangeCampSpot["81.920670,1.225485,-19.337765"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		Actor["a Trueborn steward"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		Obj_OgreIH:ChangeCampSpot["95.342171,0.850392,-18.911278"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10	

		Obj_OgreIH:ChangeCampSpot["100.848076,0.989707,-30.421452"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10	

		Obj_OgreIH:ChangeCampSpot["101.237122,0.897922,-52.392262"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		Obj_OgreIH:ChangeCampSpot["121.312202,2.314048,-51.374996"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		Obj_OgreIH:ChangeCampSpot["137.063232,0.131857,-51.136822"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10	

		Obj_OgreIH:ChangeCampSpot["153.721939,-2.082389,-59.813805"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10	

		Obj_OgreIH:ChangeCampSpot["178.247620,-3.779746,-48.961170"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 1350

		Obj_OgreIH:ChangeCampSpot["158.090530,-0.870657,-50.999920"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		;// Killing adds to spawn Count Valdoon
		Actor["a crypt guardian"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Actor["a crypt guardian"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Actor["a crypt guardian"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Actor["a crypt guardian"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Count Valdoon
		Obj_OgreIH:ChangeCampSpot["178.247620,-3.779747,-48.961208"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 300
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Actor["${_NamedNPC}"]:DoTarget

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
		wait 300
		
		;// Evacing
		echo Exiting
		Obj_OgreIH:LetsGo
		wait 10
		echo Evacing
		oc !c -Evac
	}
}