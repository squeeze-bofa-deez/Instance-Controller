;================================================================================
; Title: Erudin Research Halls | Author: The Marty Party | Date: 16 Mar 2024 | Version: 1.0
;================================================================================

/*
	This IC requires my BeamHandler.iss script to function correctly. It can be found on my Github.
	https://github.com/squeeze-bofa-deez/Scripts/blob/main/06%20Sentinel's%20Fate/BeamHandler.iss
*/

;//Common variables
variable string sZoneShortName="exp06_dun_erudin_erudin02"
variable string sZoneName="Erudin Research Halls"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

;//Named variables
variable string Named1="Beam Handler Val'Kinad"
variable string Named2="Beam Handler Pin'Tannil"
variable string Named3="V'lad Olkeen"
variable string Named4="Beam Handler Ran"
variable string Named5="A Fully Functional Deathgazer"
variable string Named6="Beam Handler Polla"
variable string Named7="Taranis Gazerra"

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
				Obj_OgreIH:Actor_Click["Erudin Research Halls"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time}: \agStarting to auto-run ${sZoneName}. Version: 1.0

			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			oc !ci -ChangeOgreBotUIOption ${Me.Name} checkbox_settings_enable_chatevents TRUE TRUE TRUE
			OgreBotAPI:ChatEvent_AddEntry["${Me.Name}", "No! While my power still holds, I WILL NOT FALL!", "TRUE", "FALSE", "runscript BeamHandler"]

			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap

			call Obj_OgreIH.Set_VariousOptions
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "40"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[5]
		}

		if ${_StartingPoint} == 1
		{
			call This.Named1 "${Named1}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: ${Named1}"]
				return FALSE
			}

			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 2
		{
			call This.Named2 "${Named2}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: ${Named2}"]
				return FALSE
			}

			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "${Named3}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: ${Named3}"]
				return FALSE
			}

			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 4
		{
			call This.Named4 "${Named4}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: ${Named4}"]
				return FALSE
			}

			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 5
		{
			call This.Named5 "${Named5}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: ${Named5}"]
				return FALSE
			}

			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 6
		{
			call This.Named6 "${Named6}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#6: ${Named6}"]
				return FALSE
			}

			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 7
		{
			call This.Named7 "${Named7}"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#7: ${Named7}"]
				return FALSE
			}

			_StartingPoint:Inc
		}

		;//Finish zone (zone out)
		if ${_StartingPoint} == 8
		{
			call Movetoloc "-31.749416,-19.496668,-124.204330"
			call Movetoloc "-93.513039,-15.496707,-59.552456"
			call Movetoloc "-107.299950,-15.496661,-90.056030"
			call Movetoloc "-90.149628,-15.496661,-105.675781"

			Obj_OgreIH:LetsGo
			eq2execute Target_None
			oc !c -cfw igw:${Me.Name} -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			call Movetoloc "-5.707929,0.002500,38.414524"
			call ManaarQuest

			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",FALSE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",FALSE]
			OgreBotAPI:ChatEvent_RemoveEntry["${Me.Name}", "No! While my power still holds, I WILL NOT FALL!"]

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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 1 - Beam Handler Val'Kinad      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-5.707929,0.002500,38.414524"
		call ManaarQuest
		call Movetoloc "0.488684,-19.496660,-74.284363"
		;call Movetoloc "73.797920,-19.496675,-128.843445"
		;call Movetoloc "39.870953,-19.496675,-166.184647"
		;call Movetoloc "73.917763,-19.496675,-123.917587"
		;call Movetoloc "-0.789628,-19.496662,-71.858513"
		;call Movetoloc "-51.125023,-19.496672,-135.446396"
		;call Movetoloc "-35.094906,-19.496675,-163.237717"
		call Movetoloc "-60.213402,-19.496679,-95.475906"
		call Movetoloc "-89.580811,-15.496706,-60.228512"
		call Movetoloc "-105.234070,-15.496671,-83.591721"
		call Movetoloc "-126.820480,-15.496661,-92.527527"
		call Movetoloc "-134.374695,-15.496661,-128.249268"
		call Movetoloc "-127.991516,-15.496661,-116.240463"
		call Movetoloc "-116.741600,-15.997500,-124.141441"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		call Movetoloc "-89.170456,-15.496661,-126.064888"
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 2 - Beam Handler Pin'Tannil      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-133.066772,-15.496660,-102.452454"
		call Movetoloc "-191.199219,-11.379133,-72.483521"
		call Movetoloc "-196.303284,-11.453917,-113.718056"
		call Movetoloc "-215.777130,-11.453917,-113.974258"
		call Movetoloc "-215.856277,-11.496407,-125.089630"
		;//First mirror
		oc !c -ChangeCampSpotWho ${Me.Name} -219.724762 -11.453917 -114.389168
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call PrepareToPlaceItem "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !c -ChangeCampSpotWho ${Me.Name} -211.605164 -9.862974 -138.175507
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PlaceItemNoChecks "laser mirror"
 		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		;//Second mirror
		oc !c -ChangeCampSpotWho ${Me.Name} -219.724762 -11.453917 -114.389168
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call PrepareToPlaceItem "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !c -ChangeCampSpotWho ${Me.Name} -220.446228 -11.496393 -140.561523
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PlaceItemNoChecks "laser mirror"
 		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 20		
		;//Third mirror
		oc !c -ChangeCampSpotWho ${Me.Name} -219.724762 -11.453917 -114.389168
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call PrepareToPlaceItem "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !c -ChangeCampSpotWho ${Me.Name} -212.032959 -11.496394 -149.567200
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		call PlaceItemNoChecks "laser mirror"
 		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 30	
		;//Fourth mirror
		oc !c -ChangeCampSpotWho ${Me.Name} -219.724762 -11.453917 -114.389168
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call PrepareToPlaceItem "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !c -ChangeCampSpotWho ${Me.Name} -219.144135 -10.794696 -150.656143
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		call PlaceItemNoChecks "laser mirror"
 		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 30			
		;//Fifth mirror
		oc !c -ChangeCampSpotWho ${Me.Name} -219.724762 -11.453917 -114.389168
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call PrepareToPlaceItem "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !c -ChangeCampSpotWho ${Me.Name} -213.311966 -11.408004 -159.087708
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
		call PlaceItemNoChecks "laser mirror"
 		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 40			
		;//Sixth mirror
		oc !c -ChangeCampSpotWho ${Me.Name} -219.724762 -11.453917 -114.389168
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call PrepareToPlaceItem "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !c -ChangeCampSpotWho ${Me.Name} -218.989502 -11.369262 -161.482483
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
		call PlaceItemNoChecks "laser mirror"
 		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 40			
		;//Seventh mirror
		oc !c -ChangeCampSpotWho ${Me.Name} -220.722595 -11.453918 -112.140198
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call PrepareToPlaceItem "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !c -ChangeCampSpotWho ${Me.Name} -216.189011 -11.496394 -161.778564
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
		oc !c -ChangeCampSpotWho ${Me.Name} -212.624603 -11.395295 -169.876953
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PlaceItemNoChecks "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -216.189011 -11.496394 -161.778564
		call Obj_OgreUtilities.HandleWaitForCampSpot 40		
 		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 20			
		;//Eighth mirror
		oc !c -ChangeCampSpotWho ${Me.Name} -220.722595 -11.453918 -112.140198
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call PrepareToPlaceItem "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !c -ChangeCampSpotWho ${Me.Name} -216.189011 -11.496394 -161.778564
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
		oc !c -ChangeCampSpotWho ${Me.Name} -219.373322 -10.960175 -171.997849
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PlaceItemNoChecks "laser mirror"
		oc !c -ChangeCampSpotWho ${Me.Name} -216.189011 -11.496394 -161.778564
		call Obj_OgreUtilities.HandleWaitForCampSpot 40		
 		oc !c -ChangeCampSpotWho ${Me.Name} -215.856277 -11.496407 -125.089630
		call Obj_OgreUtilities.HandleWaitForCampSpot 20			
		call FixView
		call Movetoloc "-216.202957,-11.496403,-186.531296"
		call Movetoloc "-197.851089,-11.459122,-213.025223"
		call Movetoloc "-191.320999,-11.468351,-240.379959"
		call Movetoloc "-151.448074,-15.496665,-218.211624"
		call Movetoloc "-133.444824,-15.496660,-207.615005"
		call Movetoloc "-137.335571,-15.496661,-178.559555"
		call Movetoloc "-127.035408,-15.496660,-243.682510"
		call Movetoloc "-135.550644,-15.496661,-209.774506"
		call Movetoloc "-121.699181,-15.997500,-191.611526"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		call Movetoloc "-91.505333,-15.496661,-187.233963"
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷           NAMED 3 - V'lad Olkeen           ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-117.318901,-15.713336,-260.683960"
		call Movetoloc "-89.609222,-15.738597,-288.438751"
		wait 5
		Obj_OgreIH:ChangeCampSpot["-80.046532,-15.738629,-289.208191"]
		oc !c -Jump igw:${Me.Name}
		wait 5
		oc !c -Jump igw:${Me.Name}
		wait 5
		oc !c -Jump igw:${Me.Name}
		wait 5
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Movetoloc "-72.000023,-16.001774,-296.789429"
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		wait 10
		relay all press -hold ${OgreForwardKey}
		wait 20
		relay all press -release ${OgreForwardKey}
		call Movetoloc "19.337143,-16.358906,-301.993561"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Ob_AutoTarget:AddActor["a ticking tinkerer",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		eq2execute target V'lad Olkeen
		wait 150
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 4 - Beam Handler Ran         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "40.085674,-15.441385,-302.292694"
		Obj_OgreIH:ChangeCampSpot["47.358490,-15.441386,-303.785370"]
		oc !c -Jump igw:${Me.Name}
		wait 5
		oc !c -Jump igw:${Me.Name}
		wait 5
		oc !c -Jump igw:${Me.Name}
		wait 5
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Movetoloc "47.358490,-15.441386,-303.785370"
		call Movetoloc "68.689529,-16.001774,-300.347534 "
		call Movetoloc "96.830948,-15.496660,-259.002380"
		call Movetoloc "100.996315,-15.496661,-221.984650"
		call Movetoloc "127.509964,-15.997500,-205.101807"
		call Movetoloc "121.717804,-15.997500,-188.198074"
		call Movetoloc "140.220505,-15.496660,-196.185074"
		call Movetoloc "121.717804,-15.997500,-188.198074"
		call Movetoloc "112.419624,-15.654592,-188.754120"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		call Movetoloc "89.315369,-15.496661,-185.763977"
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷   NAMED 5 - A Fully Functional Deathgazer   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "133.049423,-15.496660,-210.231613"
		call Movetoloc "193.807129,-11.474596,-238.805588"
		call Movetoloc "194.540024,-11.851077,-186.086823"
		eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="mirror_resetter"].ID} Press the Red Button
		wait 130
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		eq2execute target A Fully Functional Deathgazer
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷        NAMED 6 - Beam Handler Polla        ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named6(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		wait 50
		call Movetoloc "194.351593,-11.851077,-125.851616"
		call Movetoloc "193.747055,-11.496702,-72.073898"
		call Movetoloc "143.526337,-15.496660,-96.842812"
		call Movetoloc "132.088120,-14.797441,-130.217651"
		call Movetoloc "126.194611,-15.997499,-116.702538"
		call Movetoloc "114.778084,-15.997499,-123.557739"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		call Movetoloc "89.210838,-15.496661,-125.996010"
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 7 - Taranis Gazerra          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named7(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "104.184525,-15.213064,-81.744576"
		call Movetoloc "91.162758,-15.434176,-60.657784"
		call Movetoloc "56.741158,-19.496670,-99.407532"
		call Movetoloc "32.020275,-19.496675,-130.465408"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		call Movetoloc "20.204010,-19.496670,-152.353699"
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
			wait 40
			call Obj_OgreUtilities.HandleWaitForZoning
			call Movetoloc "-561.773926,530.572510,-142.395050"

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
		call Obj_OgreUtilities.HandleWaitForCampSpot 2
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		call Obj_OgreIH.KillActorType 2
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		eq2execute summon
	}

	function PostNamed()
	{
		call Obj_OgreUtilities.HandleWaitForCampSpot 5
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH.KillActorType 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		eq2execute summon
		call Obj_OgreUtilities.WaitForLootWindow
		wait 5
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
		relay all eq2execute target Rafiqa
		wait 10
		relay all eq2execute h
		wait 10
		oc !ci -OptNum 2 igw:${Me.Name}
		wait 10
		oc !ci -OptNum 1 igw:${Me.Name}
		wait 10
		oc !ci -OptNum 1 igw:${Me.Name}
		wait 10
        oc !c -Resume igw:${Me.Name}
        wait 5
		eq2execute Target_None
	}

    function PrepareToPlaceItem(string _actorName)
    {
        if ${Me.In3rdPersonView}
        {
            call Obj_OgreUtilities.Set_FirstPersonView
            wait 5
            call Obj_OgreUtilities.Set_LookDown 30	
            wait 5
        }
        Actor["${_actorName.Escape}"]:DoubleClick
        wait 5
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
    }

    function PlaceItemNoChecks(string _actorName)
    {
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
        wait 5
        Mouse:LeftClick    
        wait 20
    }

    function FixView()
    {
        call Obj_OgreUtilities.ResetCameraAngle
        call Obj_OgreUtilities.Set_ZoomOut 1
        wait 5
    }
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}
