;================================================================================
; Title: Miragul's Phylactery: Scion of Ice | Author: The Marty Party | Date: 24 Feb 2024 | Version: 1.0
;================================================================================

variable string sZoneShortName="exp05_dun_miragul_upper"
variable string sZoneName="Miragul's Phylactery: Scion of Ice"
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
				Obj_OgreIH:Actor_Click["Miragul's Phylactery"]
                wait 10
                oc !c -Door 1 ${Me.Name}
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time} \agStarting to auto-run ${sZoneName}. Version: 1.0
					
        	Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "40"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
		    ;_StartingPoint:Set[3]
		}
        
        if ${_StartingPoint} == 1
		{
			call This.Named1 "Reverie"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Reverie"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Ankhef"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Ankhef"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
        
		if ${_StartingPoint} == 3
		{
			call This.Named3 "Chaotic Manipulation"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Chaotic Manipulation"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
        
        if ${_StartingPoint} == 4
		{
			call This.Named4 "Arcanus"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Arcanus"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}            

        if ${_StartingPoint} == 5
		{
			call This.Named5 "Shade of Miragul"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Shade of Miragul"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}  

		;//Finish zone (zone out)
		if ${_StartingPoint} == 6
		{
            Obj_OgreIH:LetsGo
        	eq2execute Target_None
            call Movetoloc "-1.625144,0.001711,6.668996"
			
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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷              NAMED 1 - Reverie              ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Aimedaca")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-0.541581,0.001711,15.108317"
        call Movetoloc "-10.890800,0.001818,0.310419"
        call Movetoloc "-29.449518,1.269773,-3.786092"
        call Movetoloc "-53.875248,1.269770,-3.778845"
        call Movetoloc "-52.658836,1.883107,-16.726833"
        call Movetoloc "-63.402390,2.496442,-24.402199"
        call Movetoloc "-78.052353,2.496442,-31.019833"
        call Movetoloc "-88.367668,2.496442,-24.650827"
        call Movetoloc "-103.060257,2.458861,-24.937193"
        call Movetoloc "-117.759377,2.043571,-24.482954"
        call Movetoloc "-156.321671,-6.452504,-18.802517"
        call Movetoloc "-161.272949,-9.189548,-4.399294"
        oc !c -ApplyVerbForWho ${Me.Name} "Door 1a" "use"
        wait 10
        call Movetoloc "-161.812653,-10.314120,7.916410"
        call Movetoloc "-181.543427,-10.314120,16.101486"
        call Movetoloc "-193.915726,-10.314120,34.954544"
        call Movetoloc "-162.489807,-9.878519,33.959774"
        eq2execute target an envisaged Frostthorn
        wait 30
        call PostNamed
        eq2execute target an envisaged Frostthorn
        wait 30
        call PostNamed
        wait 20
        call PostNamed
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 40
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷              NAMED 2 - Ankhef              ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Xorlac the Cleanser")
	{        
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-196.218216,-10.314120,35.082336"
        oc !c -ApplyVerbForWho ${Me.Name} "Door 2a" "use"
        wait 10
        call Movetoloc "-223.194641,-10.397987,35.786819"
        call Movetoloc "-222.619827,-10.273572,53.324745"
        oc !c -ApplyVerbForWho ${Me.Name} "Door 3a" "use"
        wait 10
        call Movetoloc "-222.246780,-10.005472,65.398895"
        call Movetoloc "-200.252182,-9.808525,94.335777"
        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		oc !c -ChangeCampSpotWho ${Me.Name} -214.498581 -9.837049 106.806755
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} -200.252182 -9.808525 94.335777
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        eq2execute Target_None
        call Obj_OgreUtilities.HandleWaitForCombat 40
		oc !c -ChangeCampSpotWho ${Me.Name} -172.556046 -10.010897 103.783150
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} -173.913208 -10.255459 84.675949
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        Ob_AutoTarget:AddActor["Zaza",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 3 - Chaotic Manipulation       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="The Master")
	{	
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-172.556046,-10.010897,103.783150"
        call Movetoloc "-222.355682,-10.181142,67.797562"
        call Movetoloc "-222.458511,-10.018991,62.317394"
        oc !c -ApplyVerbForWho ${Me.Name} "Door 3a" "use"
        wait 10
        call Movetoloc "-222.415848,-10.428232,34.548561"
        call Movetoloc "-202.575912,-10.193995,34.988293"
        oc !c -ApplyVerbForWho ${Me.Name} "Door 2a" "use"
        wait 10
        call Movetoloc "-169.689255,-9.878519,36.005611"
        call Movetoloc "-161.185135,-10.423732,3.369061"
        oc !c -ApplyVerbForWho ${Me.Name} "Door 1a" "use"
        wait 10
        call Movetoloc "-160.714905,-7.114906,-18.476700"
        call Movetoloc "-122.186707,1.633296,-24.620428"
        call Movetoloc "-93.725899,1.981664,-24.716747"
        call Movetoloc "-85.996452,2.496442,-24.678911"
        call Movetoloc "-76.671677,2.496442,-18.244125"
        call Movetoloc "-63.233181,2.496442,-24.936110"
        call Movetoloc "-52.164303,1.883107,-10.806397"
        call Movetoloc "-59.978382,1.269770,-0.119502"
        call Movetoloc "-52.841492,1.883106,11.891347"
        call Movetoloc "-45.795612,2.189773,24.827248"
        call Movetoloc "-49.675545,1.883103,55.459595"
        call Movetoloc "-60.830917,2.189769,46.532120"
        call Movetoloc "-76.338226,3.375367,41.944027"
        call Movetoloc "-108.161469,15.376448,42.682194"
        call Movetoloc "-119.514511,15.069776,46.903496"
        call Movetoloc "-148.751373,14.121610,46.565170"
        Ob_AutoTarget:AddActor["a suppressed evocation",0,FALSE,FALSE]
        Ob_AutoTarget:AddActor["a suppressed conjuration",0,FALSE,FALSE]
        Ob_AutoTarget:AddActor["a suppressed abjuration",0,FALSE,FALSE]
        Ob_AutoTarget:AddActor["a suppressed subjugation",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷              NAMED 4 - Arcanus             ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named4(string _NamedNPC="Codexicon")
	{	       
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-141.023422,13.938706,66.285805"
        call Movetoloc "-141.124359,14.149778,71.538986"
        call Movetoloc "-148.612915,14.456449,82.114601"
        call Movetoloc "-164.285019,14.763113,76.235176"
        call Movetoloc "-175.095383,14.763112,82.678604"
        call Movetoloc "-187.271057,14.763112,83.093628"
        call Movetoloc "-207.010635,14.301663,66.541092"
        call Movetoloc "-220.445129,14.301664,52.315083"
        Ob_AutoTarget:AddActor["a frozen thought",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        call Movetoloc "-207.010635,14.301663,66.541092"
        call Movetoloc "-196.490051,14.301663,50.150997"
        call Movetoloc "-196.722107,14.454542,32.118267"
		oc !c -ChangeCampSpotWho ${Me.Name} -190.812515 14.301663 29.665163
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -ApplyVerbForWho ${Me.Name} "Torn Piece of Scroll" "Retrieve"
        wait 20
		oc !c -ChangeCampSpotWho ${Me.Name} -196.722107 14.454542 32.118267
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Movetoloc "-196.745499,14.301664,48.987103"
        call Movetoloc "-208.183624,14.301663,86.382767"
        call Movetoloc "-207.939377,14.388463,122.160538"
		oc !c -ChangeCampSpotWho ${Me.Name} -210.472260 14.301664 128.557327
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        oc !c -ApplyVerbForWho ${Me.Name} "Torn Piece of Scroll" "Retrieve"
        wait 20
		oc !c -ChangeCampSpotWho ${Me.Name} -207.939377 14.388463 122.160538
		call Obj_OgreUtilities.HandleWaitForCampSpot 20

        if ${Actor["A Chest of Tangible Memories"](exists)} && ${Math.Distance[${Actor["A Chest of Tangible Memories"].Loc},-215.068771,14.301664,125.451965]} <= 5
        {
            oc !c -ChangeCampSpotWho igw:${Me.Name} -215.068771 14.301664 125.451965
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            wait 10
            oc !c -ChangeCampSpotWho ${Me.Name} -207.939377 14.388463 122.160538
		    call Obj_OgreUtilities.HandleWaitForCampSpot 20
        }

        call Movetoloc "-208.511276,14.389562,96.087181"
        call Movetoloc "-208.452713,14.301663,87.255341"
        call Movetoloc "-196.830002,14.301663,74.161156"
        oc !c -ApplyVerbForWho ${Me.Name} "Scroll Case" "Restore the Scroll"
        wait 50
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30
        call HandleNamed
        return TRUE
    }  

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 5 - Shade of Miragul         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named5(string _NamedNPC="Codexicon")
	{	       
        echo ${Time}: Moving to ${_NamedNPC}
        oc !c -cfw igw:${Me.Name} -Evac
		call Obj_OgreUtilities.HandleWaitForZoning
		call Movetoloc "6.775850,0.119773,14.063847"
		oc !c -ChangeCampSpotWho ${Me.Name} 11.200642 0.343922 -2.196721
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
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
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time} \agFinished auto-running ${sZoneName}.
}
