;================================================================================
; Title: Library of Erudin | Author: The Marty Party | Date: 15 Mar 2024 | Version: 1.0
;================================================================================

;//Common variables
variable string sZoneShortName="exp06_dun_erudin_erudin01"
variable string sZoneName="Library of Erudin"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

;//Named variables
variable string Named1="Archivist Fahim"
variable string Named2="Shahrivar the Unquenchable"
variable string Named3="Conservator Haidar"
variable string Named4="Zulfiqar the Indomitable"
variable string Named5="Scholar Primarch Jathibiyya"

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
				Obj_OgreIH:Actor_Click["zone_erudin_library"]
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

		;// Finish zone (zone out)
		if ${_StartingPoint} == 6
		{
			Obj_OgreIH:LetsGo
			eq2execute Target_None
			oc !c -cfw igw:${Me.Name} -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			call Movetoloc "5.480331,0.002500,-13.361732"
			call ManaarQuest
			call Movetoloc "0.128406,0.002500,-1.887089"

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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 1 - Archivist Fahim          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "5.480331,0.002500,-13.361732"
		call ManaarQuest
		call Movetoloc "-5.706918,0.002500,-24.034992"
		call Movetoloc "-27.998102,0.502481,-39.572205"
		call Movetoloc "-56.495419,-0.317854,-39.238857"
		call Movetoloc "-112.418289,-27.996853,-38.846909"
		call Movetoloc "-129.858154,-27.997328,-39.136482"
		call Movetoloc "-156.984344,-28.497499,-38.955708"
		call Movetoloc "-184.990479,-3.535105,-49.251354"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷    NAMED 2 - Shahrivar the Unquenchable    ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		wait 150
		call Movetoloc "-183.168930,-3.435957,-50.474770"
		Obj_OgreIH:ChangeCampSpot["-183.790802,-2.372485,-40.088287"]
		oc !c -Jump igw:${Me.Name}
		wait 5
		oc !c -Jump igw:${Me.Name}
		wait 5
		oc !c -Jump igw:${Me.Name}
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Movetoloc "-157.235992,-2.372485,-39.635441"
		call Movetoloc "-149.107346,-2.372485,-93.289368"
		call GrabERUpdate
		call Movetoloc "-258.766785,-2.372485,-92.434402"
		call GrabERUpdate
		call Movetoloc "-250.524841,-2.372485,-63.642967"
		call GrabERUpdate
		call Movetoloc "-250.089691,-2.372485,-16.073616"
		call GrabERUpdate
		call Movetoloc "-260.001282,-2.372485,10.328035"
		call GrabERUpdate
		call Movetoloc "-258.873779,-2.372485,-39.424664"
		call Movetoloc "-275.670013,-1.330000,-39.439999"
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		wait 5
		call Movetoloc "2.170477,-0.249326,-100.374153"
		call Movetoloc "-10.954331,-0.249326,-130.082672"
		call Movetoloc "-1.365395,-0.249326,-148.420883"
		call Movetoloc "-0.386176,0.002500,-176.768951"
		oc !c -ApplyVerbForWho ${Me.Name} "library_symbol" "Place your hand on the symbol"
		wait 50
		call Movetoloc "15.802513,-0.245780,-172.715729"
		call Movetoloc "38.956638,4.940165,-191.491287"
		call Movetoloc "42.876369,9.877881,-164.866470"
		call Movetoloc "20.075590,14.815564,-174.197266"
		call Movetoloc "38.049950,19.443176,-191.525726"
		call Movetoloc "44.906910,24.197187,-166.804642"
		call Movetoloc "19.319540,29.538807,-173.624268"
		call Movetoloc "38.877586,34.564800,-191.456131"
		call Movetoloc "50.772724,37.535149,-164.788651"
		call Movetoloc "83.052963,37.535164,-166.603821"
		call Movetoloc "83.651558,37.535179,-88.061737"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷        NAMED 3 - Conservator Haidar        ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "35.550652,37.116756,-88.679436"
		call Movetoloc "13.285906,29.141500,-112.278488"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷     NAMED 4 - Zulfiqar the Indomitable     ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "20.149345,37.002472,-72.746124"
		call Movetoloc "-32.998707,37.002522,-44.591988"
		call Movetoloc "-63.194427,38.291943,-73.095238"
		eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} Pull a softly glowing book from the shelf
		wait 40
		Obj_OgreIH:ChangeCampSpot["-64.580017,39.035122,-81.695732"]
		oc !c -Jump igw:${Me.Name}
		wait 5
		oc !c -Jump igw:${Me.Name}
		wait 5
		oc !c -Jump igw:${Me.Name}
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Movetoloc "-62.337780,38.291927,-73.127731"
		call Movetoloc "-68.613480,38.535156,-102.126450"
		call Movetoloc "-90.556305,38.535156,-108.187378"
		call Movetoloc "-89.679161,48.531979,-149.472763"
		call Movetoloc "-101.282242,49.182396,-167.360275"
		call Movetoloc "-89.857544,48.531979,-144.055878"
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 50
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷    NAMED 5 - Scholar Primarch Jathibiyya    ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-101.522453,49.182400,-167.728500"
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		wait 30
		call Movetoloc "15.636340,92.002159,-122.927322"
		Ob_AutoTarget:AddActor["The Gruengach Brute",0,FALSE,FALSE]
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombat
		call Movetoloc "-10.128828,91.002502,-143.426727"
		call Movetoloc "-13.719436,91.002502,-170.964050"
		call Movetoloc "-61.919849,93.002457,-170.579865"
		oc !c -ApplyVerbForWho ${Me.Name} "grand_hall_symbol_03" "Place your hand on the Symbol"
		wait 30
		call Movetoloc "-15.291248,91.002502,-171.358444"
		call Movetoloc "-9.334083,91.002502,-201.801102"
		call Movetoloc "4.352351,93.002380,-253.848480"
		oc !c -ApplyVerbForWho ${Me.Name} "grand_hall_symbol_02" "Place your hand on the Symbol"
		wait 30
		call Movetoloc "12.373150,91.002502,-180.433121"
		call Movetoloc "63.549885,93.876175,-176.987671"
		oc !c -ApplyVerbForWho ${Me.Name} "grand_hall_symbol_01" "Place your hand on the Symbol"
		wait 30
		call Movetoloc "-15.968805,91.002502,-170.592712"
		call Movetoloc "1.709332,96.989380,-181.558868"
		call Movetoloc "9.716985,102.531654,-172.115479"
		call Movetoloc "1.120623,108.254547,-161.790771"
		call Movetoloc "-10.447160,114.458839,-171.440506"
		call Movetoloc "-0.131425,120.769119,-181.759689"
		call Movetoloc "10.912676,127.107414,-172.033890"
		call Movetoloc "-2.405090,133.895386,-160.751083"
		call Movetoloc "-9.956520,141.006836,-176.829971"
		call Movetoloc "5.146105,147.298660,-182.007629"
		call Movetoloc "15.371922,152.002502,-165.253769"
		call Movetoloc "12.515815,153.252518,-132.282288"
		call SpawnScholar
		wait 20
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
		call Obj_OgreUtilities.HandleWaitForCampSpot 1
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		call Obj_OgreIH.KillActorType 1
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

	function GrabERUpdate()
	{
		oc !ci -Pause igw:${Me.Name}
		wait 5
		oc !ci -Special igw:${Me.Name}
		wait 30
		oc !ci -Resume igw:${Me.Name}
		wait 1
	}

	function SpawnScholar()
	{
		oc !c -Pause igw:${Me.Name}
        wait 5
		eq2execute target Head Archivist Farooq
		wait 10
		relay all eq2execute h
		wait 10
		oc !ci -OptNum 1 igw:${Me.Name}
		wait 10
		oc !ci -OptNum 2 igw:${Me.Name}
		wait 10
		oc !ci -OptNum 2 igw:${Me.Name}
		wait 10
		oc !ci -OptNum 2 igw:${Me.Name}
		wait 10
        oc !c -Resume igw:${Me.Name}
		eq2execute Target_None
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
