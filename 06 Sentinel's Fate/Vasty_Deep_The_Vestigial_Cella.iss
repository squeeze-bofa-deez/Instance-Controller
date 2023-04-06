variable string sZoneName="Vasty Deep: The Vestigial Cella"
variable string sZoneShortName="exp06_dun_vastydeep03"

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
}
atom atexit()
{
	echo ${Time}: ${Script.Filename} done
}
objectdef Object_Instance
{
	function:bool RunInstance(int _StartingPoint=0)
	{
    	if ${_StartingPoint} == 0
		{
			call Obj_OgreIH.ZoneNavigation.GetIntoZone "${sZoneName}"
			if !${Return}
			{

             Obj_OgreIH:Actor_Click["zone_to_vastydeep03"]
			 call Obj_OgreUtilities.HandleWaitForZoning
			 Ogre_Instance_Controller:ZoneSet
			 call Obj_OgreIH.Set_VariousOptions
			 call Obj_OgreIH.Set_PriestAscension FALSE
			 Obj_OgreIH:Set_NoMove
			 Obj_OgreIH:SetCampSpot
			 call Obj_OgreUtilities.PreCombatBuff 5
			 _StartingPoint:Inc
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}
			Ogre_Instance_Controller:ZoneSet
			call Obj_OgreIH.Set_VariousOptions
			call Obj_OgreIH.Set_PriestAscension FALSE
			Obj_OgreIH:Set_NoMove
			Obj_OgreIH:SetCampSpot
			call Obj_OgreUtilities.PreCombatBuff 5
			_StartingPoint:Inc

			;Delete the following if you don't want them.
			;oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_cure TRUE TRUE
			;oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_crowdcontrol FALSE TRUE
			;oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_facenpc TRUE TRUE
            oc !ci -ChangeOgreBotUIOption ${Me.Name} checkbox_autotarget_outofcombatscanning FALSE
			;relay all eq2execute merc ranged
			;relay all eq2execute merc backoff
			OgreIH:Set_Debug_Mode[TRUE]

		Change starting point below to start script after a certain named. (for debugging only)		
			_StartingPoint:Set[0]
			_StartingPoint:Inc
		}

		;Enter name and shinies nav point for Named 1.
		if ${_StartingPoint} == 1
		{
			call This.Named1 "The Wight Specter"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1:The Wight Specter"]
				return FALSE
			}
            _StartingPoint:Inc
		}

		;Enter name and shinies nav point for Named 2.
		if ${_StartingPoint} == 2
		{
			call This.Named2 "Ecto Malgum"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2:Ecto Malgum"]
				return FALSE
			}
            _StartingPoint:Inc
		}

		;Enter name and shinies nav point for Named 3.				
		if ${_StartingPoint} == 3
		{
			call This.Named3 "Crystasha"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3:Crystasha"]
				return FALSE
			}
            _StartingPoint:Inc
		}

		;Enter name and shinies nav point for Named 4.	
		if ${_StartingPoint} == 4
		{	
			call This.Named4 "Judithania"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4:Judithania"]
				return FALSE
			}
            _StartingPoint:Inc
		}

		;Enter name and shinies nav point for Named 5.
		if ${_StartingPoint} == 5
		{
			call This.Named5 "Kraitenae"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5:Kraitenae"]
				return FALSE
			}
            _StartingPoint:Inc
		}

		;Enter name and shinies nav point for Named 6.
		if ${_StartingPoint} == 6
		{
			call This.Named6 "Queen Gwarthlea"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#6:Queen Gwarthlea"]
				return FALSE
			}
            _StartingPoint:Inc
		}

		;Enter /loc for the zone out and change _StartingPoint == 4 for Event Heroic	
		if ${_StartingPoint} == 7
		{
			 Obj_OgreIH:SetCampSpot
            echo Evacing
			oc !c -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 15000
			oc !c -Resume
            Obj_OgreIH:SetCampSpot
			Obj_OgreIH:ChangeCampSpot["12.436484,-11.874793,8.164172"]
			call Obj_OgreUtilities.HandleWaitForCampSpot 10
			oc !c -Zone
			wait 10
			oc !c all -door 1
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 100
			call Obj_OgreIH.ZoneNavigation.ZoneOut
			wait 10
			relay all OgreBotAPI:ZoneResetAll
			wait 100
			relay all OgreBotAPI:ResetZone["Vasty Deep: The Vestigial Cella"]
			wait 50
			relay all OgreBotAPI:ZoneResetAll
			wait 100
			relay all OgreBotAPI:ResetZone["Vasty Deep: The Vestigial Cella"]
			wait 50
			relay all OgreBotAPI:ZoneResetAll
			wait 100
            Obj_OgreIH:ClearCampSpot
		    OgreBotAPI:ZoneResetAll
			wait 50
			OgreBotAPI:ResetZone["Vasty Deep: The Vestigial Cella"]
			wait 50
			OgreBotAPI:resume["${Me.Name}"]
            wait 10
            Obj_OgreIH:SetCampSpot
			wait 10   
			relay all OgreBotAPI:ZoneResetAll
			wait 100
			relay all OgreBotAPI:ResetZone["Vasty Deep: The Vestigial Cella"]
			wait 50     
			{
				Obj_OgreIH:Message_FailedZoneOut
				return FALSE
			}
			_StartingPoint:Inc
		}
		return TRUE
	}

