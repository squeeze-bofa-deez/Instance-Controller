;================================================================================
; Title: Mistmyr Manor | Author: The Marty Party | Date: 06 Feb 2024 | Version: 1.3
;================================================================================

variable string sZoneShortName="exp05_dun_mistmoore_manor"
variable string sZoneName="Mistmyr Manor"
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
				Obj_OgreIH:Actor_Click["To the Mistmyr Manor"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}
			
			echo ${Time} \agStarting to auto-run ${sZoneName} Version 1.3
			
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			call Obj_OgreIH.Set_PriestAscension FALSE
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "30"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[3]
		}

        if ${_StartingPoint} == 1
		{
			call This.Named1 "Phantom of Symphonia"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Phantom of Symphonia"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Ra'zul the Gallery Curator"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Ra'zul the Gallery Curator"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Rhul'maldis the Librarian"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Rhul'maldis the Librarian"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 4
		{
			call This.Named4 "Kristalin the Secretary"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Kristalin the Secretary"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 5
		{
			call This.Named5 "Sibia the Steward"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Sibia the Steward"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 6
		{
			call This.Named6 "Primogen Daishirou"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Primogen Daishirou"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
						
		;//Finish zone (zone out)
		if ${_StartingPoint} == 7
		{
            Obj_OgreIH:LetsGo
        	Ob_AutoTarget:Clear
			
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
		wait 20
		oc !c -ChangeCampSpotWho ${Me.Name} -350.337402 0.854701 10.039196
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
		oc !c -ChangeCampSpotWho ${Me.Name} -339.455017 0.863179 6.307797
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 1 - Phantom of Symphonia       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Phantom of Symphonia")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "72.889755,-0.241319,0.127970"
		call Movetoloc "95.316177,1.417225,0.243114"
		call Movetoloc "130.715546,10.585276,-0.215772"
		call Movetoloc "174.204865,10.517553,-0.043021"
		call Movetoloc "174.843353,10.578419,-64.797745"
		call Movetoloc "174.966660,10.517538,-83.166779"
		call Movetoloc "175.080078,10.182070,-104.447548"
		call Movetoloc "175.586441,10.182067,-126.458405"
		call Movetoloc "175.278198,10.182072,-155.702499"
		call Movetoloc "177.231796,10.517543,-170.898773"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 2 - Ra'zul the Gallery Curator       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Ra'zul the Gallery Curator")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "175.533600,10.414883,-162.288620"
		call Movetoloc "175.334259,10.182074,-84.975357"
		call Movetoloc "148.842728,10.517552,-94.354874"
		call Movetoloc "148.097992,17.588560,-121.786819"
		call Movetoloc "145.576935,22.803297,-145.393631"
		call Movetoloc "131.635590,22.889044,-145.357330"
		call Movetoloc "122.816666,22.803282,-131.838287"
		call Movetoloc "80.971832,22.803288,-131.242020"
		call Movetoloc "48.295013,22.808729,-132.128891"
		call Movetoloc "36.130943,22.808729,-120.680000"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call Movetoloc "35.808590,22.808729,-95.528564"
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 3 - Rhul'maldis the Librarian       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Rhul'maldis the Librarian")
	{	
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "35.286964,22.808729,-124.894974"
		call Movetoloc "53.424301,22.808729,-133.804214"
		call Movetoloc "68.849518,22.803284,-132.284637"
		call Movetoloc "80.889229,22.803288,-132.371170"
		call Movetoloc "81.156685,22.447508,-186.992416"
		call Movetoloc "93.143196,22.447495,-205.176468"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call WaitForNamed
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 4 - Kristalin the Secretary       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named4(string _NamedNPC="Kristalin the Secretary")
	{	
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "81.099365,22.622221,-223.400421"
		call Movetoloc "80.668152,22.803282,-255.280014"
		call Movetoloc "81.658051,22.803083,-285.819275"
		call Movetoloc "69.138138,22.803083,-294.846252"
		call Movetoloc "36.856422,22.803068,-294.703491"
		call Movetoloc "29.612865,22.803068,-316.645142"
		call Movetoloc "29.596317,22.854256,-326.632233"
		call Movetoloc "49.300056,22.901798,-333.591339"
		call Movetoloc "48.118523,24.588911,-348.243866"
		call Movetoloc "37.576645,25.524473,-351.502441"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 5 - Sibia the Steward       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named5(string _NamedNPC="Sibia the Steward")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		oc !c -cfw igw:${Me.Name} -Evac
		call Obj_OgreUtilities.HandleWaitForZoning
		call Movetoloc "46.845684,-0.563871,0.052942"
		call Movetoloc "72.889755,-0.241319,0.127970"
		call Movetoloc "130.715546,10.585276,-0.215772"
		call Movetoloc "174.204865,10.517553,-0.043021"
		call Movetoloc "174.843353,10.578419,-64.797745"
		call Movetoloc "175.106262,10.506819,-83.488983"
		call Movetoloc "200.354187,10.517552,-96.199120"
		call Movetoloc "203.345169,22.803293,-145.398148"
		call Movetoloc "227.640045,22.803282,-131.871841"
		call Movetoloc "250.048981,22.822065,-132.248901"
		call Movetoloc "257.825745,22.822065,-146.999374"
		call Movetoloc "257.696777,22.682064,-173.912994"
		call Movetoloc "257.783508,29.765593,-205.308563"
		call Movetoloc "218.129120,29.765745,-205.102783"
		call Movetoloc "206.378479,29.765730,-217.954956"
		call Movetoloc "206.586914,29.774595,-242.582245"
		call Movetoloc "199.399765,29.774595,-255.983810"
		call Movetoloc "176.628418,29.774595,-255.969864"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 20
		call HandleNamed	
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 5 - Primogen Daishirou       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named6(string _NamedNPC="Primogen Daishirou")
	{	
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "161.558563,29.774595,-255.848511"
		oc !c -cfw igw:${Me.Name} -Zone
		wait 10
		call Movetoloc "162.738739,30.972837,-271.989319"
		oc !c -Jump
		call Obj_OgreUtilities.HandleWaitForGroupDistance 2
		call Movetoloc "162.539536,32.258327,-291.269836"
		call Movetoloc "162.667969,31.992825,-309.005463"
		Ob_AutoTarget:AddActor["Primogen Daishirou",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Primogen Laenzuo",0,FALSE,FALSE]
		wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                  FUNCTIONS                 ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
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
			
			wait 50
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 50
				
			
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

	function WaitForNamed()
	{
		if ${Actor["${_NamedNPC}"](exists)}
		{
			if ${Actor["${_NamedNPC}"].Type.Equal["NamedNPC"]}
			{
				echo ${Time}: Waiting for ${_NamedNPC} to become attackable.
				while ${Actor["${_NamedNPC}"].Type.Equal["NamedNPC"]}
					waitframe
				wait 10                
			}
		}
	}
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time} \agFinished auto-running ${sZoneName}
}
