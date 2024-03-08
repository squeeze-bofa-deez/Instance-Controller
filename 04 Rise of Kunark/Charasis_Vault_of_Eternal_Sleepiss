;================================================================================
; Title: Charasis: Vault of Eternal Sleep | Author: The Marty Party | Date: 05 Mar 2024 | Version: 1.0
;================================================================================

;//Common variables
variable string sZoneShortName="exp04_dun_charasis_north"
variable string sZoneName="Charasis: Vault of Eternal Sleep"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

;//Named variables
variable string Named1="The Keeper of Dreams"
variable string Named2="The Keeper of Nightmares"
variable string Named3="Guardian of Eternity"
variable string Named4="Praetor of the Phylactery"

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
                eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="Charasis: Vault of Eternal Sleep"].ID} enter
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
            ;_StartingPoint:Set[4]
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
            call Movetoloc "0.015721,0.002500,22.996199"

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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 1 - The Keeper of Dreams       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "0.060595,0.002500,-21.415447"
        call Movetoloc "-0.642283,1.502500,-59.134861"
        call Movetoloc "-25.716835,3.877500,-62.672554"
        Obj_OgreIH:ChangeCampSpot["-32.101318,4.745648,-62.589489"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        Obj_OgreIH:ChangeCampSpot["-35.707817,-5.166279,-57.252552"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Movetoloc "-39.177292,-5.372493,-67.165611"
        call Movetoloc "-38.579964,-5.122500,-91.056847"
        call Movetoloc "-63.914074,-5.122503,-91.033836"
        call Movetoloc "-61.574623,-5.122503,-126.992523"
        call Movetoloc "-31.657757,-6.622504,-126.445663"
        call Movetoloc "0.721234,-7.622500,-127.016983"
        call Movetoloc "0.233546,-7.622500,-172.574463"
        call Movetoloc "-21.669125,-6.641751,-173.501801"
        call Obj_OgreUtilities.PreCombatBuff 5
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 20
        call Movetoloc "-41.702492,-9.622485,-173.252533"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷     NAMED 2 - The Keeper of Nightmares     ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "0.344693,-7.622500,-173.201218"
        call Movetoloc "1.121976,-7.622500,-99.442352"
        call Movetoloc "66.211082,-7.622500,-100.463425"
        call Movetoloc "66.222923,-7.622500,-134.700943"
        call Movetoloc "113.475060,-6.622500,-134.545486"
        call Movetoloc "114.496941,-6.622500,-68.843834"
        call Movetoloc "127.816330,-6.622500,-68.933388"
        call Obj_OgreUtilities.PreCombatBuff 5
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 20
        call Movetoloc "148.936813,-6.374165,-68.729858"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 3 - Guardian of Eternity       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "113.923164,-6.622500,-68.686447"
        call Movetoloc "113.766350,-6.622500,-134.157135"
        call Movetoloc "66.006058,-7.622500,-134.158188"
        call Movetoloc "65.482040,-7.622500,-99.835434"
        call Movetoloc "0.006982,-7.622500,-99.796249"
        call Movetoloc "-0.446516,-7.622500,-200.717941"
        call Movetoloc "27.428463,-7.622500,-196.616089"
        call Movetoloc "66.294815,-7.622500,-198.910950"
        call Movetoloc "66.900093,-7.622500,-173.713150"
        call Movetoloc "96.903755,-6.622500,-174.800049"
        call Movetoloc "96.420372,-6.622500,-198.674347"
        call Movetoloc "98.405029,-5.122500,-248.040787"
        call Movetoloc "83.473579,-5.122500,-241.899979"
        oc !c -Zone
        wai 30
        call Movetoloc "82.677849,-5.122500,-246.895370"
        call Movetoloc "71.299393,-5.122500,-245.125183"
        Obj_OgreIH:ChangeCampSpot["71.144897,-5.122500,-262.835327"]
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
        Obj_OgreIH:ChangeCampSpot["55.688152,-5.122514,-259.283997"]
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        Ob_AutoTarget:AddActor["a torpid guardian",0,FALSE,FALSE]
        Ob_AutoTarget:AddActor["an entranced guardian",0,FALSE,FALSE]
        Ob_AutoTarget:AddActor["a dormant guardian",0,FALSE,FALSE]
        Ob_AutoTarget:AddActor["a languid guardian",0,FALSE,FALSE]
		wait 10
        call GoBardGo
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} 55.510727 -5.122500 -273.438995
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷     NAMED 4 - Praetor of the Phylactery     ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named4(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "49.905434,-4.872500,-273.188568"
        call PrepareToPlaceItem "Crystal of Dreams"
        wai 10
        Obj_OgreIH:ChangeCampSpot["70.713593,-5.122500,-258.433685"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["74.134277,-5.122500,-250.996780"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        oc !ci -Zone igw:${Me.Name}+bard
        wait 30
        Obj_OgreIH:ChangeCampSpot["74.929665,-5.122500,-246.089615"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["96.180389,-5.122500,-246.008423"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["96.100838,-6.622500,-173.678482"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["64.745125,-7.622500,-173.655518"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["63.422806,-7.622500,-200.950958"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["27.409386,-7.622500,-196.307510"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["-10.470654,-7.622500,-199.672195"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["-10.546131,-7.622500,-173.327103"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["-18.439068,-6.622502,-173.398483"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        oc !c -ChangeCampSpotWho ${Me.Name} -45.120522 -7.226692 -173.133972
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
        call PlaceItemNoChecks "Crystal of Dreams"
        call Movetoloc "-18.439068,-6.622502,-173.398483"
        call FixView
        call Movetoloc "0.813493,-7.622500,-172.159271"
        call Movetoloc "-0.574132,-7.622500,-201.497345"
        call Movetoloc "27.224144,-7.622500,-196.236099"
        call Movetoloc "66.077332,-7.622500,-199.236801"
        call Movetoloc "66.082420,-7.622500,-173.927216"
        call Movetoloc "96.312881,-6.622500,-175.221817"
        call Movetoloc "96.744263,-5.122500,-250.089783"
        call Movetoloc "82.841103,-5.122500,-240.403427"
        oc !c -Zone
        wait 30
        call Movetoloc "83.134918,-5.122500,-246.495102"
        call Movetoloc "70.992012,-5.122500,-245.964005"
        call Movetoloc "71.053734,-5.122500,-260.416016"
        call Movetoloc "64.593216,-4.872500,-276.866486"
        echo Waiting for door to close
        wait 200
        call PrepareToPlaceItem "Crystal of Nightmares"
        Obj_OgreIH:ChangeCampSpot["72.940834,-5.122500,-251.991043"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        oc !ci -Zone igw:${Me.Name}+bard
        wait 30
        Obj_OgreIH:ChangeCampSpot["76.699249,-5.122500,-246.078476"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["96.261986,-5.122500,-246.305069"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["96.616524,-6.622500,-173.738937"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["66.911049,-7.622500,-174.492203"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["63.308804,-7.622500,-200.973526"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["27.977795,-7.622500,-196.839081"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["-0.071828,-7.622500,-200.428726"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["0.501676,-7.622500,-99.571716"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["66.767876,-7.622500,-101.297050"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["67.038887,-7.622500,-134.808609"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["113.840721,-6.622500,-135.070068"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["113.665215,-6.622500,-69.250099"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        Obj_OgreIH:ChangeCampSpot["131.264786,-6.622500,-69.084908"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        oc !c -ChangeCampSpotWho ${Me.Name} 151.694397 -4.222380 -69.080681
		call Obj_OgreUtilities.HandleWaitForCampSpot 40
        call PlaceItemNoChecks "Crystal of Nightmares"
        call Movetoloc "132.191177,-6.622500,-68.956833"
        call FixView
        call Movetoloc "113.814842,-6.622500,-69.159424"
        call Movetoloc "113.732750,-6.622500,-134.032547"
        call Movetoloc "66.393227,-7.622500,-134.689575"
        call Movetoloc "65.504799,-7.622500,-99.850777"
        call Movetoloc "0.244126,-7.622500,-99.469986"
        call Movetoloc "-0.585923,-7.622500,-201.121155"
        call Movetoloc "27.656153,-7.622500,-196.561111"
        call Movetoloc "27.530029,-6.621509,-183.822937"
        oc !c -Zone
        wait 30
        call Movetoloc "27.315304,-6.533907,-172.073608"
        call Movetoloc "27.346550,-5.122508,-160.408066"
        call Movetoloc "21.146708,-5.122500,-155.017456"
        call Movetoloc "34.548363,-5.122500,-151.329056"
        call Movetoloc "34.486416,-3.372500,-147.711227"
        call Obj_OgreUtilities.PreCombatBuff 5
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 20
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        Obj_OgreIH:ChangeCampSpot["27.563507,-3.234085,-124.000816"]
        call HandleNamed
        call Movetoloc "27.563339,-3.372500,-133.714020"
        oc !c -Pause igw:${Me.Name}
        wait 50
        relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="ganak_phylactery_widget"].ID} use
        wait 50
        oc !c -Resume igw:${Me.Name}
        wait 10
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
            relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="Jarsath Wastes"].ID} exit
            ;oc !c -cfw igw:${Me.Name} -Zone
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
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
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

    function PrepareToPlaceItem(string _actorName)
    {
        if ${Me.In3rdPersonView}
        {
            ;echo ${Time}: Setting first person
            call Obj_OgreUtilities.Set_FirstPersonView
            wait 5
            ;echo ${Time}: Looking down
            call Obj_OgreUtilities.Set_LookDown 30	
            wait 5
        }
        ;echo ${Time}: Picking up [${_actorName}]
        Actor["${_actorName.Escape}"]:DoubleClick
        wait 5
        ;echo ${Time}: Moving mouse to center of screen
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
    }

    function PlaceItemNoChecks(string _actorName)
    {
        ;echo ${Time}: Moving mouse to center of screen
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
        wait 5
        ;echo ${Time}: Placing [${_actorName}]
        Mouse:LeftClick    
        wait 20
    }

    function FixView()
    {
        ;echo ${Time}: Reseting view
        call Obj_OgreUtilities.ResetCameraAngle
        call Obj_OgreUtilities.Set_ZoomOut 1
        wait 5
    }

    function GoBardGo()
    {
        ;//First Scroll
        call DisableCastStack
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard 75.238716 -5.122500 -271.935120
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 150
        relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="Scroll of the Torpid"].ID} Read Scroll
        wait 100
        ;//Second Scroll
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard 74.811684 -5.122500 -284.881805
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 150
        relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="Scroll of the Entranced"].ID} Read Scroll
        wait 100
        ;//Third Scroll
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard 36.283405 -5.122500 -285.325928
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 150
        relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="Scroll of the Dormant"].ID} Read Scroll
        wait 100
        ;//Fourth Scroll
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard 36.018566 -5.122500 -271.413239
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 150
        relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="Scroll of the Languid"].ID} Read Scroll
        wait 100
        call EnableCastStack
    }

    function DisableCastStack()
    {
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Buffs TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Cure TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_CureCurse TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Heal TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_PowerHeal TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Res TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Combat TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_CA TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_NamedCA TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_NonNamedCA TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Debuff TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_NamedDebuff TRUE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Items TRUE
    }

    function EnableCastStack()
    {
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Buffs FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Cure FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_CureCurse FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Heal FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_PowerHeal FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Res FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Combat FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_CA FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_NamedCA FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_NonNamedCA FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Debuff FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_NamedDebuff FALSE
        oc !ci -ChangeOgreBotUIOption igw:${Me.Name}+bard checkbox_settings_disablecaststack_Items FALSE
    }
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
    echo ${Time}: \agFinished auto-running ${sZoneName}.
}