/**********************************************************************************************************
    Named 1 **********************    Move to, spawn and kill -   ***************************
***********************************************************************************************************/

	function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		Obj_OgreIH:AutoTarget_AddActor["",0,FALSE,TRUE]

		;Move to named and spawn
		call initialise_move_to_next_boss "${_NamedNPC}"
		;echo ${Time}: Starting Named1 function

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-10.754206,-10.366313,-2.463679"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-52.800659,1.621083,-1.679839"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-84.110207,1.627729,-1.617496"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNPC}"]
			return TRUE
		}
		call kill_named "${_NamedNPC}"
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}
		return TRUE
	}

/**********************************************************************************************************
 	Named 2 ********************    Move to, spawn and kill -  **************************
***********************************************************************************************************/
	
function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		Obj_OgreIH:AutoTarget_AddActor["",0,FALSE,TRUE]

		;Move to named and spawn
		call initialise_move_to_next_boss "${_NamedNPC}"
		;echo ${Time}: Starting Named2 function

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-52.800659,1.621083,-1.679839"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30
		
		Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-63.247490,0.002500,-28.293776"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 30
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-54.548958,3.731771,-42.317493"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-37.465611,9.905511,-65.736290"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-6.147725,8.082129,-75.134834"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-19.044220,8.082129,-89.694466"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10

		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNPC}"]
			return TRUE
		}
		call kill_named "${_NamedNPC}" 
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}
		return TRUE
	}

/**********************************************************************************************************
 	Named 3 *********************    Move to, spawn and kill -  ******************************
***********************************************************************************************************/
	
function:bool Named3(string _NamedNPC="Doesnotexist")
		{
		Obj_OgreIH:AutoTarget_AddActor["",0,FALSE,TRUE]
		;echo ${Time}: Starting Named3 function

		;Move to named and spawn
		call initialise_move_to_next_boss "${_NamedNPC}"

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-35.510521,8.774971,-105.074020"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-94.799835,20.081867,-106.204926"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 30
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 50

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-97.316589,19.577530,-135.973816"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 500
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 50
    
		Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-102.731461,20.023849,-144.863510"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 500
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 50
	
		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNPC}"]
			return TRUE
		}
		call kill_named "${_NamedNPC}" 
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}
		return TRUE
	}

/**********************************************************************************************************
 	Named 4 ***********************    Move to, spawn and kill -  *********************************
***********************************************************************************************************/
	
function:bool Named4(string _NamedNPC="Doesnotexist")
		{

		Obj_OgreIH:AutoTarget_AddActor["",0,FALSE,TRUE]

		;Move to named and spawn
		call initialise_move_to_next_boss "${_NamedNPC}"
		;echo ${Time}: Starting Named4 function

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-100.504974,20.139311,-145.099960"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-148.472397,20.002501,-148.152542"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10


		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNPC}"]
			return TRUE
		}
		call kill_named "${_NamedNPC}" 
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}
		return TRUE
	}

