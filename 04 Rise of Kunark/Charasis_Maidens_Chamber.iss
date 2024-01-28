;================================================================================
; Title: Maidens Chamber | Author: Derf, The Marty Party | Date: 27 Jan 2024 | Version: 3.0
;================================================================================

/*
	This IC requires my Drusella.iss script to function correctly. It can be found on my Github.
	https://github.com/squeeze-bofa-deez/Scripts/blob/main/04%20Rise%20of%20Kunark/Drusella.iss
*/

variable string sZoneName="Charasis: Maiden's Chamber"
variable string sZoneShortName="exp04_dun_charasis_south"

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
                Obj_OgreIH:Actor_Click["Zone_to_Charasis_Madens_Chamber"]
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
		}

        if ${_StartingPoint} == 1
		{
			call This.Named1 "Bi'lithu of the Old Ways"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Bi'lithu of the Old Ways"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 2
		{
			call This.Named2 "Sandstorm"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Sandstorm"]
				return FALSE
			}
			_StartingPoint:Inc
		}   

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Gear of the Ancients"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Gear of the Ancients"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 4
		{
			call This.Named4 "Impaler Tzilug"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZoneOut["#4: Impaler Tzilug"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 5
		{
			call This.Named5 "Derzitha of the Jarsath"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZoneOut["#5: Derzitha of the Jarsath"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		;// Finish zone (zone out)
		if ${_StartingPoint} == 6
		{
			call This.Named6 "Drusella Sathir"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZoneOut["#6: Drusella Sathir"]
				return FALSE
			}
			_StartingPoint:Inc
		}
        return TRUE
    }
	
	function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Bi'lithu of the Old Ways
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["0.106175,0.127500,27.10624"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-5.863729,0.002500,56.817406"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-33.520576,0.002492,62.332405"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;//Drop to bottom
		Obj_OgreIH:ChangeCampSpot["-58.619110,-20.305775,62.439419"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 50

		;//Move to named
		Obj_OgreIH:ChangeCampSpot["-48.488655,-20.661346,62.628754"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-25.858936,-20.622499,62.326530"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-25.832212,-20.622501,97.458260"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
				
		Obj_OgreIH:ChangeCampSpot["4.391889,-20.622499,91.301079"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["14.685887,-18.874950,87.776680"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["26.778563,-20.622499,90.072258"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// This takes the team by the doors to pull aggro inside and move to the back of the room.  This will on occasion pull the named.
		;// Future version: keep pets at docile and attack when at back of room.
		Obj_OgreIH:ChangeCampSpot["30.752970,-20.622501,104.179649"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 5
		
		Obj_OgreIH:ChangeCampSpot["-3.257018,-20.622499,104.476410"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 5
		
		Obj_OgreIH:ChangeCampSpot["-2.388385,-20.622499,91.770386"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["0.433764,-20.622499,102.476151"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-3.211607,-20.622501,126.540253"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Bi'lithu of the Old Ways
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["-3.211607,-20.622501,126.540253"]
		Actor["Bi'lithu of the Old Ways"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

		wait 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		eq2execute summon
		wait 10
        return TRUE
	}


	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		;// Clear area and click lever to unlock Sandstorm Room
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-0.617328,-20.622499,155.466568"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["32.362518,-20.622501,155.336121"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["14.185795,-20.622499,155.769669"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;//Fall in hole
		Obj_OgreIH:ChangeCampSpot["14.382330,-41.622501,134.653778"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["14.348016,-41.622501,143.048370"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		echo Pulling Lever
		wait 10
		call Obj_OgreUtilities.NavToLocation "click1" 5

		variable point3f click1 = "13.990874,-41.622501,143.434265"
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${click1}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 3
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 40

		OgreBotAPI:Zone[igw:${Me.Name}]
		Obj_OgreIH:ClearCampSpot
		wait 20

		oc !c -Evac igw:${Me.Name}
		call Obj_OgreUtilities.HandleWaitForZoning
		wait 30
		
		;//Move to Sandstorm
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["0.106175,0.127500,27.10624"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-5.863729,0.002500,56.817406"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-33.520576,0.002492,62.332405"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;//Drop to bottom
		Obj_OgreIH:ChangeCampSpot["-58.619110,-20.305775,62.439419"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;//Move to named
		Obj_OgreIH:ChangeCampSpot["-48.488655,-20.661346,62.628754"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-25.947556,-20.622499,62.316551"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-25.843315,-20.622499,93.321404"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
				
		Obj_OgreIH:ChangeCampSpot["-0.602957,-20.622501,93.408508"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	
		
		Obj_OgreIH:ChangeCampSpot["-1.329355,-20.622499,112.907600"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-2.761914,-20.622501,151.968567"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-40.514484,-17.622499,151.828583"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-40.822510,-17.622499,124.231125"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-67.095985,-17.622499,124.490112"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-66.020340,-17.622499,97.061722"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-77.087593,-17.622501,97.067635"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Sandstorm
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["-77.087593,-17.622501,97.067635"]

		Ob_AutoTarget:AddActor["Remnant of Sand",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Sandstorm",0,FALSE,FALSE]

		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

		wait 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		eq2execute summon
        return TRUE
	}

	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-85.075508,-17.622501,96.922752"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		
		;//Click Totem
		oc !c -SpecialZoneSpecific
		wait 25

		;//Move to Gear of the Ancients
		Obj_OgreIH:ChangeCampSpot["-66.820808,-17.622499,97.180168"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["-66.544754,-17.622499,125.559372"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-40.993069,-17.622499,125.074692"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-40.502132,-17.622501,180.377594"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-70.186501,-17.622499,180.393311"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-82.195084,-17.372377,190.476593"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Gear of the Ancients
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["-82.195084,-17.372377,190.476593"]
		Actor["Gear of the Ancients"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

		wait 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		eq2execute summon
        return TRUE
		wait 300
	}

	function:bool Named4(string _NamedNPC="Doesnotexist")
	{	
		;//Move to Lever
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-89.191391,-17.244970,181.327240"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		;//Click Lever
		echo Pulling Lever
		wait 10
		call Obj_OgreUtilities.NavToLocation "click3" 5

		variable point3f click3 = "-89.753914,-17.135899,180.624496"
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${click3}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 3
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 40

		OgreBotAPI:Zone[igw:${Me.Name}]
		Obj_OgreIH:ClearCampSpot
		wait 20

		;//Move to Impaler Tzilug
		Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["-82.195084,-17.372377,190.476593"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-66.662460,-17.622499,180.413651"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-40.293224,-17.622501,180.598999"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 100
		
		Obj_OgreIH:ChangeCampSpot["-40.396793,-17.651960,239.230804"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["31.847761,-17.622501,238.914383"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["105.725769,-18.122499,238.856430"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
				
		Obj_OgreIH:ChangeCampSpot["105.494141,-17.622499,192.443024"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["132.074173,-17.594120,193.001434"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
				
		Obj_OgreIH:ChangeCampSpot["132.147354,-17.622501,179.724121"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["104.766937,-17.622499,179.853302"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["104.748390,-17.607716,124.219017"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["131.186508,-17.622499,123.776436"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["130.898254,-17.622509,93.154030"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["126.022758,-17.497501,83.132690"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["138.316284,-17.622501,73.270027"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["150.516418,-17.622499,71.253052"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Impaler Tzilug
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Bladedance"]
		Obj_OgreIH:ChangeCampSpot["150.516418,-17.622499,71.253052"]
		Actor["Impaler Tzilug"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

		wait 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		eq2execute summon
        return TRUE
		wait 300
	}

	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Derzitha of the Jarsath
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["138.301437,-17.622501,73.367348"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["126.978928,-17.497499,83.528458"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 5

		Obj_OgreIH:ChangeCampSpot["131.361481,-17.622509,93.570450"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 5

		Obj_OgreIH:ChangeCampSpot["131.985825,-17.622499,124.963387"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 5
		
		Obj_OgreIH:ChangeCampSpot["104.572754,-17.622499,124.516869"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 5

		Obj_OgreIH:ChangeCampSpot["104.979057,-17.622499,180.302872"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 5

		Obj_OgreIH:ChangeCampSpot["132.147629,-17.622499,179.893951"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 5
		
		Obj_OgreIH:ChangeCampSpot["132.330353,-17.362181,193.007568"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 5

		Obj_OgreIH:ChangeCampSpot["104.972115,-17.622499,193.158005"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 5

		Obj_OgreIH:ChangeCampSpot["105.602150,-18.122499,238.981964"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 5

		Obj_OgreIH:ChangeCampSpot["14.381433,-17.622499,238.746246"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["14.556277,-20.533899,270.571442"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Click Edict and Spawn Named's
		Obj_OgreIH:Actor_Click["Sathir's Edict"]
		wait 50

		;// Killing Derzitha of the Jarsath
		Obj_OgreIH:ChangeCampSpot["5.193716,-20.236958,272.120483"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10

		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["5.193716,-20.236958,272.120483"]
		
		Ob_AutoTarget:AddActor["Thera'ta of the Jarsath",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Xe'ziza of the Jarsath",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Derzitha of the Jarsath",0,FALSE,FALSE]
				
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 90
		

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

		wait 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		eq2execute summon
        return TRUE
		wait 300
	}

	function:bool Named6(string _NamedNPC="Doesnotexist")
	{
		call DrusellaOn
		wait 10

		;// Moving to Drusella Sathir
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["13.631077,-18.872499,283.862732"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 5

		Obj_OgreIH:ChangeCampSpot["25.753855,-18.872499,297.848328"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 5

		Obj_OgreIH:ChangeCampSpot["26.152617,-20.622503,316.493286"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		;call Obj_OgreUtilities.HandleWaitForCombat
		wait 5
		
		Obj_OgreIH:ChangeCampSpot["14.287351,-20.622499,316.176971"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["13.971550,-20.622499,344.735565"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-13.534229,-20.622501,344.260437"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-13.836673,-22.122499,370.297760"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		call PortalMove

		Obj_OgreIH:ChangeCampSpot["14.303277,8.478914,227.468979"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 5

		;//Clear Trash
		Obj_OgreIH:ChangeCampSpot["14.307989,6.71000,212.125687"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["45.579525,5.222651,191.139114"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["15.431884,6.247423,211.261993"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-17.278240,5.497382,191.667007"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Drusella Sathir
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["9.667674,5.372983,172.613495"]
		Actor["Drusella Sathir"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

		wait 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		eq2execute summon
		wait 30

		call DrusellaOff

		;// Evacing
		echo Exiting
		Obj_OgreIH:LetsGo
		wait 10
		echo Evacing
		oc !c -Evac
	}

	function DrusellaOn()
	{
		oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_enable_chatevents TRUE TRUE TRUE
		wait 10
		OgreBotAPI:ChatEvent_AddEntry["igw:${Me.Name}", "begins to shield herself in a necromantic aura.", "TRUE", "TRUE", "runscript Drusella"]
		wait 10
	}

	function DrusellaOff()
	{
		oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_enable_chatevents FALSE FALSE FALSE
		wait 10
		OgreBotAPI:ChatEvent_AddEntry["igw:${Me.Name}", "begins to shield herself in a necromantic aura."]
		wait 10
	}

	function PortalMove()
	{
		relay all face -14.122499 378.622650
		wait 50
		oc !c -Walk
		wait 10
		oc !c -Crouch
		wait 10
		Obj_OgreIH:ClearCampSpot
		relay all press -hold ${OgreForwardKey}
		wait 40
		relay all press -release ${OgreForwardKey}
		wait 20
		Obj_OgreIH:SetCampSpot
	}
}