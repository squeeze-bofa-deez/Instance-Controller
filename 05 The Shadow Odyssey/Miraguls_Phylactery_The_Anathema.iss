;================================================================================
; Title: Miragul's Phylactery: The Anathema | Author: The Marty Party | Date: 29 Feb 2024 | Version: 1.0
;================================================================================

;//Common variables
variable string sZoneShortName="exp05_dun_miragul_lower"
variable string sZoneName="Miragul's Phylactery: The Anathema"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

;//Named variables
variable string Named1="Corpus Amygdalus"
variable string Named2="Blood Sucker"
variable string Named3="Faenelae"
variable string Named4="Atrocious Amalgam"
variable string Named5="Shittergroup"
variable string Named6="Patriae Vykel"

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
				Obj_OgreIH:Actor_Click["Miragul's Phylactery"]
                wait 10
                oc !c -Door 2 ${Me.Name}
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

        ;// Finish zone (zone out)
        if ${_StartingPoint} == 7
        {
            Obj_OgreIH:LetsGo
            eq2execute Target_None
            oc !c -cfw igw:${Me.Name} -Evac
            call Obj_OgreUtilities.HandleWaitForZoning
            call Movetoloc "1.311435,0.119773,2.399814"

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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 1 - Corpus Amygdalus         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "9.365713,-0.184470,8.297708"
        call Movetoloc "21.212193,2.356628,-22.567408"
        call Movetoloc "52.345860,1.837342,-31.144884"
        call Movetoloc "60.743065,2.899394,-72.520126"
        Ob_AutoTarget:AddActor["Urn of Emotions",0,FALSE,FALSE]
        Ob_AutoTarget:AddActor["a furious spark",0,FALSE,FALSE]
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        call Obj_OgreUtilities.HandleWaitForCombat 10
        wait 50
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷           NAMED 2 - Blood Sucker           ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "53.669491,2.176339,-49.854816"
        call Movetoloc "69.542778,6.877843,-61.907497"
        call Movetoloc "83.724281,16.346893,-88.009644"
        call Movetoloc "135.336441,19.548164,-88.387917"
        call Movetoloc "159.308319,18.465366,-98.233917"
        call Movetoloc "187.189651,18.337751,-100.76564"
        call Movetoloc "188.618774,18.865599,-76.208313"
        call Movetoloc "188.828186,15.059260,-65.134338"
        eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use
        wait 10
        call Movetoloc "188.839188,4.454324,-25.040546"
        call Movetoloc "183.067307,4.454324,-19.228403"
        call Movetoloc "188.808624,4.454320,-5.426480"
        call Movetoloc "188.772720,3.533804,8.009886"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷             NAMED 3 - Faenelae             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "189.052292,3.534322,21.119156"
        eq2execute apply_verb ${Actor[Query,Type="Special"&& Name="Chest containing arms"].ID} Retrieve arms
        wait 30
        call Movetoloc "189.005508,4.454325,-7.949922"
        call Movetoloc "182.541656,4.454324,-19.003828"
        call Movetoloc "188.845779,4.634321,-31.682505"
        call Movetoloc "188.864700,14.579719,-59.069660"
        eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use
        wait 10
        call Movetoloc "188.632996,18.712498,-77.864120"
        call Movetoloc "173.564331,18.978596,-120.703423"
        call Movetoloc "173.501312,14.637765,-130.955231"
        eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use
        wait 10
        call Movetoloc "173.524780,4.514051,-168.283188"
        call Movetoloc "179.484039,4.514051,-176.503372"
        call Movetoloc "173.260986,4.556052,-189.393906"
        call Movetoloc "173.389526,3.511264,-202.132736"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 4 - Atrocious Amalgam         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named4(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "173.455887,3.594047,-216.739944"
        eq2execute apply_verb ${Actor[Query,Type="Special"&& Name="Chest containing legs"].ID} use
        wait 30
        call Movetoloc "173.449921,4.514051,-186.244614"
        call Movetoloc "179.670715,4.514051,-176.331940"
        call Movetoloc "173.534515,4.694047,-163.891968"
        call Movetoloc "173.572418,14.639462,-136.462692"
        eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use
        wait 10
        call Movetoloc "173.939651,18.625784,-116.305847"
        call Movetoloc "206.972824,18.337751,-68.679886"
        Ob_AutoTarget:AddActor["a wandering experiment",0,FALSE,FALSE]
        wait 30
        call PostNamed
        call Movetoloc "213.390808,18.619476,-88.782028"
        call Movetoloc "234.821701,20.908735,-91.128342"
        eq2execute target Shade of Miragul
        wait 10
        eq2execute h
        wait 10
        eq2execute Target_None
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 200
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷           NAMED 5 - Shittergroup           ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named5(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "207.396713,18.560640,-85.985329"
        call Movetoloc "125.510803,23.482080,-88.964432"
        call Movetoloc "82.381836,16.134552,-87.635796"
        call Movetoloc "68.797333,2.357933,-92.833153"
        call Movetoloc "70.778542,2.359694,-99.261513"
        eq2execute apply_verb ${Actor[Query,Type="Special"&& Name="A Music Box"].ID} Insert the crank and turn it repeatedly
        wait 20
        eq2execute apply_verb ${Actor[Query,Type="Special"&& Name="A Music Box"].ID} use
        wait 20
        call Movetoloc "52.893940,2.215654,-49.574455"
        call Movetoloc "49.110916,1.913279,-27.412359"
        call Movetoloc "26.529533,2.081423,-25.991253"
        call Movetoloc "1.413195,-0.275805,8.934970"
        eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} light the fuse and kick the barrel
        wait 150
        call Movetoloc "-71.420868,-1.875363,13.901716"
        call Movetoloc "-83.351204,-6.670312,77.695686"
        call Movetoloc "-83.444496,-14.293056,144.885956"
        call Movetoloc "-89.992668,-14.386368,211.796021"
        call Movetoloc "-180.875900,-12.277841,216.328247"
        call Movetoloc "-192.363022,-7.323188,183.777191"
        call Movetoloc "-237.567444,-4.769308,184.806931"
        call TurnColumns
        call Movetoloc "-237.567444,-4.769308,184.806931"
        call Movetoloc "-265.596954,-2.269598,182.053268"
        press TAB
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷           NAMED 6 - Patriae Vykel           ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named6(string _NamedNPC="Doesnotexist")
    {
        echo ${Time}: Moving to ${_NamedNPC}
        call Movetoloc "-220.327271,-4.813466,183.377853 "
        call Movetoloc "-191.638992,-7.223053,183.005173"
        call Movetoloc "-176.667191,-12.432171,224.069534"
        call Movetoloc "-118.670578,-17.605139,177.248413"
        call Obj_OgreUtilities.HandleWaitForCombat 10
        wait 10
        oc !c -CS_ClearCampSpot igw:${Me.Name}
        wait 10
        oc !ci -FlyDown igw:${Me.Name}
        wait 50
        call Movetoloc "-121.129105,-48.949463,166.203751"
        call Movetoloc "-121.264229,-32.023418,136.004349"
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 20
        call Movetoloc "-121.332695,-33.186985,105.469528"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
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
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        call Obj_OgreIH.KillActorType 10
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

    function TurnColumns()
	{
		variable point3f A_GreenColumnLocation="-228.628891,-4.706166,180.516312"
		variable point3f A_YellowColumnLocation="-241.449127,-4.802986,173.800858"
		variable point3f A_BlueColumnLocation="-247.617706,-4.795000,190.225784"
		variable point3f A_RedColumnLocation="-231.251343,-4.822413,193.708313"
        variable string Green1="Green Column Piece 01"
		variable string Green2="Green Column Piece 02"
		variable string Green3="Green Column Piece 03"
        variable string Yellow1="Yellow Column Piece 01"
		variable string Yellow2="Yellow Column Piece 02"
		variable string Yellow3="Yellow Column Piece 03"
        variable string Blue1="Blue Column Piece 01"
		variable string Blue2="Blue Column Piece 02"
		variable string Blue3="Blue Column Piece 03"
        variable string Red1="Red Column Piece 01"
		variable string Red2="Red Column Piece 02"
		variable string Red3="Red Column Piece 03"

		;//Move to green column
		oc !c -CampSpot ${Me.Name}
		oc !c -ChangeCampSpotWho ${Me.Name} ${A_GreenColumnLocation.X} ${A_GreenColumnLocation.Y} ${A_GreenColumnLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		wait 10
        oc Setting Green Columns
        Green1:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Green Column Piece 01"].ID}]
		while ${Actor[Query,ID=${Green1} && Heading != 360](exists)}
		{
			OgreBotAPI:ApplyVerb["${Green1}","Turn Left"]
			wait 20
		}
        wait 10
        Green2:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Green Column Piece 02"].ID}]
		while ${Actor[Query,ID=${Green2} && Heading != 360](exists)}
		{
			OgreBotAPI:ApplyVerb["${Green2}","Turn Left"]
			wait 20
		}
        wait 10
        Green3:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Green Column Piece 03"].ID}]
		while ${Actor[Query,ID=${Green3} && Heading != 360](exists)}
		{
			OgreBotAPI:ApplyVerb["${Green3}","Turn Left"]
			wait 20
		}
        wait 10
		oc Green Columns Set!
		
		;//Move to yellow column
		oc !c -ChangeCampSpotWho ${Me.Name} ${A_YellowColumnLocation.X} ${A_YellowColumnLocation.Y} ${A_YellowColumnLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		wait 10
		oc Setting Yellow Columns
        Yellow1:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Yellow Column Piece 01"].ID}]
		while ${Actor[Query,ID=${Yellow1} && Heading != 90](exists)}
		{
			OgreBotAPI:ApplyVerb["${Yellow1}","Turn Left"]
			wait 20
		}
        wait 10
        Yellow2:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Yellow Column Piece 02"].ID}]
		while ${Actor[Query,ID=${Yellow2} && Heading != 90](exists)}
		{
			OgreBotAPI:ApplyVerb["${Yellow2}","Turn Left"]
			wait 20
		}
        wait 10
        Yellow3:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Yellow Column Piece 03"].ID}]
		while ${Actor[Query,ID=${Yellow3} && Heading != 90](exists)}
		{
			OgreBotAPI:ApplyVerb["${Yellow3}","Turn Left"]
			wait 20
		}
        wait 10
		oc Yellow Columns Set!
		
		;//Move to blue column
		oc !c -ChangeCampSpotWho ${Me.Name} ${A_BlueColumnLocation.X} ${A_BlueColumnLocation.Y} ${A_BlueColumnLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		wait 10		
		oc Setting Blue Columns
        Blue1:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Blue Column Piece 01"].ID}]
		while ${Actor[Query,ID=${Blue1} && Heading != 270](exists)}
		{
			OgreBotAPI:ApplyVerb["${Blue1}","Turn Left"]
			wait 20
		}
        wait 10
        Blue2:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Blue Column Piece 02"].ID}]
		while ${Actor[Query,ID=${Blue2} && Heading != 270](exists)}
		{
			OgreBotAPI:ApplyVerb["${Blue2}","Turn Left"]
			wait 20
		}
        wait 10
        Blue3:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Blue Column Piece 03"].ID}]
		while ${Actor[Query,ID=${Blue3} && Heading != 270](exists)}
		{
			OgreBotAPI:ApplyVerb["${Blue3}","Turn Left"]
			wait 20
		}
        wait 10
		oc Blue Columns Set!
		
		;//Move to red column
		oc !c -ChangeCampSpotWho ${Me.Name} ${A_RedColumnLocation.X} ${A_RedColumnLocation.Y} ${A_RedColumnLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		wait 10
        Red1:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Red Column Piece 01"].ID}]
		while ${Actor[Query,ID=${Red1} && Heading != 270](exists)}
		{
			OgreBotAPI:ApplyVerb["${Red1}","Turn Left"]
			wait 20
		}
        wait 10
        Red2:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Red Column Piece 02"].ID}]
		while ${Actor[Query,ID=${Red2} && Heading != 270](exists)}
		{
			OgreBotAPI:ApplyVerb["${Red2}","Turn Left"]
			wait 20
		}
        wait 10
        Red3:Set[${Actor[query, Type = "NoKill NPC"  && Name = "Red Column Piece 03"].ID}]
		while ${Actor[Query,ID=${Red3} && Heading != 270](exists)}
		{
			OgreBotAPI:ApplyVerb["${Red3}","Turn Left"]
			wait 20
		}
        wait 10
		oc Red Columns Set!
	}
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
    echo ${Time}: \agFinished auto-running ${sZoneName}.
}