/**********************************************************************************************************
 	Named 5 **********************    Move to, spawn and kill -  *********************************
***********************************************************************************************************/
	
function:bool Named5(string _NamedNPC="Doesnotexist")
		{

		Obj_OgreIH:AutoTarget_AddActor["",0,FALSE,TRUE]

		;Move to named and spawn
		call initialise_move_to_next_boss "${_NamedNPC}"
		;echo ${Time}: Starting Named5 function

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-151.825760,18.360945,-129.270340"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-153.361511,12.214003,-93.893852"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 30
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-173.035599,10.575760,-76.653526"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 10
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-193.455460,10.560400,-84.988495"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 50
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 10


		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNPC}"]
			return TRUE
		}
		call kill_named "${_NamedNPC}" 
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}
		return TRUE
	}
/**********************************************************************************************************
 	Named 6 **********************    Move to, spawn and kill -  *********************************
***********************************************************************************************************/
	
 function:bool Named6(string _NamedNPC="Doesnotexist")
		{

		Obj_OgreIH:AutoTarget_AddActor["",0,FALSE,TRUE]

		;Move to named and spawn
		call initialise_move_to_next_boss "${_NamedNPC}"
		;echo ${Time}: Starting Named6 function

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-196.593231,12.256557,-71.132263"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 50
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-207.108704,13.132140,-55.204216"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 100
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-215.914825,20.164740,-22.683764"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 100
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-220.310532,20.358646,-12.986840"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 100
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

        Obj_OgreIH:SetCampSpot
	    Obj_OgreIH:ChangeCampSpot["-256.912231,20.834169,-14.447024"]
	    call Obj_OgreUtilities.HandleWaitForCampSpot 100
	    call Obj_OgreUtilities.HandleWaitForCombat
	    wait 30

        OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 5
		OgreBotAPI:CastAbility_Relay["all","Bladedance"]
		wait 5
		;OgreBotAPI:CastAbility_Relay["all","Bolster"]
		;wait 5
		OgreBotAPI:CastAbility_Relay["all","Porcupine"]

		;attempt to pull mobs back into tunnel
		call CampSpotAt ${Me.Name} -257.16 13.24 18.40
		while ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-257.16,13.24,18.40]} > 4 && ${botUtil.MobsAggro} == 0 && ${Me.Y} > -25
		{
			waitframe
		}
		call CampSpotAt ${Me.Name} -257.20 19.62 -16.28
		while ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-257.20,19.62,-16.28]} > 4 && ${botUtil.MobsAggro} > 0 && ${Me.Y} > -25
		{
			waitframe
		}
	
		;if i havent fallen down into water, run across bridge
		if  ${Me.Y} > -25
		{
			call MovementManager -257.36 10.00 39.59 "Vasty Deep: The Vestigial Cella" ${wGroup} FALSE ${ignoreDistance} ${ignoreHealth} ${minLevel} ${maxLevel} ${minMobs}
		}
		call FightQueen

		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNPC}"]
			return TRUE
		}
		call kill_named "${_NamedNPC}"
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}
		return TRUE
	}

}
/***********************************************************************************************************
***********************************************  FUNCTIONS  ************************************************    
************************************************************************************************************/

function initialise_move_to_next_boss(string _NamedNPC)
	{
		oc ${Me.Name} is moving to ${_NamedNPC}.
		Obj_OgreIH:SetCampSpot
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 30
		if ${Obj_OgreIH.SoloMode}
			{
				eq2execute merc resume
				wait 30
				eq2execute merc ranged
				eq2execute merc backoff
			}
		Obj_OgreIH:AutoTarget_ClearActors
	}
function move_to_next_waypoint(point3f waypoint)
	{
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${waypoint}"]
		call kill_trash
	}
function kill_trash()
	{
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat 50 TRUE
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreUtilities.HandleWaitForGroupDistance 5
	}
function prepull(point3f PrePullSpot)
	{
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${PrePullSpot}"]
		call kill_trash
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 20
	}

function kill_named(string _NamedNPC, point3f KillSpot)
	{
		oc ${Me.Name} is pulling ${_NamedNPC}
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${KillSpot}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		Actor["${_NamedNPC}"]:DoTarget
		wait 50
		oc !ci -SetCS_BehindNPC NotFighter ${Target.ID} 3
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 50
	}

