;================================================================================
; Title: Ravenscale Repository | Author: The Marty Party | Date: 12 Feb 2024 | Version: 1.2
;================================================================================

variable string sZoneShortName="exp05_dun_mistmoore_repository"
variable string sZoneName="Ravenscale Repository"
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
				Obj_OgreIH:Actor_Click["Portal to Ravenscale Repository"]
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
			call Obj_OgreIH.Set_PriestAscension FALSE
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "40"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[2]
		}
        
        if ${_StartingPoint} == 1
		{
			call This.Named1 "Hulking Drachnid Prototype"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Hulking Drachnid Prototype"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Head Archivist R'Jhere"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Head Archivist R'Jhere"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
        
		if ${_StartingPoint} == 3
		{
			call This.Named3 "Meditation of a Hundred Strikes"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Meditation of a Hundred Strikes"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 4
		{
			call This.Named4 "Noyle the Essence-Weaver"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Noyle the Essence-Weaver"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 5
		{
			call This.Named5 "Ravenscale Protectorate"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Ravenscale Protectorate"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 6
		{
			call This.Named6 "T'Lon the Powermonger"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#6: T'Lon the Powermonger"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		;//Finish zone (zone out)
		if ${_StartingPoint} == 7
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

		call Obj_OgreUtilities.HandleWaitForZoning
		wait 10
		Obj_OgreIH:SetCampSpot
		wait 10
		oc !c -ChangeCampSpotWho ${Me.Name} -421.231506 8.953549 -48.607170
		call Obj_OgreUtilities.HandleWaitForCampSpot 50
		oc !c -ChangeCampSpotWho ${Me.Name} -477.085693 9.662611 25.407948
		call Obj_OgreUtilities.HandleWaitForCampSpot 70
		oc !c -ChangeCampSpotWho ${Me.Name} -450.507050 14.060266 52.865227
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
		oc !c -ChangeCampSpotWho ${Me.Name} -401.110016 16.418085 41.441978
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
		oc !c -ChangeCampSpotWho ${Me.Name} -377.414764 16.795065 56.756161
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		oc !c -ApplyVerbForWho igw:${Me.Name} "crypt_door_to_mistmoore_portal_chamber" "use"
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} -350.337402 0.854701 10.039196
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
		oc !c -ChangeCampSpotWho ${Me.Name} -354.791199 1.507052 6.880872
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷    NAMED 1 - Hulking Drachnid Prototype    ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Hulking Drachnid Prototype")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "0.073184,-0.212976,-8.426570"
		call Movetoloc "-0.161754,-0.212976,-49.451771"
		call Movetoloc "-0.075520,-0.478837,-70.946907"
		call Movetoloc "-21.828632,-0.273455,-95.307373"
		call Movetoloc "-52.995586,-0.273454,-94.885712"
		call Movetoloc "-52.746346,4.178916,-129.820633"
		call Movetoloc "-34.662514,4.177859,-164.385941"
		call Movetoloc "-19.932501,4.173318,-180.904617"
		call Movetoloc "0.101950,4.176993,-200.178925"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 2 - Head Archivist R'Jhere      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{   
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-0.137767,16.115658,-225.402725"
		call Movetoloc "19.740675,16.117157,-251.277328"
		call Movetoloc "43.051868,16.118803,-251.490494"
		call Movetoloc "38.591862,16.118801,-262.333801"
		call Movetoloc "6.927489,4.143193,-262.070007"
		call Movetoloc "13.761723,3.889064,-289.372467"

        if ${Actor["${_NamedNPC}"](exists)}
        {
            if ${Actor["${_NamedNPC}"].Type.Equal["NoKill NPC"]}
            {
                echo ${Time}: Waiting for ${_NamedNPC} to become attackable.
                while ${Actor["${_NamedNPC}"].Type.Equal["NoKill NPC"]}
                    waitframe
                wait 10                
            }
            Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
            wait 40
			call HandleNamed
        }
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷  NAMED 3 - Meditation of a Hundred Strikes  ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Doesnotexist")
	{	
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "5.881990,4.143226,-308.250946"
		call Movetoloc "-42.600887,4.143339,-307.520477"
		call Movetoloc "-48.148212,4.143285,-289.436737"
		call Movetoloc "-79.361870,7.227939,-283.284119"
		call Movetoloc "-81.060623,11.571072,-241.528625"
		Obj_OgreIH:ChangeCampSpot["-112.265739,14.195178,-238.986542"]
        Ob_AutoTarget:AddActor["${Meditation of a Hundred Strikes}",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${Orator of Misgivings}",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${Tailor of Sabotage}",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${Conduit of Elemental Fury}",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${Architect of Storms}",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${Censor of Reconstruction}",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${Pillar of the Implacable}",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${Overseer of Devastation}",0,FALSE,FALSE]
		wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷     NAMED 4 - Noyle the Essence-Weaver     ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-113.420456,14.201239,-222.385254"
		call Movetoloc "-115.346077,14.223730,-191.089111"
		call Movetoloc "-153.516708,14.235349,-188.669800"
		Obj_OgreIH:ChangeCampSpot["-156.673721,16.372955,-198.040695"]
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 5 - Ravenscale Protectorate      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		relay all OgreBotAtom aExecuteAtom all a_QueueCommand ChangeCastStackListBoxItem "Lifeburn" FALSE TRUE
        relay all OgreBotAtom aExecuteAtom all a_QueueCommand ChangeCastStackListBoxItem "Undead Horde" FALSE TRUE
		call Movetoloc "-143.647430,14.218675,-189.756607"
		call Movetoloc "-116.577965,14.223729,-192.402802"
		call Movetoloc "-111.733818,14.191989,-237.789322"
		call Movetoloc "-80.571854,11.220715,-244.428207"
		call Movetoloc "-78.629539,6.802067,-287.678009"
		call Movetoloc "-44.842712,4.143333,-289.863342"
		call Movetoloc "-44.537979,4.143338,-309.356262"
		call Movetoloc "-6.174243,4.143254,-309.393158"
		call Movetoloc "-14.039557,4.143282,-317.355286"
		call Movetoloc "-42.186020,16.118803,-317.088867"
		call Movetoloc "-42.126266,16.118803,-327.179077"
		call Movetoloc "-0.728222,16.118803,-327.153809"
		call Movetoloc "44.705605,16.103298,-329.283630"
		call Movetoloc "77.827850,16.092894,-331.912506"
		call Movetoloc "80.282562,16.092894,-364.986969"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 6 - T'Lon the Powermonger       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named6(string _NamedNPC="Doesnotexist")
	{
		Event[EQ2_onIncomingText]:AttachAtom[Powermonger]
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "77.240379,16.076511,-378.144440"
        if ${Actor["Mayong Mistmoore's Treasure"](exists)} && ${Math.Distance[${Actor["Mayong Mistmoore's Treasure"].Loc},94.296265,16.092892,-364.183685]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} 94.296265 16.092892 -364.183685
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            wait 50
            oc !c -ChangeCampSpotWho ${Me.Name} 77.240379 16.076511 -378.144440
            wait 50
        }
		call Movetoloc "-0.763919,10.490804,-378.938446"
        if ${Actor["Mayong Mistmoore's Treasure"](exists)} && ${Math.Distance[${Actor["Mayong Mistmoore's Treasure"].Loc},0.020848,10.490805,-364.846771]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} 0.020848 10.490805 -364.846771
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            wait 30
            oc !c -ChangeCampSpotWho ${Me.Name} -0.763919 10.490804 -378.938446
            wait 30
        }
		call Movetoloc "-0.170768,10.526916,-386.329254"
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		wait 10
		oc !c -ApplyVerbForWho ${Me.Name} "Platform Switch" "Send platform off."
		wait 150
		Obj_OgreIH:SetCampSpot
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Obj_OgreIH:ChangeCampSpot["0.215585,11.261766,-441.730530"]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
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
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		call Obj_OgreIH.KillActorType 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		eq2execute summon
	}

	function PostNamed()
	{
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        eq2execute summon
		wait 20
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
			OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
			wait 300
			OgreBotAPI:CastAbility_Relay["all","Bladedance"]
            while ${Me.InCombat}
                waitframe
        }
		call PostNamed
	}
}
;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================

atom Powermonger(string Text)
{
	if ${Text.Find["I will not fall"](exists)}==TRUE
	{
		relay all OgreBotAtom aExecuteAtom all a_QueueCommand ChangeCastStackListBoxItem "Lifeburn" TRUE TRUE
		relay all OgreBotAtom aExecuteAtom all a_QueueCommand ChangeCastStackListBoxItem "Undead Horde" TRUE TRUE
		oc !c -CastAbility All Phase
		wait 1
		oc !c -CastAbility All Undead Horde
		wait 20
		oc !c -CastAbility All Lifeburn
	}
}

atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}
