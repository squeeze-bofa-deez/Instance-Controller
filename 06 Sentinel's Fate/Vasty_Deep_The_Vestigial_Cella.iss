;================================================================================
; Title: Vasty Deep: The Vestigial Cella | Author: Unknown, The Marty Party | Date: 15 Mar 2024 | Version: 1.1
;================================================================================

variable string sZoneShortName="exp06_dun_vastydeep03"
variable string sZoneName="Vasty Deep: The Vestigial Cella"
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
				Obj_OgreIH:Actor_Click["zone_to_vastydeep03"]
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
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "25"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[2]
		}

		if ${_StartingPoint} == 1
		{
			call This.Named1 "The Wight Specter"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1:The Wight Specter"]
				return FALSE
			}
            _StartingPoint:Inc
		}

		if ${_StartingPoint} == 2
		{
			call This.Named2 "Ecto Malgum"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2:Ecto Malgum"]
				return FALSE
			}
            _StartingPoint:Inc
		}
			
		if ${_StartingPoint} == 3
		{
			call This.Named3 "Crystasha"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3:Crystasha"]
				return FALSE
			}
            _StartingPoint:Inc

		}

		if ${_StartingPoint} == 4
		{	
			call This.Named4 "Judithania"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4:Judithania"]
				return FALSE
			}
            _StartingPoint:Inc

		}

		if ${_StartingPoint} == 5
		{
			call This.Named5 "Kraitenae"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5:Kraitenae"]
				return FALSE
			}
            _StartingPoint:Inc

		}

		if ${_StartingPoint} == 6
		{
			call This.Named6 "Queen Gwarthlea"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#6:Queen Gwarthlea"]
				return FALSE
			}
            _StartingPoint:Inc

		}

		;// Finish zone (zone out)
		if ${_StartingPoint} == 7
		{
            Obj_OgreIH:LetsGo
        	eq2execute Target_None

			call Movetoloc "-169.820129,-74.996765,67.227371"
			call Movetoloc "-188.874298,-74.995796,16.507742"
			eq2execute target a deep cave fish
			wait 20
			call Obj_OgreUtilities.HandleWaitForCombat
			wait 10

			oc !c -cfw igw:${Me.Name} -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 50
			call Movetoloc "9.510164,-12.999029,5.376696"
			call ManaarQuest
			call Movetoloc "-11.135961,-10.366313,-2.646774"
			call Movetoloc "-58.428188,-0.098421,-1.905531"

			if ${Actor["A Drenched Lockbox"](exists)} && ${Math.Distance[${Actor["A Drenched Lockbox"].Loc},-11.135961,-10.366313,-2.646774]} <= 5
			{
				oc !c -ChangeCampSpotWho ${Me.Name} -11.135961 -10.366313 -2.646774
				call Obj_OgreUtilities.HandleWaitForCampSpot 40
				wait 10
			}

			call Movetoloc "-58.428188,-0.098421,-1.905531"
			call Movetoloc "-11.135961,-10.366313,-2.646774"

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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 1 - The Wight Specter         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named1(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "8.051156,-13.750236,4.406774"
		call ManaarQuest
		call Movetoloc "-10.754206,-10.366313,-2.463679"
		call Movetoloc "-52.800659,1.621083,-1.679839"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call Movetoloc "-84.110207,1.627729,-1.617496"
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷             NAMED 2 - Ecto Malgum             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-52.800659,1.621083,-1.679839"
		call Movetoloc "-63.247490,0.002500,-28.293776"
		call Movetoloc "-54.548958,3.731771,-42.317493"
		call Movetoloc "-37.465611,9.905511,-65.736290"
		call Movetoloc "-6.147725,8.082129,-75.134834"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call Movetoloc "-19.044220,8.082129,-89.694466"
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷             NAMED 3 - Crystasha             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-35.510521,8.774971,-105.074020"
		call Movetoloc "-94.799835,20.081867,-106.204926"
		call Movetoloc "-97.316589,19.577530,-135.973816"
		call Movetoloc "-102.731461,20.023849,-144.863510"
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 100
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷             NAMED 4 - Judithania             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-100.504974,20.139311,-145.099960"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "-148.472397,20.002501,-148.152542"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷             NAMED 5 - Kraitenae             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-151.825760,18.360945,-129.270340"
		call Movetoloc "-153.361511,12.214003,-93.893852"
		call Movetoloc "-173.035599,10.575760,-76.653526"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call Movetoloc "-193.455460,10.560400,-84.988495"
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷             NAMED 6 - Queen Gwarthlea             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================	
	function:bool Named6(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-196.593231,12.256557,-71.132263"
		call Movetoloc "-207.108704,13.132140,-55.204216"
		call Movetoloc "-215.914825,20.164740,-22.683764"
		call Movetoloc "-220.310532,20.358646,-12.986840"
		call Movetoloc "-256.912231,20.834169,-14.447024"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "-255.363876,10.002501,43.635513"
		call Movetoloc "-203.464874,10.002500,26.790241"
		OgreBotAPI:FlyUp["${Me.Name}"]
		call Movetoloc "-230.126450,13.874684,61.802319"
		Ob_AutoTarget:AddActor["Ca'Na destructia suprema",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		Obj_OgreIH:ChangeCampSpot["-231.719086,18.874693,70.376282"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		eq2execute target Queen Gwarthlea
		wait 5
		Obj_OgreIH:ChangeCampSpot["-228.747406,11.773949,51.470982"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 250
		oc !c -ChangeCampSpotWho ${Me.Name} -206.528061 10.002501 30.679688
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		
		oc !c -Pause igw:${Me.Name}
        wait 5
		eq2execute target Delahnus the Dauntless
		wait 5
		relay all eq2execute h
		wait 5
        oc !c -Resume igw:${Me.Name}
        wait 5
		eq2execute Target_None
		oc !c -ChangeCampSpotWho ${Me.Name} -228.747406 11.773949 51.470982
		call Obj_OgreUtilities.HandleWaitForCampSpot 20

		if ${Actor["Queen Qwarthlea"].Health} <= 84
		{
			Obj_OgreIH:ChangeCampSpot["-229.276764,12.083661,55.786449"]
			eq2execute target Ca'Na destructia suprema
		}
		if ${Actor["Queen Qwarthlea"].Health} <= 30
		{
			Obj_OgreIH:ChangeCampSpot["-226.067184,12.001571,46.506889"]
			eq2execute target Ca'Na destructia suprema
		}

		call HandleNamed
		OgreBotAPI:FlyStop["${Me.Name}"]
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

	function ManaarQuest()
	{
		oc !c -Pause igw:${Me.Name}
        wait 5
		relay all eq2execute target Alia
		wait 10
		relay all eq2execute h
		wait 10
		oc !ci -OptNum 3 igw:${Me.Name}
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