function FightQueen()
{
	;Move to pool
	eq2execute /g Guys - everyone in the pool!
	call CampSpotAt ${Me.Name} -229.06 12.24 50.41
	while ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-229.06,12.24,50.41]} > 4
	{
		call CheckQueen
		call GetOutOfWater
		wait 5
	}
	eq2execute /target_none
	
	;Aggro other mobs
	eq2execute /g Grabbing the adds
	call CampSpotAt ${Me.Name} -230.60 13.87 62.19
	while ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-230.60,13.87,62.19]} > 4
	{
		call CheckQueen
		call GetOutOfWater
		wait 5
	}
	
	;Move to pool
	eq2execute /g And back to pool!
	call CampSpotAt ${Me.Name} -229.06 12.24 50.41
	while ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-229.06,12.24,50.41]} > 4
	{
		call CheckQueen
		call GetOutOfWater
		wait 5
	}
	eq2execute /target_none
	
	;Wait to let people catch up and kill the mobs
	wait 300
	wait ${Math.Rand[100]}
	
	;Default sticktopool is false, which means first person to get here become the main actor in this encounter.
	if !${stickToPool}
	{
		;Tell everyone else to stay back.
		relay ${mythRG} echo \${Script[EpicRepercussions].VariableScope.stickToPool:Set[TRUE]}
		wait 10
		stickToPool:Set[FALSE]
	
	
		eq2execute /g Aggroing Queen
		;Aggro Queen
		;call CampSpotAt ${Me.Name} -233.18 18.87 85.97
		while ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-233.18,18.87,85.97]} > 5
		{
			oc !ci -FlyUp ${Me.Name}
			call CheckQueen
			call GetOutOfWater
			target me
			wait 5
			oc !ci -LetsGo ${Me.Name}
			relay ${Me.Name} runscript "${Script.CurrentDirectory}/OgreMove_Modified" loc -233.18 18.87 85.97
		}
		oc !ci -FlyStop ${Me.Name}
		wait 20
		
		;Move to top of stairs for easy retreat to pool
		eq2execute /g Getting read to jump in pool
		oc !ci -LetsGo ${Me.Name}
		target me
		wait 5
		while ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-232.05,18.87,69.20]} > 5
		{
			call CheckQueen
			call GetOutOfWater
			target me
			if !${Script[OgreMove_Modified](exists)}
			{
				oc !ci -LetsGo ${Me.Name}
				relay ${Me.Name} runscript "${Script.CurrentDirectory}/OgreMove_Modified" loc -232.05 18.87 69.20
			}
			wait 1
		}
		
		
		eq2execute /g Getting her to 90
		;Get Queen down to 90
		target Queen
		;call CampSpotAt ${Me.Name} -232.05 18.87 69.20
		while ${queenUp} && ${Actor[Queen].Health} >= 90
		{
			call CheckQueen
			if !${Target.Name.Find[Queen](exists)}
			{
				target Queen
			}
			call GetOutOfWater
			if ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-232.05,18.87,69.20]} > 3
			{
				target me
				oc !ci -LetsGo ${Me.Name}
				relay ${Me.Name} runscript "${Script.CurrentDirectory}/OgreMove_Modified" loc -232.05 18.87 69.20
			}
			;call CampSpotAt ${Me.Name} -232.05 18.87 69.20
			waitframe
		}
	}
	eq2execute /g Back to pool at 90
	;back to pool
	call CampSpotAt ${Me.Name} -229.06 12.24 50.41
	while ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-229.06,12.24,50.41]} > 4
	{
		call CheckQueen
		call GetOutOfWater
		wait 5
	}
	wait 150
	target Queen
	if !${stickToPool}
	{
		eq2execute /g Queen to 60!
		;call CampSpotAt ${Me.Name} -232.05 18.87 69.20
		while ${queenUp} && ${Actor[Queen].Health} >= 60
		{
			call CheckQueen
			if !${Target.Name.Find[Queen](exists)}
			{
				target Queen
			}
			call GetOutOfWater
			if ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-232.05,18.87,69.20]} > 3
			{
				target me
				oc !ci -LetsGo ${Me.Name}
				relay ${Me.Name} runscript "${Script.CurrentDirectory}/OgreMove_Modified" loc -232.05 18.87 69.20
			}
			;call CampSpotAt ${Me.Name} -232.05 18.87 69.20
			waitframe
		}
		oc !ci -FlyStop ${Me.Name}
	}
	eq2execute /g Back to pool 60
	;back to pool
	call CampSpotAt ${Me.Name} -229.06 12.24 50.41
	while ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-229.06,12.24,50.41]} > 4
	{
		call CheckQueen
		call GetOutOfWater
		wait 5
	}
	wait 150
	target Queen
	if !${stickToPool}
	{
		;call CampSpotAt ${Me.Name} -232.05 18.87 69.20
		eq2execute /g Queen to 30!
		while ${queenUp} && ${Actor[Queen].Health} >= 30
		{
			call CheckQueen
			if !${Target.Name.Find[Queen](exists)}
			{
				target Queen
			}
			call GetOutOfWater
			if ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-232.05,18.87,69.20]} > 3
			{
				target me
				oc !ci -LetsGo ${Me.Name}
				relay ${Me.Name} runscript "${Script.CurrentDirectory}/OgreMove_Modified" loc -232.05 18.87 69.20
			}
			;call CampSpotAt ${Me.Name} -232.05 18.87 69.20
			waitframe
		}
		oc !ci -FlyStop ${Me.Name}
	}
	eq2execute /g Back to pool 30
	;back to pool
	call CampSpotAt ${Me.Name} -229.06 12.24 50.41
	while ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-229.06,12.24,50.41]} > 4
	{
		call CheckQueen
		call GetOutOfWater
		wait 5
	}
	wait 150
	eq2execute /g Queen to 10, stayin pool
	target Queen
	call CampSpotAt ${Me.Name} -229.06 12.24 50.41
	while ${queenUp} && ${Actor[Queen].Health} >= 10 && !${Actor[conch](exists)}
	{
		call CheckQueen
		if !${Target.Name.Find[Queen](exists)}
		{
			target Queen
		}
		call GetOutOfWater
		waitframe
	}
	;back to pool
	eq2execute /g Back to pool 10
	call CampSpotAt ${Me.Name} -229.06 12.24 50.41
	while ${queenUp} && ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-229.06,12.24,50.41]} > 4
	{
		call CheckQueen
		call GetOutOfWater
		wait 5
	}
	
	eq2execute /g Waiting for Queen to be gone
	while ${queenUp}
	{
		wait 100
		call CheckQueen
		call GetOutOfWater
		eq2execute /g Waiting for conch or queen to be gone
		while ${Actor[conch](exists)} && ${queenUp}
		{
			call CheckQueen
			call GetOutOfWater
			target me
			oc !ci -LetsGo ${Me.Name}
			oc !ci -FlyUp ${Me.Name}
			wait 4
			oc !ci -Pause ${Me.Name}
			relay ${Me.Name} runscript "${Script.CurrentDirectory}/OgreMove_Modified" loc ${Actor[conch].X} ${Actor[conch].Y} ${Actor[conch].Z}
			wait 20
			target conch
			wait 3
			eq2execute "/apply_verb ${Actor[conch].ID} Gather"
			wait 50
			oc !ci -Resume ${Me.Name}
		}
		
		eq2execute /g Run back to the pool~!
		oc !ci -Pause ${Me.Name}
		relay ${Me.Name} runscript "${Script.CurrentDirectory}/OgreMove_Modified" loc -217.65 12.94 46.81
		while ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-217.65,12.94,46.81]} > 5 && ${queenUp}
		{
			call CheckQueen
			call GetOutOfWater
			target me
			wait 20
			relay ${Me.Name} runscript "${Script.CurrentDirectory}/OgreMove_Modified" loc -217.65 12.94 46.81
		}
		oc !ci -Resume ${Me.Name}
		wait 5
		eq2execute /target_none
		call CampSpotAt ${Me.Name} -229.06 12.24 50.41
		wait 100
		
		eq2execute /g Using conch
		while ${Me.Inventory[conch](exists)} && ${queenUp}
		{
			call CheckQueen
			Me.Inventory[conch]:Use
			wait 10
		}
		wait 200
	}
}

