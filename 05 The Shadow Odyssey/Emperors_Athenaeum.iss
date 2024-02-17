;================================================================================
; Title: Emperor's Athenaeum | Author: The Marty Party | Date: 17 Feb 2024 | Version: 1.0
;================================================================================

variable string sZoneShortName="exp04_dun_charasis_west"
variable string sZoneName="Emperor's Athenaeum"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
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
				;Obj_OgreIH:Actor_Click["Charasis: The Emperor's Athenaeum"]
				eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="Charasis: The Emperor's Athenaeum"].ID} enter
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time}: \agStarting to auto-run ${sZoneName}. Version: 1.0
					
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
		    ;_StartingPoint:Set[4]
		}
        
        if ${_StartingPoint} == 1
		{
			call This.Named1 "The Athenaeum Curator"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: The Athenaeum Curator"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Master of the Embalmers"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Master of the Embalmers"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Sslatch"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Sslatch"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 4
		{
			call This.Named4 "Drago"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Drago"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 5
		{
			call This.Named5 "Sslortis"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Sslortis"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		;// Finish zone (zone out)
		if ${_StartingPoint} == 6
		{
            Obj_OgreIH:LetsGo
        	eq2execute Target_None
			
			oc !c -cfw igw:${Me.Name} -Evac

			wait 50
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 50

			Obj_OgreIH:SetCampSpot
			Obj_OgreIH:ChangeCampSpot["-3.189948,-0.389323,0.195291"]
			call Obj_OgreUtilities.HandleWaitForCampSpot 10
			wait 50

			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",FALSE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",FALSE]
			
			;Check if the zone can be reset.
			call This.CheckZoneResetStatus
			if !${Return}
            {             
                return FALSE
            }
			;Reset the zone
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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 1 - The Athenaeum Curator       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-1.384080,-0.389323,0.671356"
		call Movetoloc "44.369457,1.110678,0.467280"
		call Movetoloc "44.495506,1.110674,-15.428767"
		call Movetoloc "44.230904,3.485679,-25.354059"
		;Pulling first pack
        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		oc !c -ChangeCampSpotWho ${Me.Name} 44.271294 3.985691 -37.323479
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 55.674709 3.985691 -48.164028
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -ChangeCampSpotWho ${Me.Name} 44.271294 3.985691 -37.323479
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -ChangeCampSpotWho ${Me.Name} 44.230904 3.485679 -25.354059
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		wait 10
        eq2execute Target_None
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 20
		;Pulling second pack
        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		oc !c -ChangeCampSpotWho ${Me.Name} 44.271294 3.985691 -37.323479
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 32.544914 3.985691 -47.654625
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -ChangeCampSpotWho ${Me.Name} 44.271294 3.985691 -37.323479
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -ChangeCampSpotWho ${Me.Name} 44.230904 3.485679 -25.354059
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		wait 10
        eq2execute Target_None
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 20
		call Movetoloc "44.271294,3.985691,-37.323479"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		Obj_OgreIH:ChangeCampSpot["36.157055,3.985691,-44.459454"]
		call HandleNamed
        return TRUE
    }
	
;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 2 - Master of the Embalmers      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{   
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "44.455177,3.985691,-43.753277"
		call Movetoloc "44.312553,3.985691,-90.991234"
		call OpenSesame
		call Movetoloc "43.945488,3.985681,-105.467911"
		;call Movetoloc "83.568192,3.985681,-105.535721"
		call Movetoloc "108.798714,3.985681,-105.581825"
		call Movetoloc "125.556229,4.937418,-71.319878"
		call Movetoloc "135.317841,4.985681,-71.206177"
		;call Movetoloc "140.556870,4.985681,-92.789284"
		call Movetoloc "154.909729,5.985685,-104.822868"
		call Movetoloc "169.821777,5.936140,-104.886528"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call HandleNamed
        return TRUE
    }
	
;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷              NAMED 3 - Sslatch              ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Doesnotexist")
	{	
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "150.700592,4.985681,-104.798958"
		call Movetoloc "132.489777,4.985681,-71.265266"
		call Movetoloc "124.240280,4.230791,-71.062271"
		call Movetoloc "115.717407,3.985681,-54.753090"
		call Movetoloc "116.071266,5.485685,-29.822697"
		call OpenSesame
		call Movetoloc "116.157753,5.485677,-19.223646"
		call Movetoloc "92.220085,5.485677,-3.521510"
		;call Movetoloc "91.528961,5.485677,29.433231"
		call Movetoloc "91.597816,5.485677,52.021896"
		call Movetoloc "54.484291,4.485681,61.900471"
		call Movetoloc "54.772545,4.485681,84.642212"
		call Movetoloc "54.530403,4.485681,106.002670"
		call Movetoloc "69.752037,5.610685,99.390121"
		call Movetoloc "90.633430,5.575429,99.516006"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷               NAMED 4 - Drago               ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		Event[EQ2_onIncomingText]:AttachAtom[Drago]
		Event[EQ2_onIncomingText]:AttachAtom[Pet]
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "58.149536,4.485681,99.393700"
		call Movetoloc "58.025890,5.445258,68.272331"
		call Movetoloc "92.213539,5.485677,46.617970"
		call Movetoloc "92.162010,5.485677,22.327190"
		call Movetoloc "97.358696,6.485838,22.360773"
		call OpenSesame
		call Movetoloc "129.739380,8.073309,22.628820"
		call Movetoloc "125.452492,9.796870,32.160275"
		oc !c -ChangeCampSpotWho ${Me.Name} 135.037674 7.985678 22.338934
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 40
		oc !c -ChangeCampSpotWho ${Me.Name} 125.452492 9.796870 32.160275
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷              NAMED 5 - Sslortis             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "130.668213,8.073309,22.404922"
		call Movetoloc "155.507568,9.735685,22.451809"
		call HandlePuzzle
		call Movetoloc "186.119217,7.985680,22.723824"
		;call Movetoloc "244.854141,10.485685,22.879824"
		call Movetoloc "273.389099,10.485684,22.716663"
		call Obj_OgreUtilities.PreCombatBuff 5
		;Below is stun
		Ob_AutoTarget:AddActor["Sslortis",0,FALSE,FALSE]
		;Below is disarm
		Ob_AutoTarget:AddActor["Octuss",0,FALSE,FALSE]
		;Below is root
		Ob_AutoTarget:AddActor["Sunrise",0,FALSE,FALSE]
		;Below is fear
		Ob_AutoTarget:AddActor["Nightfall",0,FALSE,FALSE]
		oc !c -ChangeCampSpotWho ${Me.Name} 297.897797 10.485686 22.430468
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} 281.657928 10.485685 22.499786
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call HandleNamed
		call Movetoloc "281.657928,10.485685,22.499786"
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
			;oc !c -cfw igw:${Me.Name} -Zone
			oc !c -ApplyVerbForWho igw:${Me.Name} "To Jarsath Wastes" "Return to Jarsath Wastes"
			
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
		call Obj_OgreIH.KillActorType 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
        eq2execute summon
		wait 40
	}

	function OpenSesame()
	{
		eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} Place your hand on the crystal
		wait 50
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

	function HandlePuzzle()
	{
		variable string OuterRing=""
		variable string MiddleRing=""
		variable string InnerRing="" 
		variable string GreenSwitch="green_crystal"
		
		OuterRing:Set[${Actor[query, Type = "NoKill NPC"  && Name = "" && TargetRingRadius=8].ID}]
		oc Setting OuterRing
		while ${Actor[Query,ID=${OuterRing} && Heading != 180](exists)}
		{
		OgreBotAPI:ApplyVerb["${OuterRing}","Rotate Letters Clockwise"]
		wait 20
		}

		oc OuterRing Set!

		MiddleRing:Set[${Actor[query, Type = "NoKill NPC"  && Name = "" && TargetRingRadius=7].ID}]
		oc Setting MiddleRing
		while ${Actor[Query,ID=${MiddleRing} && Heading != 216](exists)}
		{
		OgreBotAPI:ApplyVerb["${MiddleRing}","Rotate Crystals Clockwise"]
		wait 20
		}

		oc MiddleRing Set!

		InnerRing:Set[${Actor[query, Type = "NoKill NPC"  && Name = "" && TargetRingRadius=6].ID}]
		oc Setting InnerRing
		while ${Actor[Query,ID=${InnerRing} && Heading != 180](exists)}
		{
		OgreBotAPI:ApplyVerb["${InnerRing}","Rotate Star Clockwise"]
		wait 20
		}
		oc InnerRing Set!

		oc Openning Door
		GreenSwitch:Set[${Actor[Query,Type = "NoKill NPC" && TargetRingRadius=5].ID}]
		wait 5
		OgreBotAPI:ApplyVerb["${GreenSwitch}","Unlock Vault Door"]
		wait 20
	}
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}

atom Drago(string Text)
{
	if ${Text.Find["but Drago is invulnerable"](exists)}==TRUE
	{
		eq2execute h
	}
}

atom Pet(string Text)
{
	if ${Text.Find["I'll flay your hide"](exists)}==TRUE || ${Text.Find["Death iss the penalty"](exists)}==TRUE
	{
		relay all eq2execute pet attack
	}
}
