;================================================================================
; Title: The Obelisk of Blight | Author: The Marty Party | Date: 03 Nov 2021 | Version: 1.1
;================================================================================

variable string sZoneShortName="exp03_dun_obelisk_epic01_blight"
variable string sZoneName="The Obelisk of Blight"
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
				Obj_OgreIH:Actor_Click["Zone_to_Obelisk_of_Blight"]
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
			call This.Named1 "Interrogator Bruek"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Interrogator Bruek"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 2
		{
			call This.Named2 "Occulator Yxorx"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Occulator Yxorx"]
				return FALSE
			}
			_StartingPoint:Inc
		}   

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Zzorzzazxx"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Zzorzzazxx"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 4
		{
			call This.Named4 "Gretalik the Bloodbourne"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Gretalik the Bloodbourne"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 5
		{
			call This.Named5 "Axxyk'Tuur"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Axxyk'Tuur"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		;//Finish zone (zone out)
		if ${_StartingPoint} == 6
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
		call Movetoloc "778.066162,-42.489723,461.912903"
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷        NAMED 1 - Interrogator Bruek        ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "0"]
		call Movetoloc "126.257332,-15.317148,26.612589"
		Obj_OgreIH:Actor_Click["door_rising_001_01"]
		wait 50
		call Movetoloc "115.465103,-15.361206,26.623135"
		call Movetoloc "115.516266,-11.173264,2.336854"
		call Movetoloc "99.027130,-11.173245,2.191018"
		call Movetoloc "99.132561,-12.515844,-11.847567"
		Obj_OgreIH:Actor_Click["door_rising_002_01"]
		wait 50
		call Movetoloc "99.232910,-12.913402,-18.785629"
		call Movetoloc "107.621819,-12.913401,-27.564014"
		call Movetoloc "102.127914,-12.913402,-43.581474"
		call Movetoloc "94.235413,-14.805519,-57.973667"
		call Movetoloc "87.945793,-14.784973,-70.382317"
		call Movetoloc "74.535393,-13.012385,-60.866718"
		call Movetoloc "70.060265,-13.012384,-63.417744"
		call Movetoloc "59.977360,-13.012384,-77.370872"
		call Movetoloc "35.548985,-13.012385,-61.540730"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Obj_OgreIH:ChangeCampSpot["44.030411,-13.012385,-47.926506"]
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 2 - Occulator Yxorx          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "35.548985,-13.012385,-61.540730"
		call Movetoloc "59.977360,-13.012384,-77.370872"
		call Movetoloc "70.060265,-13.012384,-63.417744"
		call Movetoloc "74.535393,-13.012385,-60.866718"
		call Movetoloc "87.945793,-14.784973,-70.382317"
		call Movetoloc "94.235413,-14.805519,-57.973667"
		call Movetoloc "102.127914,-12.913402,-43.581474"
		call Movetoloc "107.621819,-12.913401,-27.564014"
		call Movetoloc "99.232910,-12.913402,-18.785629"
		OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "25"]
		Obj_OgreIH:Actor_Click["door_rising_002_01"]
		wait 50
		call Movetoloc "99.027130,-11.173245,2.191018"
		call Movetoloc "70.618797,-11.173244,2.130508"
		call Movetoloc "70.474770,-0.665812,46.890247"
		Obj_OgreIH:Actor_Click["door_rising_004_01"]
		wait 50
		call Movetoloc "53.362961,-4.849293,46.850670"
		call Movetoloc "46.202682,-6.302851,37.585037"
		call Movetoloc "37.317867,-6.302851,26.138546"
		Obj_OgreIH:ChangeCampSpot["25.091440,-6.302851,31.464504"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Movetoloc "15.563620,-6.302885,26.978970"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Obj_OgreIH:ChangeCampSpot["8.271486,-6.302851,43.041210"]
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 3 - Zzorzzazxx            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "3.644850,-4.568308,46.947716"
		Obj_OgreIH:Actor_Click["door_rising_005_01"]
		wait 50
		call Movetoloc "-8.979947,-6.302885,47.319225"
		call Movetoloc "-13.368112,-5.342460,29.068478"
		call Movetoloc "-19.939926,-5.321525,23.569353"
		call Movetoloc "-35.321945,-6.302852,27.144682"
		call Movetoloc "-70.760529,-6.302851,30.357105"
		Ob_AutoTarget:AddActor["a key of chaos",0,FALSE,FALSE]
        wait 20
		call HandleNamed
		call Movetoloc "-41.945065,-6.302851,26.759544"
		Obj_OgreIH:Actor_Click["door_rising_006_01"]
		wait 50
		call Movetoloc "-41.663845,-4.555781,16.228224"
		call Movetoloc "-41.822678,-5.157207,4.360808"
		call Movetoloc "-41.824211,-6.932852,-17.203993"
		call Movetoloc "-26.131754,-5.165576,-13.581966"
		call Movetoloc "-21.798897,-5.175448,-24.611292"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Obj_OgreIH:ChangeCampSpot["-4.898226,-5.002325,-17.709850"]
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷     NAMED 4 - Gretalik the Bloodbourne     ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{	
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-55.406891,-5.119864,-18.023891"
		call Movetoloc "-64.528564,-5.175454,-25.025667"
		call Movetoloc "-67.949265,-5.175490,-10.232990"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Bladedance"]
		wait 20
		Obj_OgreIH:ChangeCampSpot["-87.844322,-5.002370,-17.875011"]
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 5 - Axxyk'Tuur            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-41.535862,-6.932852,-17.873560"
		call Movetoloc "-42.298748,-5.175160,-36.169655"
		call Movetoloc "-42.764645,-5.002366,-46.359840"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Obj_OgreIH:ChangeCampSpot["-42.713882,-5.002370,-64.603821"]
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
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}
