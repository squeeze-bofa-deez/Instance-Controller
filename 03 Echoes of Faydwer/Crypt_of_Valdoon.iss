;================================================================================
; Title: Crypt of Valdoon | Author: The Marty Party | Date: 02 Nov 2021 | Version: 1.1
;================================================================================

variable string sZoneShortName="exp03_dun_mistmoore_catacombs_epic02_oldcatacombs"
variable string sZoneName="Crypt of Valdoon"

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process ${_StartingPoint} "-NoAutoLoadMapOnZone" ${Args.Expand}
}

objectdef Object_Instance
{
	function:bool RunInstance(int _StartingPoint=0)
	{
		if ${_StartingPoint} == 0
		{
            ogre ica
            wait 2
            
			call Obj_OgreIH.CD.GetIntoZone
			if !${Return}
			{
				Obj_OgreIH:Actor_Click["mistmoore_catacombs_epic02_oldcatacombs"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time}: \agStarting to auto-run ${sZoneName}. Version: 1.1
					
        	Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			call Obj_OgreIH.Set_PriestAscension FALSE
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "25"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[2]
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
			call This.Named3 "Count Valdoon Kel'Novar"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Count Valdoon Kel'Novar"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		
		;//Finish zone (zone out)
		if ${_StartingPoint} == 4
		{
            Obj_OgreIH:LetsGo
        	eq2execute Target_None
			
			oc !c -cfw igw:${Me.Name} -Evac
			
			wait 50
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 50
			
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",FALSE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",FALSE]
			
			;//Check if the zone can be reset.
			call This.CheckZoneResetStatus
			if !${Return}
            {             
                return FALSE
            }
			;//Reset the zone
			call This.ResetZone
			if !${Return}
            {                
                return FALSE
            }		
			
			_StartingPoint:Inc
		}
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷     NAMED 1 - Elenorel the Beast Tamer     ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-1.029030,-1.313901,-7.585927"
		call Movetoloc "0.091702,-1.065345,23.417063"
		call Movetoloc "6.344908,-0.716831,24.033495"
		call Movetoloc "14.767776,-1.104806,25.257420"
		call Movetoloc "26.637575,-1.097288,25.574211"
		call Movetoloc "29.185030,-1.182285,22.231869"
		call Movetoloc "46.313980,-1.354128,21.825668"
		call Movetoloc "46.521885,-1.583308,12.256071"
		call Movetoloc "46.618423,-1.245820,2.387121"
		call Movetoloc "45.789780,-0.318731,-5.238533"
		call Movetoloc "42.355030,-0.360628,-17.196218"
		call Movetoloc "42.495960,-0.348915,-29.076485"
		call Movetoloc "42.414566,-0.037200,-43.62851"
		call Movetoloc "40.341545,0.469537,-52.546089"
		call Movetoloc "38.896095,0.510178,-66.010292"
		call Movetoloc "38.281822,0.577219,-85.289871"
		Obj_OgreIH:ChangeCampSpot["37.971024,1.142230,-91.413109"]
		Obj_OgreIH:Jump
		wait 10
		Obj_OgreIH:Jump
		wait 10
		bj_OgreIH:Jump
		wait 10
		call Movetoloc "37.971024,1.142230,-91.413109"
		call Movetoloc "38.186211,-1.019789,-108.321991"
		call Movetoloc "59.532082,-4.070278,-108.957077"
		call Movetoloc "78.087479,-6.096947,-109.149925"
		call Movetoloc "86.504318,-8.198595,-101.283119"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "86.267723,-6.812878,-84.794632"
		call Movetoloc "86.215927,-8.198595,-107.046616"
		call Movetoloc "105.294044,-9.875094,-107.345795"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "111.979813,-10.475395,-114.230309"
		call Movetoloc "108.464714,-10.563972,-108.3723"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "112.588943,-9.584000,-89.664619"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Obj_OgreIH:ChangeCampSpot["121.172630,-10.674042,-102.421700"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 2 - Irodal the Originator       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "105.722397,-9.875094,-107.658722"
		call Movetoloc "38.681778,-1.019790,-106.011963"
		call Movetoloc "38.133289,0.447219,-83.081512"
		call Movetoloc "38.914749,0.543149,-63.115524"
		call Movetoloc "41.835957,0.471225,-49.111778"
		call Movetoloc "42.431717,-0.358257,-16.756445"
		call Movetoloc "47.046383,-0.875007,-0.446196"
		call Movetoloc "46.654819,-1.311658,21.319672"
		call Movetoloc "56.544315,-1.257766,21.093527"
		call Movetoloc "65.179787,-1.189108,21.007278"
		call Movetoloc "78.266632,-1.117719,20.876572"
		call Movetoloc "89.445656,-0.131407,20.764927"
		call Movetoloc "101.025398,0.043541,25.827686"
		call Movetoloc "100.759178,-0.111741,36.361858"
		call Movetoloc "100.158218,0.006750,42.310959"
		call Movetoloc "112.904839,1.030145,42.855740"
		call Movetoloc "128.305908,0.705868,42.891079"
		call Movetoloc "137.573547,0.703692,42.785316"
		call Movetoloc "162.226685,1.030169,42.737183"
		call Movetoloc "174.639847,-1.131848,42.746563"
		call Movetoloc "175.140182,-4.180927,19.519005"
		call Movetoloc "176.202789,-4.024463,-1.792094"
		call Movetoloc "179.222031,-3.865524,-7.057582"
		wait 300
		call Obj_OgreUtilities.PreCombatBuff 5
		Actor["a malevolent creation"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat 10
		Actor["a malevolent creation"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat 10
		Actor["a malevolent creation"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat 10
		Actor["a malevolent creation"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat 10
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 400
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 3 - Count Valdoon Kel'Novar      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		Ob_AutoTarget:RemoveActor["a malevolent creation",0,FALSE,FALSE]
		call Movetoloc "175.346039,-3.745965,10.647637"
		call Movetoloc "175.728806,-1.131847,43.077415"
		call Movetoloc "156.158951,1.030148,42.460861"
		call Movetoloc "145.936432,0.702065,42.708031"
		call Movetoloc "138.212402,0.706121,42.902866"
		call Movetoloc "129.250488,0.704826,42.842159"
		call Movetoloc "119.648491,0.704223,42.777111"
		call Movetoloc "100.836418,-0.004835,42.649643"
		call Movetoloc "95.570320,0.850390,19.684338"
		call Movetoloc "95.737808,0.850390,9.149971"
		call Movetoloc "95.732521,0.850415,-2.588547"
		call Movetoloc "96.048561,0.811532,-11.733341"
		call Movetoloc "95.491310,0.850393,-18.699110"
		call Movetoloc "81.920670,1.225485,-19.337765"
		Actor["a Trueborn steward"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat 10
		call Movetoloc "95.342171,0.850392,-18.911278"
		call Movetoloc "100.848076,0.989707,-30.421452"
		call Movetoloc "101.237122,0.897922,-52.392262"
		call Movetoloc "121.312202,2.314048,-51.374996"
		call Movetoloc "137.063232,0.131857,-51.136822"
		call Movetoloc "153.721939,-2.082389,-59.813805"
		call Movetoloc "178.247620,-3.779746,-48.961170"
		wait 1350
		call Movetoloc "158.090530,-0.870657,-50.999920"
		Actor["a crypt guardian"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat 10
		Actor["a crypt guardian"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat 10
		Actor["a crypt guardian"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat 10
		Actor["a crypt guardian"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat 10
		call Movetoloc "178.247620,-3.779747,-48.961208"
		wait 300
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                  FUNCTIONS                 ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function CheckASpecificZone(string _ZoneName)
	{
		variable persistentref ICARef
		ICARef:SetReference["Script[${OgreInstanceControllerAssisterScriptName}].VariableScope.Obj_OgreUtilities.Obj_ZoneReset"]

		if ${ICARef.Get_ZoneData_GV[gcsRetValue,"${_ZoneName}"]}
		{
			echo Same zone (${_ZoneName}): ${Zone.Name.Equal["${_ZoneName}"]}
			echo IsSet ${gcsRetValue.Element["IsSet"]}
			echo Resettable ${gcsRetValue.Element["Resettable"]}
			echo TimeLeft ${gcsRetValue.Element["TimeLeft"]}
			echo TextTimeLeft ${gcsRetValue.Element["TextTimeLeft"]}
		}
		else
			echo GetZoneData was false
	}

	function:bool CheckZoneResetStatus()
	{
		echo ${Time}: Entering CheckZoneResetStatus
		Ogre_Instance_Controller_Assister:PopulateInternalMemory
		wait 2
		while ${Ogre_Instance_Controller_Assister.bPopulateInternalMemoryRunning}
		wait 2
	   
		call CheckASpecificZone "${sZoneName}"
		
		echo ${Time}: Is the zone able to be reset? [${gcsRetValue.Element["Resettable"]}]
		if !${gcsRetValue.Element["Resettable"]}
		{
			iZoneResetTime:Set[${Math.Calc[${Time.Timestamp}+${gcsRetValue.Element["TimeLeft"]}+5].Int}]
			echo ${Time}: \arWaiting until zone can be reset. [${Math.Calc[${iZoneResetTime}-${Time.Timestamp}].Int} seconds] [${Math.Calc[(${iZoneResetTime}-${Time.Timestamp})/60].Int} minutes]
			while ${Time.Timestamp} < ${iZoneResetTime}
			{
				;echo ${Time}: Time remaining until reset: [${Math.Calc[${iZoneResetTime}-${Time.Timestamp}].Int} seconds] [${Math.Calc[(${iZoneResetTime}-${Time.Timestamp})/60].Int} minutes]
				wait 50
			}
			
			echo ${Time}: \agZone can now be reset!	
			return TRUE
		}			
	}
	
	function:bool ResetZone()
	{
		echo ${Time}: Entering ResetZone
		if ${Zone.ShortName.Equal["${sZoneShortName}"]} && ${Zone.Name.Equal["${sZoneName}"]}
		{
			echo ${Time}: I am still in ${sZoneName} and I can reset it. Zoning out to reset.
			oc !c -cfw igw:${Me.Name} -Zone
			
			call Obj_OgreUtilities.HandleWaitForZoning

			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}
			
			wait 100
		}
		
		echo ${Time}: Resetting the zone.
		relay all OgreBotAPI:ResetZone["igw:${Me.Name}","${sZoneName}"]
		
		wait 20
		
		echo ${Time}: Checking to see if the zone reset was successful.
		call This.CheckZoneResetStatus
		if !${Return}
		{
			echo ${Time}: Failed to reset zone.
			oc Failed to reset zone.
			return FALSE
		}
		
		return TRUE
	}

	function Movetoloc(point3f loc)
	{
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${loc}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 1
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		call Obj_OgreIH.KillActorType 1
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		eq2execute summon
	}

	function PostNamed()
	{
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		call Obj_OgreIH.KillActorType 10
        eq2execute summon
		call Obj_OgreUtilities.WaitForLootWindow
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10
	}

	function HandleNamed()
	{
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}
    
        wait 20
        if ${Me.InCombat}
        {
            while ${Me.InCombat}
                waitframe
        }
		call PostNamed
	}
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}
