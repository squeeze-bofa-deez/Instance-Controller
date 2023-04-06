;==========================================
;   Title: The Obelisk of Blight IC
;  Author: The Marty Party
;    Date: 03 Nov 2021
; Version: 1.0
;==========================================

variable string sZoneName="The Obelisk of Blight"
variable string sZoneShortName="exp03_dun_obelisk_epic01_blight"

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
                Obj_OgreIH:Actor_Click["Zone_to_Obelisk_of_Blight"]
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
			call This.Named1 "Interrogator Bruek"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Interrogator Bruek"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 2
		{
			call This.Named2 "Occulator Yxorx"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Occulator Yxorx"]
				return FALSE
			}
			_StartingPoint:Inc
		}   

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Zzorzzazxx"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Zzorzzazxx"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 4
		{
			call This.Named4 "Gretalik the Bloodbourne"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Gretalik the Bloodbourne"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 5
		{
			call This.Named5 "Axxyk'Tuur"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Axxyk'Tuur"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		;// Finish zone (zone out)
		if ${_StartingPoint} == 6
		{
			call This.Named6
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZoneOut
				return FALSE
			}
			_StartingPoint:Inc
		}
        return TRUE
    }
	
	function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Interrogator Bruek
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["126.257332,-15.317148,26.612589"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:Actor_Click["door_rising_001_01"]
		wait 50

		Obj_OgreIH:ChangeCampSpot["115.465103,-15.361206,26.623135"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["115.516266,-11.173264,2.336854"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["99.027130,-11.173245,2.191018"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["99.132561,-12.515844,-11.847567"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:Actor_Click["door_rising_002_01"]
		wait 50

		Obj_OgreIH:ChangeCampSpot["99.232910,-12.913402,-18.785629"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["107.621819,-12.913401,-27.564014"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["102.127914,-12.913402,-43.581474"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["94.235413,-14.805519,-57.973667"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["87.945793,-14.784973,-70.382317"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["74.535393,-13.012385,-60.866718"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["70.060265,-13.012384,-63.417744"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["59.977360,-13.012384,-77.370872"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["35.548985,-13.012385,-61.540730"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Interrogator Bruek
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["44.030411,-13.012385,-47.926506"]
		Actor["Interrogator Bruek"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
	}

	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Occulator Yxorx
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["35.548985,-13.012385,-61.540730"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["59.977360,-13.012384,-77.370872"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["70.060265,-13.012384,-63.417744"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["74.535393,-13.012385,-60.866718"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["87.945793,-14.784973,-70.382317"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["94.235413,-14.805519,-57.973667"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["102.127914,-12.913402,-43.581474"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["107.621819,-12.913401,-27.564014"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["99.232910,-12.913402,-18.785629"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		Obj_OgreIH:Actor_Click["door_rising_002_01"]
		wait 50

		Obj_OgreIH:ChangeCampSpot["99.027130,-11.173245,2.191018"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["70.618797,-11.173244,2.130508"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["70.474770,-0.665812,46.890247"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:Actor_Click["door_rising_004_01"]
		wait 50

		Obj_OgreIH:ChangeCampSpot["53.362961,-4.849293,46.850670"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10		

		Obj_OgreIH:ChangeCampSpot["46.202682,-6.302851,37.585037"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		Obj_OgreIH:ChangeCampSpot["37.317867,-6.302851,26.138546"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		Obj_OgreIH:ChangeCampSpot["25.091440,-6.302851,31.464504"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10

		Obj_OgreIH:ChangeCampSpot["15.563620,-6.302885,26.978970"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10	

		;// Killing Occulator Yxorx
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["8.271486,-6.302851,43.041210"]
		Actor["Occulator Yxorx"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
	}

	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Zzorzzazxx
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-3.678971,-4.555781,46.835739"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		Obj_OgreIH:Actor_Click["door_rising_005_01"]
		wait 50

		Obj_OgreIH:ChangeCampSpot["-13.368112,-5.342460,29.068478"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["-19.939926,-5.321525,23.569353"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-35.321945,-6.302852,27.144682"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-70.760529,-6.302851,30.357105"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Actor["a key of chaos"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-41.945065,-6.302851,26.759544"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		Obj_OgreIH:Actor_Click["door_rising_006_01"]
		wait 50

		Obj_OgreIH:ChangeCampSpot["-41.663845,-4.555781,16.228224"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-41.822678,-5.157207,4.360808"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-41.824211,-6.932852,-17.203993"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-26.131754,-5.165576,-13.581966"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-21.798897,-5.175448,-24.611292"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Zzorzzazxx
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["-4.898226,-5.002325,-17.709850"]
		Actor["Zzorzzazxx"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
		wait 300
	}

	function:bool Named4(string _NamedNPC="Doesnotexist")
	{	
		;// Moving to Gretalik the Bloodbourne
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-55.406891,-5.119864,-18.023891"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["-64.528564,-5.175454,-25.025667"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-67.949265,-5.175490,-10.232990"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Gretalik the Bloodbourne
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Bladedance"]
		Obj_OgreIH:ChangeCampSpot["-87.844322,-5.002370,-17.875011"]
		Actor["Gretalik the Bloodbourne"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
		wait 300
	}

	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Axxyk'Tuur
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-41.535862,-6.932852,-17.873560"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10

		Obj_OgreIH:ChangeCampSpot["-42.298748,-5.175160,-36.169655"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-42.764645,-5.002366,-46.359840"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Killing Axxyk'Tuur
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		Obj_OgreIH:ChangeCampSpot["-42.713882,-5.002370,-64.603821"]
		Actor["Axxyk'Tuur"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH:Get_Chest
        return TRUE
		wait 300

		;// Evacing
		echo Exiting
		Obj_OgreIH:LetsGo
		wait 10
		echo Evacing
		oc !c -Evac
	}
}