;================================================================================
; Title: Veksar: The Sunken Theater | Author: Unknown, The Marty Party | Date: 12 Feb 2024 | Version: 1.3
;================================================================================

variable string sZoneShortName="exp05_dun_veksar"
variable string sZoneName="Veksar: The Sunken Theater"
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

			echo ${Time} \agStarting to auto-run ${sZoneName} Version 1.3

			call Obj_OgreIH.CD.GetIntoZone
			if !${Return}
			{
				Obj_OgreIH:Actor_Click["door_zone_to_veksar"]
				wait 10
            	oc !c -Door 2 ${Me.Name}
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController/Default/TSO/exp05_dun_veksar"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			call Obj_OgreIH.Set_PriestAscension FALSE
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "30"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[4]
		}

        if ${_StartingPoint} == 1
		{
			call This.Named1 "Ul'lugh the Divine"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Ul'lugh the Divine"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Gruerg the Ravager"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Gruerg the Ravager"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Boss Riggledub"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Boss Riggledub"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
		if ${_StartingPoint} == 4
		{
			call This.Named4 "Cribblekeep"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Cribblekeep"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
		if ${_StartingPoint} == 5
		{
			call This.Named5 "Lord Sasil"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Lord Sasil"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
		if ${_StartingPoint} == 6
		{
			call This.Named6 "Garudon"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#6: Garudon"]
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
			call Obj_OgreUtilities.HandleWaitForZoning
		    wait 20

			call Movetoloc "23.906219,-3.991555,0.039273"
			
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
		oc !ci -FlyDown igw:${Me.Name}
		wait 200
		call Movetoloc "633.195435,-183.635925,290.366943"
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷        NAMED 1 - Ul'lugh the Divine        ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Ul'lugh the Divine")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-0.206306,-3.929445,-0.216120"
		call Movetoloc "1.750553,0.766725,-27.764765"
		call Movetoloc "27.752436,-0.664434,-27.278984"
		call Movetoloc "26.597778,1.660368,-56.155937"
		oc !c -ChangeCampSpotWho ${Me.Name} 25.690805 3.386666 -86.120743
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} 26.100599 3.116096 -76.886749
		call PostNamed
		call Movetoloc "25.690805,3.386666,-86.120743"
		call Movetoloc "40.896408,3.461453,-85.407684"
		;//Turning statue left
        eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} Turn Left
        wait 50
		call Movetoloc "26.505890,3.386666,-85.311691"
		call Movetoloc "26.849834,1.660368,-56.161098"
		call Movetoloc "41.125118,2.352704,-56.355965"
        call Obj_OgreUtilities.PreCombatBuff 5
		oc !c -ChangeCampSpotWho ${Me.Name} 78.649796 1.561739 -56.325443
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} 71.735992 1.561739 -56.398811
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call HandleNamed
        Obj_OgreIH:ChangeCampSpot["69.988365,1.561739,-56.440094"]
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷        NAMED 2 - Gruerg the Ravager        ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Gruerg the Ravager")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "25.773020,1.660368,-57.007988"
		call Movetoloc "25.582394,3.386666,-85.907021"
		oc !c -ChangeCampSpotWho ${Me.Name} 40.162640 3.438201 -85.325592
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		;//Turning statue right
        eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} Turn Right
        wait 50
		oc !c -ChangeCampSpotWho ${Me.Name} 25.582394 3.386666 -85.907021
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call Movetoloc "26.556128,6.020567,-118.285072"
		call Movetoloc "48.198521,6.014326,-121.560875"
		call Movetoloc "65.458557,6.328431,-121.339714"
		call Movetoloc "65.654282,6.014326,-94.917458"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "98.172371,5.983990,-95.572296"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 3 - Boss Riggledub          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Boss Riggledub")
	{	
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "64.363312,6.014325,-95.328102"
		call Movetoloc "62.733727,6.014326,-121.249809"
		call Movetoloc "36.515079,6.014326,-121.370743"
        call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "36.957115,6.014326,-143.800186"
		call Movetoloc "63.837364,6.014326,-144.710175"
		call Movetoloc "63.514088,6.014326,-170.989075"
        call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "64.034485,6.014326,-199.107361"
        call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "31.653305,6.014326,-199.091232"
		call PostNamed
		oc !c -ChangeCampSpotWho ${Me.Name} 23.952654 6.014326 -200.967987
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		;//Reading book
		oc !ci -special igw:${Me.Name}
		wait 30
		oc !ci -ReplyDialog all 1
		wait 10
		oc !ci -ReplyDialog all 1
		wait 10
		oc !ci -ReplyDialog all 1
		wait 10
		eq2execute summon
		wait 10
		oc !c -ChangeCampSpotWho ${Me.Name} 31.653305 6.014326 -199.091232
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call Movetoloc "64.486633,6.014326,-199.428162"
		call Movetoloc "63.839142,6.014326,-171.960922"
		call Movetoloc "68.840889,6.014326,-171.627197"
		;//Clearing first pack
        oc !c -Target ${Me.Name} ${Me.Name}
		oc !c -CampSpot ${Me.Name}
		oc !c -ChangeCampSpotWho ${Me.Name} 84.148666 6.014326 -173.253632
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -ChangeCampSpotWho ${Me.Name} 66.948174 6.014326 -171.199997
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -NoTarget
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 20
		;//Clearing second & third pack
        oc !c -Target ${Me.Name} ${Me.Name}
		oc !c -ChangeCampSpotWho ${Me.Name} 76.261948 6.014325 -171.991364
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -ChangeCampSpotWho ${Me.Name} 83.180382 5.968091 -138.984283
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
        oc !c -ChangeCampSpotWho ${Me.Name} 76.516212 6.014326 -171.520554
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -ChangeCampSpotWho ${Me.Name} 68.244850 6.014326 -171.384903
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		wait 10
		oc !c -NoTarget
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 20
		;//Placing left leg
		oc !c -ChangeCampSpotWho ${Me.Name} 96.247337 5.159418 -170.379776
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PrepareToPlaceItem "Golem Left Leg"
		wait 5
		oc !c -ChangeCampSpotWho ${Me.Name} 76.613029 5.976912 -157.671616
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PlaceItemNoChecks "Golem Left Leg" 145.715088
		wait 5
		;//Placing torso
		oc !c -ChangeCampSpotWho ${Me.Name} 85.071594 5.974303 -165.137344
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PrepareToPlaceItem "Golem Torso"
		wait 5
		oc !c -ChangeCampSpotWho ${Me.Name} 76.613029 5.976912 -157.671616
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PlaceItemNoChecks "Golem Torso" 145.715088
		wait 5
		;//Placing head
		oc !c -ChangeCampSpotWho ${Me.Name} 80.412338 5.946724 -159.909439
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 83.189507 5.929183 -148.421997
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PrepareToPlaceItem "Golem Head"
		wait 5
		oc !c -ChangeCampSpotWho ${Me.Name} 80.412338 5.946724 -159.909439
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 76.613029 5.976912 -157.671616
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PlaceItemNoChecks "Golem Head" 145.715088
		wait 5
		oc !c -ChangeCampSpotWho ${Me.Name} 78.420082 6.014325 -171.770721
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		wait 50
        call Obj_OgreUtilities.PreCombatBuff 5
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 50
		oc !c -ChangeCampSpotWho ${Me.Name} 65.824814 6.014326 -171.641998
		wait 50
		call HandleNamed	
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 4 - Cribblekeep            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named4(string _NamedNPC="Cribblekeep")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "63.911945,6.014326,-172.087418"
		call Movetoloc "63.816544,6.014326,-210.024567"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "66.310837,6.014326,-229.060501"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "31.277302,6.014320,-226.789719"
		OgreBotAPI:CastAbility_Relay["all","Bladedance"]
		wait 10
		call Movetoloc "8.616286,-1.110678,-227.083878"
		call Movetoloc "8.296995,-0.610674,-199.016739"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "-16.072323,-0.610680,-201.661804"
		call Movetoloc "-22.613546,-0.610677,-183.175278"
        call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 10
		oc !c -ChangeCampSpotWho ${Me.Name} -22.576735 -2.907978 -151.271423
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} -22.709127 -2.907920 -158.230179
		wait 5
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷            NAMED 5 - Lord Sasil            ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named5(string _NamedNPC="Lord Sasil")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		;//Pulling key mob
		eq2execute target an acolyte of the Whisperer
		call PostNamed
		call Movetoloc "-22.563339,-0.610677,-183.986954"
		call Movetoloc "-15.242858,-0.610680,-201.738358"

        if ${Actor["Waterlogged Kwagan Chest"](exists)} && ${Math.Distance[${Actor["Waterlogged Kwagan Chest"].Loc},-22.575294,-0.610676,-207.893311]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -22.575294 -0.610676 -207.893311
            call Obj_OgreUtilities.HandleWaitForCampSpot 30
            wait 30
            oc !c -ChangeCampSpotWho ${Me.Name} -15.242858 -0.610680 -201.738358
            call Obj_OgreUtilities.HandleWaitForCampSpot 30
        }

        if ${Actor["Waterlogged Kwagan Chest"](exists)} && ${Math.Distance[${Actor["Waterlogged Kwagan Chest"].Loc},-8.361300,-0.610684,-208.861282]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -8.361300 -0.610684 -208.861282
            call Obj_OgreUtilities.HandleWaitForCampSpot 30
            wait 30
            oc !c -ChangeCampSpotWho ${Me.Name} -15.242858 -0.610680 -201.738358
            call Obj_OgreUtilities.HandleWaitForCampSpot 30
        }

        if ${Actor["Waterlogged Kwagan Chest"](exists)} && ${Math.Distance[${Actor["Waterlogged Kwagan Chest"].Loc},-24.755901,-0.610675,-197.325806]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -24.755901 -0.610675 -197.325806
            call Obj_OgreUtilities.HandleWaitForCampSpot 30
            wait 30
            oc !c -ChangeCampSpotWho ${Me.Name} -15.242858 -0.610680 -201.738358
            call Obj_OgreUtilities.HandleWaitForCampSpot 30
        }

		call Movetoloc "-22.813227,-0.485674,-182.058609"
		call Movetoloc "-22.576735, -2.907978, -151.271423"
		call Movetoloc "-11.791109,-3.485674,-144.441956"
		;//Placing mirror
		oc !c -ChangeCampSpotWho ${Me.Name} -3.700830 -3.485674 -148.541946
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PrepareToPlaceItem "Shimmering Red Mirror"
		wait 5
		oc !c -ChangeCampSpotWho ${Me.Name} -11.671434 -3.202279 -138.684204
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		call PlaceItemNoChecks "Shimmering Red Mirror" 145.715088
		wait 5
		call Movetoloc "-5.281072,-3.485674,-143.881149"
		call Movetoloc "-11.947193,-3.235674,-133.167206"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "-10.907357,-3.235674,-112.177032"
		call Movetoloc "-42.351986,-3.235679,-111.768600"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "-72.161636,-1.860673,-112.056702"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "-105.233986,-1.860660,-111.621910"

        if ${Actor["Waterlogged Kwagan Chest"](exists)} && ${Math.Distance[${Actor["Waterlogged Kwagan Chest"].Loc},-111.342613,-1.895019,-123.814026]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -111.342613 -1.895019 -123.814026
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            wait 30
            oc !c -ChangeCampSpotWho ${Me.Name} -105.233986 -1.860660 -111.621910
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
        }

		;//Destroying wall
		call Movetoloc "-124.016075,-1.860660,-108.384819"
		oc !c -ApplyVerbForWho igw:${Me.Name} "fountain_wall_invisible" "Destroy Wall"
		wait 30
		;//Clicking orb
		call Movetoloc "-130.366241,-1.860660,-111.528465"
		oc !c -ApplyVerbForWho igw:${Me.Name} "sasil_door_switch" "Activate"
		wait 30
		
		call Movetoloc "-104.763084,-1.860660,-109.786011"
		call Movetoloc "-95.250328,-1.860667,-111.927559"
		call Movetoloc "-11.339293,-3.235674,-111.856049"
		call Movetoloc "-11.360100,-3.235667,-90.447067"
		call Movetoloc "-14.284431,-3.235661,-77.985710"
		call Movetoloc "-14.543860,-2.630536,-69.203461"
		call Obj_OgreUtilities.PreCombatBuff 5
		;//Spawning Sasil
		eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} Open Sasil's Coffin
		wait 30
		Ob_AutoTarget:AddActor["Lord Sasil's Head",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Lord Sasil's Ribcage",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Lord Sasil's Legs",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Lord Sasil's Arms",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Lord Sasil",0,FALSE,FALSE]
		call Movetoloc "-10.710526,-3.235661,-59.889481"
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷              NAMED 5 - Garudon              ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named6(string _NamedNPC="Garudon")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-4.464182,-3.235661,-72.453987"
		call Movetoloc "-11.785773,-3.235667,-89.101921"
		call Movetoloc "-11.756949,-3.235674,-111.592430"
		call Movetoloc "-73.382408,-1.860673,-111.680191"
		call Movetoloc "-73.391930,-2.189308,-84.995918"
		call Movetoloc "-73.735390,-2.946955,-67.665718"
		eq2execute target an enduring protector
		call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "-73.436981,-1.446954,-55.295662"
		eq2execute target an enduring protector
		call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "-73.441673,0.645194,-31.337099"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call PostNamed
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call PostNamed
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
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
            wait 30
            ;echo ${Time}: Looking down
            call Obj_OgreUtilities.Set_LookDown 30	
            wait 30
        }

        echo ${Time}: Picking up [${_actorName}]
        Actor["${_actorName.Escape}"]:DoubleClick
        wait 10
        ;echo ${Time}: Moving mouse to center of screen
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
    }	

    function PlaceItemNoChecks(string _actorName, float _heading)
    {
        ;echo ${Time}: Facing heading.
        Me:Face[${_heading}]
        wait 10

        ;echo ${Time}: Moving mouse to center of screen
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
        wait 10
        echo ${Time}: Placing [${_actorName}]
        Mouse:LeftClick    
        wait 10

        ;echo ${Time}: Reseting view
        call Obj_OgreUtilities.ResetCameraAngle
        ;call Obj_OgreUtilities.Set_ZoomOut

        wait 10
    }
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time} \agFinished auto-running ${sZoneName}
}
