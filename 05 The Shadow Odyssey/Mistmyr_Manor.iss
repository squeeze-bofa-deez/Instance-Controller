;================================================================================
; Title: Mistmyr Manor | Author: The Marty Party | Date: 24 Jan 2024 | Version: 1.0
;================================================================================

variable string sZoneShortName="exp05_dun_mistmoore_manor"
variable string sZoneName="Mistmyr Manor"

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
			; Load Ogre Instance Controller Assister - it handles the internal stuff.
            ogre ica
            wait 2
            /*
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
			*/
			echo ${Time} \agStarting to auto-run ${sZoneName} Version 1.0
			
			Obj_OgreIH:Actor_Click["To the Mistmyr Manor"]
			call Obj_OgreUtilities.HandleWaitForZoning
			call Obj_OgreIH.ZoneNavigation.GetIntoZone "${sZoneName}"
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }
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
			call This.Named1 "Phantom of Symphonia"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Phantom of Symphonia"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Ra'zul the Gallery Curator"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Ra'zul the Gallery Curator"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Rhul'maldis the Librarian"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Rhul'maldis the Librarian"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 4
		{
			call This.Named4 "Kristalin the Secretary"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Kristalin the Secretary"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 5
		{
			call This.Named5 "Sibia the Steward"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Sibia the Steward"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 6
		{
			call This.Named6 "Primogen Daishirou"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Primogen Daishirou"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
						
		;// Finish zone (zone out)
		if ${_StartingPoint} == 7
		{
            Obj_OgreIH:LetsGo
        	Ob_AutoTarget:Clear
			
			oc !c -cfw igw:${Me.Name} -Evac
			
			wait 50
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 50
			
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",FALSE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",FALSE]
			/*
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
			*/
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

	;// Phantom of Symphonia
    function:bool Named1(string _NamedNPC="Phantom of Symphonia")
	{
		echo Moving to Phantom of Symphonia
		Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["72.889755,-0.241319,0.127970"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["95.316177,1.417225,0.243114"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["130.715546,10.585276,-0.215772"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["174.204865,10.517553,-0.043021"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["174.843353,10.578419,-64.797745"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["174.966660,10.517538,-83.166779"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["175.080078,10.182070,-104.447548"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["175.586441,10.182067,-126.458405"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["175.278198,10.182072,-155.702499"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["177.231796,10.517543,-170.898773"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		call Obj_OgreIH.Get_Chest
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10		

        return TRUE
    }
	
	;// Ra'zul the Gallery Curator
    function:bool Named2(string _NamedNPC="Ra'zul the Gallery Curator")
	{
		echo Moving to Ra'zul the Gallery Curator
		Obj_OgreIH:ChangeCampSpot["175.533600,10.414883,-162.288620"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["175.334259,10.182074,-84.975357"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["148.842728,10.517552,-94.354874"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["148.097992,17.588560,-121.786819"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["145.576935,22.803297,-145.393631"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["131.635590,22.889044,-145.357330"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["122.816666,22.803282,-131.838287"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["80.971832,22.803288,-131.242020"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["48.295013,22.808729,-132.128891"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["36.130943,22.808729,-120.680000"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["35.808590,22.808729,-95.528564"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}	

		call Obj_OgreIH.Get_Chest
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10		

        return TRUE
    }
	
	;// Rhul'maldis the Librarian
    function:bool Named3(string _NamedNPC="Rhul'maldis the Librarian")
	{	
		echo Moving to Rhul'maldis the Librarian
		Obj_OgreIH:ChangeCampSpot["35.286964,22.808729,-124.894974"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["53.424301,22.808729,-133.804214"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["68.849518,22.803284,-132.284637"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["80.889229,22.803288,-132.371170"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["81.156685,22.447508,-186.992416"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["93.143196,22.447495,-205.176468"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		call Obj_OgreIH.Get_Chest
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10

        return TRUE
    }

	;// Kristalin the Secretary
    function:bool Named4(string _NamedNPC="Kristalin the Secretary")
	{	
		echo Moving to Kristalin the Secretary
		Obj_OgreIH:ChangeCampSpot["81.099365,22.622221,-223.400421"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["80.668152,22.803282,-255.280014"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["81.658051,22.803083,-285.819275"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["69.138138,22.803083,-294.846252"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["36.856422,22.803068,-294.703491"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["29.612865,22.803068,-316.645142"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["29.596317,22.854256,-326.632233"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["49.300056,22.901798,-333.591339"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["48.118523,24.588911,-348.243866"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["37.576645,25.524473,-351.502441"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}	

		call Obj_OgreIH.Get_Chest
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10		

        return TRUE
    }

	;// Sibia the Steward
    function:bool Named5(string _NamedNPC="Sibia the Steward")
	{	
		echo Moving to Sibia the Steward
		oc !c -cfw igw:${Me.Name} -Evac
		call Obj_OgreUtilities.HandleWaitForZoning

		Obj_OgreIH:ChangeCampSpot["46.845684,-0.563871,0.052942"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["72.889755,-0.241319,0.127970"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["130.715546,10.585276,-0.215772"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["174.204865,10.517553,-0.043021"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["174.843353,10.578419,-64.797745"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["175.106262,10.506819,-83.488983"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["200.354187,10.517552,-96.199120"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["203.345169,22.803293,-145.398148"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["227.640045,22.803282,-131.871841"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["250.048981,22.822065,-132.248901"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10		

		Obj_OgreIH:ChangeCampSpot["257.825745,22.822065,-146.999374"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["257.696777,22.682064,-173.912994"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["257.783508,29.765593,-205.308563"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["218.129120,29.765745,-205.102783"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["206.378479,29.765730,-217.954956"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["206.586914,29.774595,-242.582245"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["199.399765,29.774595,-255.983810"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Obj_OgreIH:ChangeCampSpot["176.628418,29.774595,-255.969864"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}	

		call Obj_OgreIH.Get_Chest
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10		

        return TRUE
    }

	;// Primogen Daishirou
    function:bool Named6(string _NamedNPC="Primogen Daishirou")
	{	
		echo Moving to Primogen Daishirou
		Obj_OgreIH:ChangeCampSpot["161.558563,29.774595,-255.848511"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10	

		;// Opening secret door
		oc !c -cfw igw:${Me.Name} -Zone
		wait 10

		Obj_OgreIH:ChangeCampSpot["162.738739,30.972837,-271.989319"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		oc !c -Jump
		call Obj_OgreUtilities.HandleWaitForGroupDistance 2
		wait 10	

		Obj_OgreIH:ChangeCampSpot["162.539536,32.258327,-291.269836"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		Obj_OgreIH:ChangeCampSpot["162.667969,31.992825,-309.005463"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		Ob_AutoTarget:AddActor["Primogen Daishirou",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Primogen Laenzuo",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		call Obj_OgreIH.Get_Chest
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 100		

        return TRUE
    }

	function CheckASpecificZone(string _ZoneName)
	{
		; Use a reference to shorten the typing!
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