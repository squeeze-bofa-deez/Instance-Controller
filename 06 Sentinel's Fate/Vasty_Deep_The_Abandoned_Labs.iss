;================================================================================
; Title: Vasty Deep: The Abandoned Labs | Author: The Marty Party | Date: 15 Mar 2024 | Version: 1.1
;================================================================================

variable string sZoneShortName="exp06_dun_vastydeep02"
variable string sZoneName="Vasty Deep: The Abandoned Labs"
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
				Obj_OgreIH:Actor_Click["zone_to_vastydeep02"]
				wait 10
				oc !c -Door 2 ${Me.Name}
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
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "35"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[2]
		}

        if ${_StartingPoint} == 1
		{
			call This.Named1 "Kadara'Mola"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Kadara'Mola"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 2
		{
			call This.Named2 "Herep'Hilos"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Herep'Hilos"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		
		if ${_StartingPoint} == 3
		{
			call This.Named3 "Zaina Zumurrud"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Zaina Zumurrud"]
				return FALSE
			}
			_StartingPoint:Inc
		}	
		
		if ${_StartingPoint} == 4
		{
			call This.Named4 "Humunculis"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Humunculis"]
				return FALSE
			}
			_StartingPoint:Inc
		}	

		if ${_StartingPoint} == 5
		{
			call This.Named5 "Gorad Tohll"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Gorad Tohll"]
				return FALSE
			}
			_StartingPoint:Inc
		}	

		if ${_StartingPoint} == 6
		{
			call This.Named6 "Rrullr Crrraagg"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#6: Rrullr Crrraagg"]
				return FALSE
			}
			_StartingPoint:Inc
		}	

		if ${_StartingPoint} == 7
		{
			call This.Named7 "Perah'Celsis"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#7: Perah'Celsis"]
				return FALSE
			}
			_StartingPoint:Inc
		}	

		;//Finish zone (zone out)
		if ${_StartingPoint} == 8
		{
            Obj_OgreIH:LetsGo
        	eq2execute Target_None

			oc !c -cfw igw:${Me.Name} -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 50
			call Movetoloc "7.748149,-1.576841,0.195439"
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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 1 - Kadara'Mola            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "6.650403,-1.576841,0.074947"
		call ManaarQuest
		call Movetoloc "-62.492252,-10.997499,-4.333858"
		call Movetoloc "-62.295300,-12.997499,-38.515331"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "0.193205,-14.997500,-36.652122"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 2 - Herep'Hilos            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "29.801420,-14.997500,-20.541994"
		eq2execute target a forlorn lab worker
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombat
		call Movetoloc "0.193205,-14.997500,-36.652122"
		call Movetoloc "-0.111861,-14.997500,-86.514931"
		call Movetoloc "-23.931168,-14.997499,-86.367371"
		call Movetoloc "-23.723053,-14.997499,-109.196854"
		call Movetoloc "1.040024,-14.997500,-110.022980"
		call Movetoloc "0.008413,-14.997500,-172.473465"
		call Movetoloc "-25.685036,-14.997500,-202.804733"
		call Movetoloc "-0.948773,-14.997500,-231.564041"
		call Movetoloc "-0.537616,-14.997500,-296.348358"
		call Movetoloc "-24.746208,-14.997500,-308.903320"
		call Movetoloc "0.749699,-14.997499,-328.699707"
		call Movetoloc "-0.090475,-14.997500,-378.902283"
		call Movetoloc "15.644062,-14.997500,-356.630371"
		call Movetoloc "-0.090475,-14.997500,-378.902283"
		call Movetoloc "32.430138,-14.997499,-407.192230"
		call Movetoloc "-1.697597,-14.997500,-399.925323"
		call Movetoloc "-16.521303,-14.997500,-422.266968"
		
		if ${Actor["A Damp Lockbox"](exists)} && ${Math.Distance[${Actor["A Damp Lockbox"].Loc},-38.527531,-14.381497,-416.054596]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -38.527531 -14.381497 -416.054596
            call Obj_OgreUtilities.HandleWaitForCampSpot 30
			call Movetoloc "-16.521303,-14.997500,-422.266968"
        }

		call Movetoloc "-1.697597,-14.997500,-399.925323"
		call Movetoloc "-30.048944,-14.997500,-372.056000"
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "-1.697597,-14.997500,-399.925323"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 3 - Zaina Zumurrud          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-14.542184,-14.997500,-389.877380"
		call Movetoloc "-53.413914,-14.997507,-390.571808"
		call Movetoloc "-53.445602,-14.997507,-357.928345"
		call Movetoloc "-96.460800,-14.997500,-349.387756"
		Ob_AutoTarget:AddActor["an essence of anger",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["a long dead librarian",0,FALSE,FALSE]
		call Movetoloc "-66.830986,-14.997499,-313.679108"
		call Movetoloc "-96.460800,-14.997500,-349.387756"
		call Movetoloc "-149.960068,-14.997500,-367.694092"
		call Movetoloc "-188.814819,-44.602787,-334.792633"
		call Movetoloc "-177.866714,-59.997501,-287.534363"
		call Movetoloc "-157.483719,-59.782623,-312.992798"
		call Movetoloc "-119.234146,-59.997501,-350.611450"
		call Movetoloc "-87.865082,-59.997486,-316.126587"
		call Movetoloc "-133.102341,-59.997501,-273.164673"
		call Movetoloc "-146.358170,-59.997498,-275.140717"
		call Movetoloc "-158.003677,-59.997410,-290.459076"
		call Movetoloc "-128.401047,-58.006325,-315.548767"
		call Movetoloc "-152.559662,-59.997498,-300.375732"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait wait 100
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 4 - Humunculis            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-154.861221,-59.997501,-328.525208"
		call Movetoloc "-155.622391,-59.997501,-327.156128"
		Obj_OgreIH:ChangeCampSpot["-157.511688,-59.847279,-336.086884"]
		wait 20
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		wait 20
		call Movetoloc "-127.442200,-14.997505,-259.209808"
		call Movetoloc "-127.442200,-14.997505,-259.209808"
		call Movetoloc "-130.562469,-14.997507,-240.102539"
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		OgreBotAPI:Special[igw:${Me.Name}]
		wait 30
		call Obj_OgreUtilities.HandleWaitForZoning
		call Movetoloc "-104.570229,-59.997501,-276.095245"
		call Movetoloc "-91.470520,-56.997501,-241.515076"
		Ob_AutoTarget:AddActor["a savage escaped specimen",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["a strange residue",0,FALSE,FALSE]
		call Movetoloc "-29.413889,-49.706093,-251.908081"
		call Movetoloc "40.959999,-49.997513,-245.198166"
		call Movetoloc "37.242077,-49.997509,-152.451538"
		call Movetoloc "-40.654015,-49.997517,-157.199448"
		call Movetoloc "-33.747963,-47.563663,-202.699799"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 5 - Gorad Tohll            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "0.114550,-47.563663,-171.428940"
		call Movetoloc "31.267101,-47.563663,-202.313171"
		call Movetoloc "4.203388,-47.563663,-227.480316"
		Obj_OgreIH:ChangeCampSpot["-1.825217,-47.508965,-232.981674"]
		wait 20
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		wait 20
		call Movetoloc "50.961781,-14.997500,-53.901272"
		call Movetoloc "54.343601,-14.997500,-46.686760"
		oc !c -ApplyVerbForWho ${Me.Name} "panel_02" "Activate lifeforce magic!"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 6 - Rrullr Crrraagg          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named6(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "73.951027,-14.997499,-46.967228"
		oc !c -ApplyVerbForWho ${Me.Name} "panel_03" "Activate lifeforce magic!"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷           NAMED 7 - Perah'Celsis           ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named7(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "96.334839,-14.999501,-26.797407"
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

	function ManaarQuest()
	{
		oc !c -Pause igw:${Me.Name}
        wait 5
		relay all eq2execute target Alia
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
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}
