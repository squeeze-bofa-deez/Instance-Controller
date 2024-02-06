;================================================================================
; Title: The Deep Forge | Author: Unknown, The Marty Party | Date: 06 Feb 2024 | Version: 2.1
;================================================================================

variable string sZoneShortName="exp05_dun_najena_forge"
variable string sZoneName="The Deep Forge"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
}

atom atexit()
{
	echo ${Time} \agFinished auto-running ${sZoneName}
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
				Obj_OgreIH:Actor_Click["To the Deep Forge"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time} \agStarting to auto-run ${sZoneName} Version 2.1
			
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
		;	Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			call Obj_OgreIH.Set_PriestAscension FALSE
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "30"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
		;	 _StartingPoint:Set[3]
		}

        if ${_StartingPoint} == 1
		{
			call This.Named1 "The Doomsmith"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: The Doomsmith"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Cruhm the Overseer"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Cruhm the Overseer"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Firelord Kaern"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Firelord Kaern"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
						
		;// Finish zone (zone out)
		if ${_StartingPoint} == 4
		{
            Obj_OgreIH:LetsGo
        	Ob_AutoTarget:Clear
			
			oc !c -cfw igw:${Me.Name} -Evac
			
			wait 50
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 50
			
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",FALSE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",FALSE]
			
			;Check if the zone can be reset.
			call This.CheckZoneResetStatus
			if !${Return}
            {             
                return FALSE
            }
			;Reset the zone
			call This.ResetZone
			if !${Return}
            {                
                return FALSE
            }		
			
			_StartingPoint:Inc
		}

        return TRUE
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
			;	echo ${Time}: Time remaining until reset: [${Math.Calc[${iZoneResetTime}-${Time.Timestamp}].Int} seconds] [${Math.Calc[(${iZoneResetTime}-${Time.Timestamp})/60].Int} minutes]
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
			;I need to zone out before I can reset.
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

    ;// The Doomsmith
    function:bool Named1(string _NamedNPC="The Doomsmith")
	{
        echo ${Time}: Moving to The Doomsmith
        Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["-0.182265,0.248425,17.427681"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		Obj_OgreIH:ChangeCampSpot["-0.019754,-0.012134,2.710859"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		Obj_OgreIH:ChangeCampSpot["20.549860,-0.013526,-17.303701"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		Obj_OgreIH:ChangeCampSpot["81.355003,-0.011860,-17.217703"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		Obj_OgreIH:ChangeCampSpot["91.660767,-0.012768,-24.664829"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]

        echo ${Time}: Targeting The Doomsmith
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

		eq2execute summon
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10		

		Obj_OgreIH:ChangeCampSpot["98.560852,-0.012102,-13.213036"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		Obj_OgreIH:ChangeCampSpot["123.059608,-0.075221,-7.753498"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		Obj_OgreIH:ChangeCampSpot["98.560852,-0.012102,-13.213036"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		Obj_OgreIH:ChangeCampSpot["98.945412,-0.180752,10.405434"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		call This.LightSymbols
        wait 10

		Obj_OgreIH:ChangeCampSpot["98.560852,-0.012102,-13.213036"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        return TRUE
    }
	
    ;// Moving to Cruhm the Overseer
    function:bool Named2(string _NamedNPC="Cruhm the Overseer")
	{
        echo ${Time}: Moving to Cruhm the Overseer

        Obj_OgreIH:ChangeCampSpot["88.166931,-0.012596,-21.989454"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["94.788567,-0.012841,-28.860525"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["94.510704,-0.013208,-41.420620"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["46.214401,-0.011687,-40.766457"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["46.100143,-0.011716,-56.930828"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["15.022519,-0.012110,-56.115490"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-0.286157,-0.012164,-52.005543"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Bladedance"]

        echo ${Time}: Targeting Cruhm the Overseer
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}	

		eq2execute summon
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10	

        return TRUE
    }
	
    ;// Moving to key mob, and then Firelord Kaern
    function:bool Named3(string _NamedNPC="Firelord Kaern")
	{	
        echo ${Time}: Moving to Key Mob

        Obj_OgreIH:ChangeCampSpot["-13.263605,-0.012539,-56.135853"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-61.828945,-0.011542,-56.402603"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-61.873444,-0.012191,-40.735512"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-94.626610,-0.013182,-41.200150"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-93.850182,-0.013011,-29.103508"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-88.085571,-0.012650,-22.572660"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-110.180786,-0.012134,0.707989"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        echo ${Time}: Targeting Key Mob
		Ob_AutoTarget:AddActor["A Spurned alumnus",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "A Spurned alumnus"
        wait 10

		eq2execute summon
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10		

        echo ${Time}: Moving to Firelord Kaern

        Obj_OgreIH:ChangeCampSpot["-87.866493,-0.012590,-21.579208"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-94.062172,-0.012964,-28.701242"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-93.894867,-0.012919,-60.121716"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-83.718857,-0.013243,-70.531822"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-83.811188,-0.011959,-82.851768"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-41.701885,-0.012134,-82.518555"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-33.310436,-0.012528,-91.014412"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["0.537980,-0.012134,-90.703270"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["0.062599,0.151278,-138.372253"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["60.507732,0.151276,-139.775864"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["73.616936,0.136414,-170.310928"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        ;Valve #1
		echo ${Time}: Turning First Valve
		wait 20
		oc !c -Special igw:${Me.Name}
		wait 30
		
        Obj_OgreIH:ChangeCampSpot["53.757904,0.151276,-138.684204"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-60.632744,0.151316,-138.114487"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-75.227295,0.145558,-170.311768"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        ;Valve #2
        echo ${Time}: Turning Second Valve
		wait 20
		oc !c -Special igw:${Me.Name}
		wait 30
		
        Obj_OgreIH:ChangeCampSpot["-69.211021,0.142958,-170.154831"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-68.722916,0.151414,-209.492691"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-23.468472,0.131852,-208.249542"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10
		
		echo ${Time}: Waiting 60 seconds to make sure that I kill the roaming mobs before attacking the Firelord.
		wait 600

        Obj_OgreIH:ChangeCampSpot["-0.030367,0.131676,-206.023895"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]

        echo ${Time}: Targeting Firelord Kaern
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}	

		eq2execute summon
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10	

		echo ${Time}: Getting Shard Chest	

        Obj_OgreIH:ChangeCampSpot["0.064602,0.130779,-201.633789"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["22.435240,0.168024,-231.373627"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["14.985910,0.150439,-244.052109"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["21.074968,0.126586,-227.150146"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-21.131712,0.166967,-227.530746"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        Obj_OgreIH:ChangeCampSpot["-17.594692,0.169770,-243.171082"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        return TRUE
    }

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

    function LightSymbols()
	{
		variable point3f DF_FirstSymbolLocation="112.348305,-0.012104,15.766435"
		variable point3f DF_SecondSymbolLocation="117.842834,-0.012104,-13.940908"
		variable point3f DF_ThirdSymbolLocation="109.134857,-0.422464,-9.154116"
		variable point3f DF_FourthSymbolLocation="101.070633,-0.422465,-1.808460"
		variable point3f DF_FifthSymbolLocation="125.428520,-0.012312,2.367479"

		;Move to first symbol
		oc !c -CampSpot ${Me.Name}
		oc !c -ChangeCampSpotWho ${Me.Name} ${DF_FirstSymbolLocation.X} ${DF_FirstSymbolLocation.Y} ${DF_FirstSymbolLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 50
		call This.ClickSymbol
		
		;Move to second symbol
		oc !c -ChangeCampSpotWho ${Me.Name} ${DF_FifthSymbolLocation.X} ${DF_FifthSymbolLocation.Y} ${DF_FifthSymbolLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 50
		oc !c -ChangeCampSpotWho ${Me.Name} ${DF_SecondSymbolLocation.X} ${DF_SecondSymbolLocation.Y} ${DF_SecondSymbolLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 50
		call This.ClickSymbol
		
		;Move to third symbol
		oc !c -ChangeCampSpotWho ${Me.Name} ${DF_ThirdSymbolLocation.X} ${DF_ThirdSymbolLocation.Y} ${DF_ThirdSymbolLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 50		
		call This.ClickSymbol
		
		;Move to fourth symbol
		oc !c -ChangeCampSpotWho ${Me.Name} ${DF_FourthSymbolLocation.X} ${DF_FourthSymbolLocation.Y} ${DF_FourthSymbolLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 50		
		call This.ClickSymbol
		
		;Move to fifth symbol
		oc !c -ChangeCampSpotWho ${Me.Name} ${DF_SecondSymbolLocation.X} ${DF_SecondSymbolLocation.Y} ${DF_SecondSymbolLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 50
		oc !c -ChangeCampSpotWho ${Me.Name} ${DF_FifthSymbolLocation.X} ${DF_FifthSymbolLocation.Y} ${DF_FifthSymbolLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 50		
		call This.ClickSymbol
		wait 50
		oc !c -ChangeCampSpotWho ${Me.Name} ${DF_SecondSymbolLocation.X} ${DF_SecondSymbolLocation.Y} ${DF_SecondSymbolLocation.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Obj_OgreUtilities.HandleWaitForCombat 40
		wait 50
	}
	
	function ClickSymbol()
	{
		variable index:actor Index
		variable iterator Iter
		
		EQ2:GetActors[Index,range,15]
		Index:GetIterator[Iter]
			
		if ${Iter:First(exists)}
		{
			do
			{
				;;Find the symbol. You should be closer than 15m to it.
				if ${Iter.Value.Type.Equals["NoKill NPC"]} && ${Iter.Value.Interactable}
				{
					Actor[id,${Iter.Value.ID}]:DoubleClick	
					wait 30
				
					break
				}
			}
			while ${Iter:Next(exists)}
		}	
	}
}
