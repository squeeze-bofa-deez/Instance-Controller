;================================================================================
; Title: Kurn's Tower: Breaching the Void | Author: The Marty Party | Date: 24 Feb 2024 | Version: 1.2
;================================================================================

;//Common variables
variable string sZoneShortName="exp04_dun_kurns_tower"
variable string sZoneName="Kurn's Tower: Breaching the Void"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

;//Named variables
variable string Named1="Jennre Warsinger"
variable string Named2="an Ancient Void-Touched Wumpus"
variable string Named3="Thovalakk"
variable string Named4="Telvorsinn"
variable string Named5="Yynzik the Scornridden"

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
                Obj_OgreIH:Actor_Click["zone_to_kurns_tower"]
                wait 10
                oc !c -Door 2 ${Me.Name}
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

        ;//Finish zone (zone out)
        if ${_StartingPoint} == 6
        {
            Obj_OgreIH:LetsGo
            eq2execute Target_None
            oc !c -cfw igw:${Me.Name} -Evac
            call Obj_OgreUtilities.HandleWaitForZoning
            call Movetoloc "-67.540726,-4.706821,-98.249054"
            call Movetoloc "-68.167145,-4.733641,-87.278542"
            call Movetoloc "-56.684280,-49.547798,-89.226273"
            wait 30
            call Movetoloc "-57.747654,-51.179153,-118.438255"

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
		Obj_OgreIH:SetCampSpot
		wait 10
		oc !c -ChangeCampSpotWho ${Me.Name} -1865.766602 -390.693756 -1767.409302
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !c -ChangeCampSpotWho ${Me.Name} -1860.397827 -387.129181 -1815.917603
		call Obj_OgreUtilities.HandleWaitForCampSpot 50
		oc !c -ChangeCampSpotWho ${Me.Name} -1838.143066 -384.228088 -1833.660156
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		oc !c -ChangeCampSpotWho ${Me.Name} -1820.743286 -383.506287 -1834.977417
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 1 - Jennre Warsinger         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "-56.841702,-49.852295,-95.141510"
        call Movetoloc "-57.615135,-4.749035,-75.093422"
        wait 50
        eq2execute target a charbone destroyer
        wait 50
        call PostNamed
        call Movetoloc "-23.131332,-6.174342,-76.497589"
        call Movetoloc "43.411190,-6.174340,-59.008472"
        eq2execute target a icebone destroyer
        wait 50
        call PostNamed
        call Movetoloc "63.795769,-1.505958,-28.273769"
        call Movetoloc "62.706581,-6.174342,44.038197"
        call Movetoloc "51.596912,-6.174342,72.745132"
        eq2execute target a charbone destroyer
        wait 50
        call PostNamed
        call Movetoloc "-8.965021,-6.174342,49.027000"
        call Movetoloc "-52.447247,-4.871433,43.994820"
        eq2execute target a icebone destroyer
        wait 30
        call PostNamed
        call Movetoloc "-52.592075,-4.458266,-0.275059"
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 20
        call Movetoloc "29.805788,-4.458266,0.157714"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷  NAMED 2 - an Ancient Void-Touched Wumpus  ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "61.977985,-1.505958,10.343163"
        call Movetoloc "97.756882,0.918204,6.946847"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷             NAMED 3 - Thovalakk             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "80.136246,1.402311,5.865833"
        oc !c -ApplyVerbForWho ${Me.Name} "lift_switch" "Click on the runes!"
        oc !ci -Pause
        wait 220
        oc !ci -Resume
        call Movetoloc "102.863976,183.058899,14.429202"
        call Movetoloc "102.911171,183.058899,0.929340"
        call Movetoloc "-3.115891,215.537933,2.559766"
        wait 20
        oc !c -ApplyVerbForWho ${Me.Name} "disc_switch" "Raise Disc"
        wait 150
        call Movetoloc "-0.840866,288.437927,0.141982"
        eq2execute target a remnant of Theer
        wait 50
        call PostNamed
        wait 10
        eq2execute target a remnant of Theer
        wait 50
        call PostNamed
        wait 10
        eq2execute target a remnant of Theer
        wait 50
        call PostNamed
        wait 10
        eq2execute target a remnant of Theer
        wait 50
        call PostNamed
        call Movetoloc "0.073239,288.964417,13.272736"
        call Movetoloc "0.247651,288.741852,69.428917"
        call Movetoloc "36.665356,289.171692,86.495232"
        eq2execute target a remnant of Theer
        wait 20
        call PostNamed
        call Movetoloc "0.247651,288.741852,69.428917"
        call Movetoloc "-36.791702,289.171692,87.237740"
        eq2execute target a remnant of Theer
        wait 20
        call PostNamed
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 30
        call Movetoloc "0.392889,287.847870,112.452705"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 4 - Telvorsinn            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named4(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "0.140323,289.410706,46.447891"
        call Movetoloc "-0.078320,288.964417,-13.631119"
        call Movetoloc "-0.511888,288.965118,-69.699593"
        call Movetoloc "-38.187572,289.395081,-88.620735"
        eq2execute target a remnant of Theer
        wait 20
        call PostNamed
        call Movetoloc "-0.511888,288.965118,-69.699593"
        call Movetoloc "37.295132,289.395081,-88.223724"
        eq2execute target a remnant of Theer
        wait 20
        call PostNamed
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 30
        call Movetoloc "-0.661711,288.284760,-111.983192"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 5 - Yynzik the Scornridden      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named5(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "-0.218583,289.634338,-48.450748"
        call Movetoloc "0.165823,288.437927,-0.406406"
        call Movetoloc "-2.050751,288.437927,4.464196"
        oc !c -ApplyVerbForWho ${Me.Name} "disc_switch" "Raise Disc"
        wait 150
        call Movetoloc "-0.186789,426.728088,15.934945"
        call Movetoloc "-36.457188,426.396301,50.669266"
        call Movetoloc "50.404015,426.396301,36.314430"
        call Movetoloc "49.805912,426.396301,-36.782661"
        call Movetoloc "-36.121841,426.396301,-48.794392"
        call Movetoloc "-51.955441,428.132141,-67.689964"
        call Movetoloc "-89.169769,428.332581,14.176392"
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 20
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        call Movetoloc "-66.699348,428.427704,10.735344"
        wait 50
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
            call Movetoloc "-80.650513,-54.623207,-129.097961"
            wait 10
            oc !c -CS_ClearCampSpot igw:${Me.Name}
            relay all press -hold ${OgreBackwardKey}
            wait 10
            relay all press -release ${OgreBackwardKey}
            wait 10
            relay all press -hold ${OgreForwardKey}
            wait 10
            relay all press -release ${OgreForwardKey}
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
		call Obj_OgreUtilities.WaitForLootWindow
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
