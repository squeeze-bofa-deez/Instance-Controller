;================================================================================
; Title: Royal Palace of Erudin | Author: The Marty Party | Date: 17 Mar 2024 | Version: 1.0
;================================================================================

;//Common variables
variable string sZoneShortName="exp06_dun_erudin_erudin03"
variable string sZoneName="Royal Palace of Erudin"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

;//Named variables
variable string Named1="Mash'al"
variable string Named2="Zordiac the Horned Negotiator"
variable string Named3="Gloom Chevalier Faris"
variable string Named4="El'Arad, Lord Primarch of Erudin"

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
				Obj_OgreIH:Actor_Click["zone_erudin_palace"]
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

		;//Finish zone (zone out)
		if ${_StartingPoint} == 5
		{
			Obj_OgreIH:LetsGo
			eq2execute Target_None
			oc !c -cfw igw:${Me.Name} -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			call Movetoloc "-3.608419,-0.497500,41.389729"
			call ManaarQuest

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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷              NAMED 1 - Mash'al              ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-3.608419,-0.497500,41.389729"
		call ManaarQuest
		Ob_AutoTarget:AddActor["Fragment of Mash'al",0,FALSE,FALSE]
		call Movetoloc "-36.697525,0.008277,0.913854"
		call Movetoloc "-55.767666,0.002522,-55.708847"
		call Movetoloc "-55.673954,0.002508,54.985661"
		call Movetoloc "56.237965,0.002550,56.748844"
		call Movetoloc "56.198601,0.002529,-55.649864"
		call Movetoloc "41.130825,-0.497500,-32.225834"
		call Movetoloc "36.611206,0.069869,-0.261315"
		call Movetoloc "0.520460,2.519525,0.166024"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		eq2execute target Mash'al
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷   NAMED 2 - Zordiac the Horned Negotiator   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-0.146172,2.519523,-13.519402"
		oc !c -ApplyVerbForWho ${Me.Name} "1st floor elevator clicky" "Activate the Disc"
		wait 200
		call Movetoloc "21.495956,140.500854,-21.499975"
		call Movetoloc "23.537529,140.500824,21.783779"
		call Movetoloc "-24.096710,140.645996,23.439262"
		call Movetoloc "-20.955378,140.500839,-20.338428"
		call Movetoloc "-0.508927,141.000793,-61.637089"
		oc !c -ApplyVerbForWho ${Me.Name} "02_pivot_door_02" "Open"
		wait 5
		call Movetoloc "-0.106816,141.000793,-72.079048"
		call Movetoloc "13.362506,141.000793,-71.174896"
		call Movetoloc "-23.220713,141.000793,-70.101173"
		call Movetoloc "-0.183349,141.000793,-71.116249"
		oc !c -ApplyVerbForWho ${Me.Name} "02_pivot_door_02" "Open"
		wait 5
		call Movetoloc "0.810228,140.653015,-18.852396"
		call Movetoloc "61.204945,141.000793,0.011868"
		oc !c -ApplyVerbForWho ${Me.Name} "02_pivot_door_01" "Open"
		wait 5
		call Movetoloc "71.406395,141.000793,0.111315"
		call Movetoloc "69.852020,141.000793,-19.201696"
		call Movetoloc "71.594566,141.000809,18.698128"
		call Movetoloc "70.047089,141.000793,-0.128035"
		oc !c -ApplyVerbForWho ${Me.Name} "02_pivot_door_01" "Open"
		wait 5
		call Movetoloc "20.444530,140.500870,0.764405"
		call Movetoloc "0.095800,141.000793,60.728241"
		oc !c -ApplyVerbForWho ${Me.Name} "02_pivot_door_04" "Open"
		wait 5
		call Movetoloc "-0.047859,141.000793,71.025208"
		call Movetoloc "20.405237,141.000793,70.329330"
		call Movetoloc "-23.622311,141.000793,69.301956"
		call Movetoloc "0.126018,141.000793,68.669632"
		oc !c -ApplyVerbForWho ${Me.Name} "02_pivot_door_04" "Open"
		wait 5
		call Movetoloc "-0.329402,140.500916,20.130733"
		call Movetoloc "-60.342575,141.000793,0.005982"
		oc !c -ApplyVerbForWho ${Me.Name} "02_pivot_door_03" "Open"
		wait 5
		call Movetoloc "-70.132301,141.000793,0.323790"
		call Movetoloc "-66.886879,141.000793,24.353350"
		call Movetoloc "-69.367767,141.000793,-24.780870"
		call Movetoloc "-68.354210,141.000793,-0.070605"
		oc !c -ApplyVerbForWho ${Me.Name} "02_pivot_door_03" "Open"
		wait 5
		call Movetoloc "-19.939011,140.500870,-0.484616"
		call Movetoloc "-28.593288,143.492157,-28.258503"
		call Movetoloc "-34.617573,143.492157,-28.335775"
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		oc !c -ApplyVerbForWho ${Me.Name} "2st floor elevator 01 clicky" "Activate the Disc"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 200
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 3 - Gloom Chevalier Faris       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "15.973149,221.565048,9.712882"
		call Movetoloc "48.931725,221.252502,0.121292"
		call Movetoloc "121.239502,221.316208,-0.330533"
		call Movetoloc "120.580795,225.252502,-45.481255"
		call Movetoloc "171.079239,225.055038,-46.605507"
		call Movetoloc "172.981430,225.180344,-30.283865"
		call Movetoloc "169.852524,224.251404,-57.434132"
		call Movetoloc "158.325027,225.252197,-62.672180"
		call Movetoloc "175.478668,224.251495,-53.442558"
		call Movetoloc "151.451202,225.752380,-45.572048"
		call Movetoloc "121.447868,225.252502,-44.091251"
		call Movetoloc "122.690056,221.316193,0.071949"
		call Movetoloc "41.905842,221.252502,0.823649"
		call Movetoloc "-0.051929,221.252502,45.769543"
		call Movetoloc "0.696556,221.280563,120.141045"
		call Movetoloc "45.054985,225.280548,122.162079"
		call Movetoloc "46.401859,230.502502,190.815353"
		call Movetoloc "16.472654,229.751770,190.735886"
		call Movetoloc "-0.083393,229.752365,205.060501"
		call Movetoloc "-14.570016,229.974396,193.195801"
		call Movetoloc "-10.174947,229.751648,183.281311"
		call Movetoloc "-8.370768,229.751862,202.467209"
		call Movetoloc "15.360849,229.751938,197.689240"
		call Movetoloc "3.685713,229.752457,176.659210"
		call Movetoloc "-14.162187,237.251404,188.390564"
		call Movetoloc "-2.106096,245.233109,204.608047"
		call Movetoloc "13.795865,253.216431,192.292892"
		call Movetoloc "0.224917,261.475891,176.489365"
		call Movetoloc "-13.917063,269.751526,191.740692"
		call Movetoloc "2.544322,278.247833,204.351883"
		call Movetoloc "13.620573,286.248138,187.628189"
		call Movetoloc "-0.679435,289.751526,176.266785"
		call Movetoloc "-0.253693,289.751526,69.529510"
		call Movetoloc "-0.585573,290.502747,36.582317"
		call Movetoloc "-0.879431,290.502930,4.940372"
		call Movetoloc "-0.076815,293.757141,-42.010754"
		call Movetoloc "5.969702,293.757141,-50.339115"
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		oc !c -ApplyVerbForWho ${Me.Name} "4th floor disc clicky" "Activate the Disc"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 600
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷ NAMED 4 - El'Arad, Lord Primarch of Erudin ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-54.457481,350.935272,-0.039593"
		call Movetoloc "-74.533150,350.903137,-3.670623"
		call Movetoloc "-80.182518,351.403381,0.439813"
		call Movetoloc "-92.986435,351.158386,0.399620"
		call Movetoloc "-123.207886,350.903900,-9.864648"
		call Movetoloc "-132.282516,351.867157,0.002480"
		call Movetoloc "-107.178474,448.502502,0.042755"
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		oc !c -ApplyVerbForWho ${Me.Name} "4th floor elevator clicky bottom" "Activate the Disc"
		200
		eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} Touch the Rune
		wait 5
		call Movetoloc "-96.521797,448.002502,0.394959"
		call Movetoloc "16.434189,448.002502,52.367607"
		call Movetoloc "35.269173,448.002502,41.889843"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 100
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
			call Movetoloc "-583.707397,527.325500,-107.589989"
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
