;================================================================================
; Title: Vasty Deep: The Conservatory | Author: The Marty Party | Date: 15 Mar 2024 | Version: 1.2
;================================================================================

variable string sZoneShortName="exp06_dun_vastydeep01"
variable string sZoneName="Vasty Deep: The Conservatory"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

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
				Obj_OgreIH:Actor_Click["zone_to_vastydeep01"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time}: \agStarting to auto-run ${sZoneName}. Version: 1.2
					
        	Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "25"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[2]
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

		if ${_StartingPoint} == 5
		{
			call This.Named5 "The Onayan Custodian"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: The Onayan Custodian"]
				return FALSE
			}
			_StartingPoint:Inc
		}	

		;// Finish zone (zone out)
		if ${_StartingPoint} == 6
		{
            Obj_OgreIH:LetsGo
        	eq2execute Target_None
			
			call Movetoloc "3.287108,97.502502,-35.281162"
			call Movetoloc "-0.274808,-9.416555,-51.131195"
			oc !ci -FlyDown igw:${Me.Name}
        	wait 20
			oc !ci -FlyStop igw:${Me.Name}

			if ${Actor["Submerged Chest"](exists)} && ${Math.Distance[${Actor["Submerged Chest"].Loc},-0.122427,-17.377092,-50.833130]} <= 5
			{
				oc !c -ChangeCampSpotWho ${Me.Name} -0.122427 -17.377092 -50.833130
				call Obj_OgreUtilities.HandleWaitForCampSpot 20
				wait 10
			}

			oc !ci -FlyUp igw:${Me.Name}
        	wait 30
			oc !ci -FlyStop igw:${Me.Name}
			call Movetoloc "-20.650038,-7.497500,-52.822102"
			call Movetoloc "-5.289650,-7.497500,-25.833633"
			call Movetoloc "-4.777812,-7.497500,-2.683846"
			call ManaarQuest
			call Movetoloc "4.562288,-7.457947,0.274465"
			
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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷             NAMED 1 - Brappalec             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Skipping snake and moving to ${_NamedNPC}
		call Movetoloc "-13.240000,-7.497500,-34.709999"
		call Movetoloc "-5.110769,-7.497500,-28.472933"
		call Movetoloc "-4.868572,-7.497500,-1.058241"
		call ManaarQuest
		call Movetoloc "-5.659779,-7.497500,-25.723251"
		call Movetoloc "-13.240000,-7.497500,-33.709999"
		call Movetoloc "-17.580063,-7.497500,-51.378273"
		call Movetoloc "-10.340768,-7.497500,-67.829330"
		call Movetoloc "-3.085890,-3.914709,-89.238533"
		call Movetoloc "-10.170226,0.171741,-105.584320"
		call Movetoloc "-2.653348,3.715069,-119.757622"
		call Movetoloc "-10.250754,7.502500,-136.367157"
		call Movetoloc "-11.065497,7.502500,-162.860962"
		call Movetoloc "-11.673089,7.502501,-182.467010"
		call Movetoloc "53.569813,7.063810,-186.761597"
		call Movetoloc "52.678429,14.742041,-226.861786"
		call Movetoloc "91.625420,15.325794,-225.064850"
		call Movetoloc "95.024864,16.221943,-204.670929"
		call Movetoloc "118.215981,26.400703,-201.565323"
		call Movetoloc "137.199417,30.002501,-218.340408"
		call Movetoloc "164.315506,30.313398,-205.532410"
		call Movetoloc "181.960968,30.002501,-205.908798"
		call Movetoloc "182.606995,30.002501,-217.417801"
		call Movetoloc "192.286499,30.921644,-225.150375"
		call Movetoloc "221.393631,30.002501,-228.444031"
		call Movetoloc "222.644485,36.825401,-187.261383"
		call Movetoloc "284.328583,37.502499,-187.655502"
		call Movetoloc "293.373016,37.502499,-182.067886"
		call Movetoloc "291.571930,37.502499,-152.275757"
		call Movetoloc "264.439484,37.502502,-149.823990"
		call Movetoloc "297.585846,37.502499,-162.907700"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "312.337372,34.326687,-164.408829"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷        NAMED 2 - Bilkozan the Hungry        ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "284.180878,37.502499,-147.846039"
		call Movetoloc "277.816345,41.820152,-117.821968"
		call Movetoloc "285.457764,45.658138,-102.470108"
		call Movetoloc "277.548737,48.602959,-90.690826"
		call Movetoloc "286.970062,52.502499,-70.314957"
		call Movetoloc "314.356323,52.502499,-42.007313"
		call Movetoloc "324.587891,52.502499,-39.338158"
		call Movetoloc "331.533875,56.831676,-12.775949"
		call Movetoloc "324.188324,60.279530,1.015454"
		call Movetoloc "331.948669,64.184464,16.635183"
		call Movetoloc "324.354004,67.502502,32.707001"
		call Movetoloc "332.183380,67.502510,88.589760"
		call Movetoloc "355.495453,67.502502,56.891514"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "377.756866,64.326668,60.253281"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷              NAMED 3 - Riyadh              ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "303.525940,66.777443,83.100639"
		call Movetoloc "281.494232,67.024780,82.494392"
		call Movetoloc "282.842224,74.856491,42.950722"
		call Movetoloc "245.546875,76.403976,44.065872"
		call Movetoloc "223.821548,78.050705,64.420929"
		call Movetoloc "237.318192,75.841614,75.954887"
		call Movetoloc "214.150085,83.703438,47.988777"
		call Movetoloc "199.680878,84.276741,59.551598"
		call Movetoloc "200.218704,86.448502,84.015305"
		call Movetoloc "185.556870,87.553406,81.818825"
		call Movetoloc "181.562912,83.981232,59.728226"
		call Movetoloc "165.543976,83.831543,60.516033"
		call Movetoloc "162.476532,89.346786,86.080231"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "127.844711,90.542000,87.977165"
		Ob_AutoTarget:AddActor["a topiaric ripper",0,FALSE,TRUE]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 4 - Delahnus the Dauntless      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "122.971268,89.743423,73.773712"
		call Movetoloc "80.578659,89.998383,74.546974"
		call Movetoloc "82.451797,97.041817,113.533737"
		call Movetoloc "59.830883,96.962906,112.538559"
		call Movetoloc "21.321842,97.526237,107.881157"
		call Movetoloc "-1.265019,97.193802,97.890022"
		call Movetoloc "-0.004581,108.841187,67.044952"
		wait 150
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 5 - The Onayan Custodian      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-2.607424,97.502495,101.445892"
		call Movetoloc "-57.758152,97.502495,66.823914"
		call Movetoloc "-51.918201,97.502502,49.128693"
		call Movetoloc "3.397462,97.502502,15.812222"
		call WaitForNamed
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
		call Obj_OgreUtilities.HandleWaitForCampSpot 5
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		call Obj_OgreIH.KillActorType 5
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

	function WaitForNamed()
	{
		if ${Actor["${_NamedNPC}"](exists)}
		{
			if ${Actor["${_NamedNPC}"].Type.Equal["NamedNPC"]}
			{
				while ${Actor["${_NamedNPC}"].Type.Equal["NamedNPC"]}
					waitframe
				wait 10                
			}
		}
	}

	function ManaarQuest()
	{
		oc !c -Pause igw:${Me.Name}
        wait 5
		relay all eq2execute target Alia
		wait 10
		relay all eq2execute h
		wait 10
		oc !ci -OptNum 1 igw:${Me.Name}
		wait 10
		oc !ci -OptNum 1 igw:${Me.Name}
		wait 10
		oc !ci -OptNum 1 igw:${Me.Name}
		wait 10
        oc !c -Resume igw:${Me.Name}
        wait 5
		eq2execute Target_None
	}
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}
