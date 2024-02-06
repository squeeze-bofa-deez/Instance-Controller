;================================================================================
; Title: Emperor Atrebe's Laboratory: The Fabled City of Kor-sha | Author: Unknown, The Marty Party | Date: 06 Feb 2024 | Version: 2.1
;================================================================================

variable string sZoneShortName="exp05_dun_korsha"
variable string sZoneName="Emperor Atrebe's Laboratory: The Fabled City of Kor-sha"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
}

atom atexit()
{
	echo ${Time} \agFinished auto-running ${sZoneName}.
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
				Obj_OgreIH:Actor_Click["Atrebe's Laboratory: The Fabled City of Kor-sha"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time} \agStarting to auto-run ${sZoneName}. Version: 2.1
					
        	Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
		;	Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			call Obj_OgreIH.Set_PriestAscension FALSE
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "40"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
		;    _StartingPoint:Set[2]
		}
        
        if ${_StartingPoint} == 1
		{
			call This.Named1 "Sanedrac the Lost"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Sanedrac the Lost"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Selgrak the Monster"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Selgrak the Monster"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
        
		if ${_StartingPoint} == 3
		{
			call This.Named3 "Sannik the Unfinished"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Sannik the Unfinished"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 4
		{
			call This.Named4 "Guard Captain Kelkrin"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Guard Captain Kelkrin"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 5
		{
			call This.Named5 "Ka'El Ka'Vrish"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Ka'El Ka'Vrish"]
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

    ;//Sanedrac the Lost
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to Sanedrac the Lost
		Obj_OgreIH:SetCampSpot
        
		Obj_OgreIH:ChangeCampSpot["-0.509664,0.191354,22.057072"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["0.045302,0.253369,0.605926"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-0.123139,0.001696,-30.431061"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["36.288803,0.002499,-29.752007"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["36.175888,0.253369,-48.940434"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} 36.077972 0.065870 -65.810539
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} 36.175888 0.253369 -48.940434
        wait 10
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} 30.699076 2.978462 -75.535339
        wait 30
        oc !c -ChangeCampSpotWho ${Me.Name} 36.175888 0.253369 -48.940434
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} 39.928646 2.978462 -80.367096
        wait 30
        oc !c -ChangeCampSpotWho ${Me.Name} 36.175888 0.253369 -48.940434
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} 35.587910 2.978462 -94.185684
        wait 40
        oc !c -ChangeCampSpotWho ${Me.Name} 36.175888 0.253369 -48.940434
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["36.288803,0.002499,-29.752007"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        Obj_OgreIH:ChangeCampSpot["-0.123139,0.001696,-30.431061"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-36.402775,0.002499,-29.767525"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-36.247494,0.253369,-48.416641"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} -36.033733 0.065871 -65.078514
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -36.247494 0.253369 -48.416641
        wait 10
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} -30.398510 2.978462 -82.811432
        wait 40
        oc !c -ChangeCampSpotWho ${Me.Name} -36.247494 0.253369 -48.416641
        wait 40
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

		Obj_OgreIH:ChangeCampSpot["-29.903383,2.978462,-95.199738"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-29.841013,2.978462,-104.627182"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        ;//Moving bard to west switch
        echo ${Time}: Moving Bard to West Switch
        oc !c -ChangeCampSpotWho ${Me.Name} -36.006927 3.197286 -108.145935
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 30
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard -36.194778 3.065872 -73.196625
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 60
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard -36.240696 0.002500 -30.286879
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 50
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard 36.941643 0.002500 -30.099033
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 90
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard 35.768364 2.978462 -75.053528
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 50
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard 35.777905 3.190902 -108.047997
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 30

        echo ${Time}: Activating switches
        oc !c -ApplyVerbForWho igw:${Me.Name}+Bard "west swtich" "Activate Lever"
        oc !c -ApplyVerbForWho ${Me.Name} "east switch" "Activate Lever"
        wait 30

        echo ${Time}: Moving Bard back to group
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard 36.530151 0.002500 -29.931740
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 120
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard -36.262260 0.002499 -29.650927
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 90
        oc !c -ChangeCampSpotWho igw:${Me.Name}+Bard -35.907864 3.065872 -73.540390
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 60

		Obj_OgreIH:ChangeCampSpot["-29.899996,2.978462,-103.793633"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 50

		Obj_OgreIH:ChangeCampSpot["-36.071304,3.065872,-73.317169"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-36.128223,0.002500,-29.970507"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["0.132091,0.001770,-30.206438"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["0.126224,0.064545,-66.562271"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 30

        oc !c -CampSpot igw:${Me.Name}
        oc !c -ChangeCampSpotWho ${Me.Name} -0.068307 -3.344395 -103.658615
        wait 10
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} 0.434762 -3.344395 -94.658348
        wait 30
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}"
		wait 50
		eq2execute summon
		wait 20
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
        
        ;//Activate Lift
        echo ${Time}: Activating Lift
        oc !c -ApplyVerbForWho ${Me.Name} "upper lift activator" "activate lift"
        wait 210

        return TRUE
    }
	
    ;//Selgrak the Monster
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{      
        echo ${Time}: Moving to Selgrak the Monster
		Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["11.175171,-35.385227,-99.565765"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
        eq2execute summon
        wait 10

		Obj_OgreIH:ChangeCampSpot["45.935589,-33.035831,-99.715317"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["45.699024,-32.973331,-126.375397"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["46.094616,-36.035831,-162.034546"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["6.420593,-39.035831,-161.494171"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["6.769110,-39.035828,-138.672409"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-21.125322,-39.035831,-138.639694"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-21.342813,-40.432961,-173.099319"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-21.518049,-41.785831,-217.083679"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-15.257875,-43.478794,-227.999207"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-28.731247,-43.478794,-226.799118"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-28.316702,-43.478794,-240.666412"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-46.478542,-43.526646,-240.015808"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-46.022682,-43.526646,-263.849030"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-97.669907,-43.526642,-263.157471"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-97.575104,-43.526646,-232.825150"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-129.478363,-52.529140,-233.036346"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-130.849289,-57.755230,-212.049957"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} -106.742874 -57.754002 -223.513733
        wait 30
        oc !c -ChangeCampSpotWho ${Me.Name} -130.847107 -57.754028 -212.049973
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} -90.527626 -57.754002 -221.296906
        wait 30
        oc !c -ChangeCampSpotWho ${Me.Name} -130.847107 -57.754028 -212.049973
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat

		Obj_OgreIH:ChangeCampSpot["-93.976463,-57.754002,-220.142120"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-98.438782,-57.754002,-212.083435"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} -72.338631 -57.754002 -222.804626
        wait 30
        oc !c -ChangeCampSpotWho ${Me.Name} -98.432800 -57.754002 -212.075485
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
        oc !c -ChangeCampSpotWho ${Me.Name} -75.449051 -58.317387 -242.140457
        wait 40
        oc !c -ChangeCampSpotWho ${Me.Name} -98.432800 -57.754002 -212.075485
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        ;// Setup for Named
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} -75.074188 -58.317387 -230.713516
        oc !c -ChangeCampSpotWho ${Me.Name} -69.636421 -58.317387 -236.374908
        wait 30
        ;OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 30
        ;Ob_AutoTarget:AddActor["creation",0,FALSE,FALSE]
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20

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
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat

        eq2execute summon
        wait 30
		call Obj_OgreUtilities.WaitWhileGroupMembersDead

        return TRUE
    }
	
    ;//Sannik the Unfinished
    function:bool Named3(string _NamedNPC="Doesnotexist")
	{	
        echo ${Time}: Moving to Sannik the Unfinished
		Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["-72.315987,-57.754002,-250.328491"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-72.131210,-57.733051,-288.667328"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-72.128754,-53.276615,-316.824768"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-95.002296,-53.026615,-315.911530"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        ;// Setup for Named
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 30
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} -118.576202 -53.333866 -315.893066
        oc !c -ChangeCampSpotWho ${Me.Name} -135.011765 -54.277958 -316.154846
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 30

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

        if ${Me.InCombat}
        {
            ;wait 20
            ;oc !c -ClearCampSpot igw:${Me.Name}
            while ${Me.InCombat}
                waitframe
        }

        Obj_OgreIH:SetCampSpot
        eq2execute summon
        wait 30
		call Obj_OgreUtilities.WaitWhileGroupMembersDead

        return TRUE
    }

    ;//Guard Captain Kelkrin
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to Captain Kelkrin
		Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["-117.578850,-53.276997,-316.170410"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-71.660591,-53.276615,-316.122192"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-72.376396,-57.589691,-266.122406"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-70.790672,-57.269016,-209.943359"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-71.661079,-57.776646,-194.342865"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-99.782013,-57.776646,-194.672363"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        echo ${Time}: Waiting 30 seconds for roamer
		wait 300

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		oc !c -ChangeCampSpotWho ${Me.Name} -96.628868 -60.817356 -157.104919
        wait 35
        oc !c -ChangeCampSpotWho ${Me.Name} -98.552040 -57.776646 -194.494644
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		oc !c -ChangeCampSpotWho ${Me.Name} -98.514572 -60.817356 -160.665421
        wait 30
        oc !c -ChangeCampSpotWho ${Me.Name} -85.067238 -60.817356 -148.929428
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -98.514572 -60.817356 -160.665421
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -98.552040 -57.776646 -194.494644
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
 		oc !c -ChangeCampSpotWho ${Me.Name} -98.514572 -60.817356 -160.665421
        wait 35
        oc !c -ChangeCampSpotWho ${Me.Name} -109.289032 -60.817356 -156.440369
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -98.514572 -60.817356 -160.665421
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -98.552040 -57.776646 -194.494644
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10
 
        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
  		oc !c -ChangeCampSpotWho ${Me.Name} -98.514572 -60.817356 -160.665421
        wait 35
        oc !c -ChangeCampSpotWho ${Me.Name} -108.518211 -61.116192 -146.012512
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -98.514572 -60.817356 -160.665421
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -98.552040 -57.776646 -194.494644
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10
 
 		Obj_OgreIH:ChangeCampSpot["-98.582779,-60.817356,-157.508713"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

 		Obj_OgreIH:ChangeCampSpot["-113.749382,-60.817356,-147.896515"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

 		Obj_OgreIH:ChangeCampSpot["-113.982140,-60.817356,-136.680267"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        ;// Setup for Named
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 30
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} -102.138275 -60.817356 -131.641006
        oc !c -ChangeCampSpotWho ${Me.Name} -95.998306 -60.817356 -129.419281
        wait 10
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

        wait 100
        if ${Me.InCombat}
        {
            while ${Me.InCombat}
                waitframe
        }	

        eq2execute summon
        wait 30
		call Obj_OgreUtilities.WaitWhileGroupMembersDead

        return TRUE
    }

    ;//Ka'El Ka'Vrish
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to Ka'El Ka'Vrish
		Obj_OgreIH:SetCampSpot

 		oc !c -ChangeCampSpotWho ${Me.Name} -91.164131 -60.817356 -125.042747
        wait 20
        echo ${Time}: Activating switch
        oc !c -ApplyVerbForWho ${Me.Name} "hall switch 01" "Activate Lever"
        wait 60

        Obj_OgreIH:ChangeCampSpot["-102.138275, -60.817356, -131.641006"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-116.629669,-60.817356,-138.114487"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-98.567207,-60.817356,-159.379532"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-98.957588,-57.776646,-194.746246"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-121.075211,-57.776646,-194.646805"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-165.485840,-60.714146,-194.568207"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-207.536362,-72.026611,-194.646240"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-207.359726,-72.026611,-170.681519"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		oc !c -ChangeCampSpotWho ${Me.Name} -216.139694 -72.026611 -170.624435
        wait 10
        oc !c -ChangeCampSpotWho ${Me.Name} -207.359726 -72.026611 -170.681519
        wait 10
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
 		oc !c -ChangeCampSpotWho ${Me.Name} -224.456360 -71.658150 -166.918793
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -207.359726 -72.026611 -170.681519
        wait 20
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10
 
        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
 		oc !c -ChangeCampSpotWho ${Me.Name} -224.596558 -71.658150 -173.413620
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -207.359726 -72.026611 -170.681519
        wait 20
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-229.438278, -71.803078, -170.136688"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
 		oc !c -ChangeCampSpotWho ${Me.Name} -260.670349 -60.159058 -161.288498
        wait 30
        oc !c -ChangeCampSpotWho ${Me.Name} -229.438278 -71.803078 -170.136688
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
 		oc !c -ChangeCampSpotWho ${Me.Name} -259.786560 -60.161293 -178.512436
        wait 30
        oc !c -ChangeCampSpotWho ${Me.Name} -229.438278 -71.803078 -170.136688
        wait 30
        eq2execute Target_None
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-244.824249,-70.909058,-170.022903"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-260.755951,-60.159061,-161.745895"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-268.965027,-58.821995,-145.723953"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

        Obj_OgreIH:ChangeCampSpot["-268.441650,-58.824028,-145.722260"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 100

        ;// Setup for Named
        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
        wait 5
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20

        if !${Target.Name.Equal["${_NamedNPC}"]}
        {
            while !${Target.Name.Equal["${_NamedNPC}"]}
                waitframe
        }

        wait 20
        if ${Me.InCombat}
        {
            wait 270
            OgreBotAPI:CastAbility_Relay["all","Bladedance"]
            while ${Me.InCombat}
                waitframe
        }

        wait 10
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        wait 10
        eq2execute summon
        wait 30
		
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
}
