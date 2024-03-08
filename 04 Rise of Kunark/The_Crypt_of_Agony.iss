;================================================================================
; Title: Chelsith | Author: Unknown, The Marty Party | Date: 25 Jul 2023 | Version: 2.0
;================================================================================

;//Common variables
variable string sZoneName="The Crypt of Agony"
variable string sZoneShortName="exp04_dun_sebilis_epic01_crypt"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

;//Named variables
variable string Named1="Librarian Zimor"
variable string Named2="Gruplinort"
variable string Named3="Baron Yosig"
variable string Named4="Arch Duke Latol"
variable string Named5="Harbinger Freglor"
variable string Named6="Hierophant Prime Grekal"
variable string Named7="Lord Vizaroth"
variable string Named8="Fallen Emperor Vekin"

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process ${_StartingPoint} "-NoAutoLoadMapOnZone" ${Args.Expand}
}

objectdef Object_Instance
{
	function:bool RunInstance(int _StartingPoint=1)
	{
		if ${_StartingPoint} == 0
		{
            ogre ica
            wait 2
            
			call Obj_OgreIH.CD.GetIntoZone
			if !${Return}
			{
				Obj_OgreIH:Actor_Click["zone_to_crypt"]
                wait 10
                oc !c -Door 1 ${Me.Name}
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time}: \agStarting to auto-run ${sZoneName}. Version: 2.0
			
        	Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController/RoK"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "25"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
		    ;_StartingPoint:Set[5]
		}

		if ${_StartingPoint} == 1
		{
			call This.Named1 "${Named1}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#1: ${Named1}"]
				return FALSE
			}
			_StartingPoint:Inc
        }

		if ${_StartingPoint} == 2
		{
			call This.Named2 "${Named2}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#2: ${Named2}"]
				return FALSE
			}
			_StartingPoint:Inc
        }

		if ${_StartingPoint} == 3
		{
			call This.Named3 "${Named3}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#3: ${Named3}"]
				return FALSE
			}
			_StartingPoint:Inc
        }

		if ${_StartingPoint} == 4
		{
			call This.Named4 "${Named4}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#4: ${Named4}"]
				return FALSE
			}
			_StartingPoint:Inc
        }

		if ${_StartingPoint} == 5
		{
			call This.Named5 "${Named5}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#5: ${Named5}"]
				return FALSE
			}
			_StartingPoint:Inc
        }

		if ${_StartingPoint} == 6
		{
			call This.Named6 "${Named6}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#6: ${Named6}"]
				return FALSE
			}
			_StartingPoint:Inc
        }

		if ${_StartingPoint} == 7
		{
			call This.Named7 "${Named7}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#7: ${Named7}"]
				return FALSE
			}
			_StartingPoint:Inc
        }

		if ${_StartingPoint} == 8
		{
			call This.Named8 "${Named8}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#8: ${Named8}"]
				return FALSE
			}
			_StartingPoint:Inc
        }
    
		;// Finish zone (zone out)
        if ${_StartingPoint} == 9
        {
            Obj_OgreIH:LetsGo
        	eq2execute Target_None
			oc !c -cfw igw:${Me.Name} -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			call Movetoloc "-0.028599,2.713132,-8.588174"

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
		
		call Movetoloc "-10.390339,23.758684,294.359039"
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 1 - Librarian Zimor          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "0.199572,-0.286868,-0.991676"
		call Movetoloc "7.560605,-0.349369,14.650099"
        call Movetoloc "11.063148,-0.349369,29.783699"
        call Movetoloc "-6.472799,-0.349368,36.586491"
        call Movetoloc "0.186163,-0.286868,52.764160"
        call Movetoloc "-0.528632,-3.425917,84.055183"
        call Movetoloc "-20.523596,-3.425917,83.673843"
        call Movetoloc "-19.893536,-3.425917,102.438904"
        call Movetoloc "-43.159504,-6.174136,102.766647"
        call Movetoloc "-60.598793,-5.804090,118.327194"
        call Movetoloc "-78.249657,-9.255955,129.753265"
        call Movetoloc "-100.028214,-8.201880,118.337906"
        call Movetoloc "-121.648849,-6.884563,108.017555"
        call Movetoloc "-136.552307,-6.812079,106.234825"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
        call Movetoloc "-148.065384,-6.812079,105.943085"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
        call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 2 - Gruplinort            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "-123.603645,-6.486845,105.502403"
        call Movetoloc "-74.684746,-9.302128,132.435181"
        call Movetoloc "-69.846016,-9.306308,141.927338"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
        call Movetoloc "-83.825409,-7.287833,160.452408"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
        call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 3 - Baron Yosig            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "-78.167938,-7.802052,153.208069"
        call Movetoloc "-67.688683,-9.325844,144.561768"
        call Movetoloc "-48.705856,-6.935371,146.801926"
        call Movetoloc "-33.659370,-6.349915,150.058578"
        call Movetoloc "-25.056234,-4.344000,175.914322"
        call Movetoloc "-44.964573,-4.843092,186.061554"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
        call Movetoloc "-78.343803,-7.093096,191.718506"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
        call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 4 - Arch Duke Latol          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "-44.888191,-4.843092,187.022415"
        call Movetoloc "-44.135052,-7.594039,216.608109"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
        call Movetoloc "-76.064987,-9.844042,216.777985"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
        call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 5 - Harbinger Freglor         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named5(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "-45.585827,-7.594038,216.390396"
        call Movetoloc "-26.528109,-7.593411,227.089050"
        call Movetoloc "3.420495,-7.594038,217.804871"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
        call Movetoloc "34.274143,-9.844042,214.808960"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
        call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 6 - Hierophant Prime Grekal      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named6(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "-0.268815,-7.594038,216.482391"
        call Movetoloc "1.486352,-4.843092,187.084534"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
        call Movetoloc "34.073803,-7.093096,187.368423"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
        call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷           NAMED 7 - Lord Vizaroth           ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named7(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "1.644306,-4.843092,188.685318"
        call Movetoloc "-2.721281,-7.593965,222.517502"
        call Movetoloc "-21.303875,-7.593523,225.582962"
        call Movetoloc "-18.836882,-10.093173,276.257233"
        call Movetoloc "-9.500299,-10.093180,286.404510"
        call Movetoloc "9.542091,-10.093173,290.280853"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
        call Movetoloc "28.035213,-10.093173,295.583160"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
        call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 8 - Fallen Emperor Vekin       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named8(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "-12.861037,-10.093176,282.920044"
        call Movetoloc "-11.320952,-10.093175,310.454224"
        call Movetoloc "-13.171760,-13.094035,341.133575"
        call Movetoloc "-32.184181,-13.094034,341.434998"
        call Movetoloc "-32.434673,-13.030669,361.847778"
        call Movetoloc "-32.267101,-10.595408,382.825775"
        call Movetoloc "-18.809366,-10.422596,386.339691"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "-47.550060,-10.553613,386.861450"
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
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		call Obj_OgreIH.KillActorType 10
        eq2execute summon
		call Obj_OgreUtilities.WaitForLootWindow
		;OgreBotAPI:CastAbility_Relay["all","Gather Remains"]
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
			OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
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