function GetOutOfWater()
{
	echo GetOutOfWater Dead:${Me.ToActor.IsDead} InWater:${Me.Y}<-10
	if ${Me.ToActor.IsDead}
	{
		echo In ifDead
		wait 100
		if ${Me.ToActor.IsDead}
		{
			In secondIfDead
			oc !ci -Revive ${Me.Name}
			wait 200
			
			;Crystasha
			call MovementManager -95.11 19.57 -125.07 "Vasty Deep: The Vestigial Cella" ${wGroup} FALSE ${ignoreDistance} ${ignoreHealth} ${minLevel} ${maxLevel} ${minMobs}
			;Snakes
			call MovementManager -201.27 12.17 -86.18 "Vasty Deep: The Vestigial Cella" ${wGroup} FALSE ${ignoreDistance} ${ignoreHealth} ${minLevel} ${maxLevel} ${minMobs}
			;Queen Room
			call MovementManager -257.36 10.00 39.59 "Vasty Deep: The Vestigial Cella" ${wGroup} FALSE ${ignoreDistance} ${ignoreHealth} ${minLevel} ${maxLevel} ${minMobs}
			
			call FightQueen
		}
	}
	elseif ${Me.Y} < -10
	{
		oc !ci -Resume ${Me.Name}
		echo In IfInWater
		if ${Me.Z} < 50
		{
			target me
			if ${Me.X} > -230
			{
				call CampSpotAt ${Me.Name} -184.61 -74.16 37.29
				while ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-184.61,-74.16,37.29]} > 4 && !${Me.ToActor.IsDead}
				{
					wait 5
				}
			}
			call CampSpotAt ${Me.Name} -231.06 -74.99 25.71
			while ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-231.06,-74.99,25.71]} > 4 && !${Me.ToActor.IsDead}
			{
				wait 5
			}
			call CampSpotAt ${Me.Name} -257.63 -74.98 67.69
			while ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-257.63,-74.98,67.69]} > 4 && !${Me.ToActor.IsDead}
			{
				wait 5
			}
		}
		else
		{
			target me
			call CampSpotAt ${Me.Name} -234.28 -74.84 125.40
			while ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-234.28,-74.84,125.40]} > 4 && !${Me.ToActor.IsDead}
			{
				wait 5
			}
		}
		while ${Me.Y} < -10 && !${Me.ToActor.IsDead}
		{
			call CampSpotAt ${Me.Name} -225.38 -73.02 71.36
			while ${Math.Distance[${Me.X},${Me.Y},${Me.Z},-225.38,-73.02,71.36]} > 4 && !${Me.ToActor.IsDead} && ${Me.Y} < -50
			{
				wait 5
			}
			
			target me
			wait 3
			eq2execute /target_none
			call CampSpotAt ${Me.Name} -229.06 12.24 50.41
			variable int startTime = 0
			startTime:Set[${Time.Timestamp}]
			while ${Math.Calc[${Time.Timestamp} - ${startTime}]} < 10
			{
				if ${Me.Y} >= -10
				{
					eq2execute /target_none
					return
				}
				waitframe
			}
		}
		if ${queenUp} && !${Actor[namednpc,Queen].Target(exists)} && !${Me.ToActor.IsDead}
		{
			;encounter has been reset...
			call FightQueen
		}
		eq2execute /target_none
	}
}

function CheckQueen()
{
	if ${Actor[namednpc,Queen](exists)}
	{
		queenUp:Set[TRUE]
		if ${queenAggro} && !${Actor[namednpc,Queen].Target(exists)}
		{
			;encounter must have reset
			queenAggro:Set[FALSE]
			call FightQueen
			wait 50
		}
		elseif !${queenAggro} && ${Actor[namednpc,Queen].Target(exists)}
		{
			queenAggro:Set[TRUE]
		}
	}
	else 
	{
		wait 50
		if !${Actor[namednpc,Queen](exists)}
		{
			queenUp:Set[FALSE]
		}
	}
}