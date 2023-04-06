variable string sZoneName="Chelsith"
variable string sZoneShortName="exp04_dun_chelsith"
variable string sZoneIn_ObjectName="zone_to_chelsith"

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
		Obj_OgreIH:Set_Debug_Mode[TRUE]
		
		;// _StartingPoint:Set[1]

		if ${_StartingPoint} == 0
		{
			call Obj_OgreIH.CD.GetIntoZone
			if !${Return}
			{
				Obj_OgreIH:Actor_Click["zone_to_chelsith"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}
			Ogre_Instance_Controller:ZoneSet

			call Obj_OgreIH.Set_VariousOptions
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "25"]
			
			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 1
		{
		call This.Named1 "Leviathor'Tentar"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#1: Leviathor'Tentar"]
				return TRUE
			}
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 2
		{
			call This.Named2 "Krel'Vhap the Defeater"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#2: Krel'Vhap the Defeater"]
				return TRUE
			}
			
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Leviathor'Consuma"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#3: Leviathor'Consuma"]
				return TRUE
			}
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 4
		{
		call This.Named4 "Uth'Gak the Grand Devotor"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#4: Uth'Gak the Grand Devotor"]
				return TRUE
			}
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 5
		{
			call This.Named5 "Mucus of the Deep One"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#5: Mucus of the Deep One"]
				return TRUE
			}
			
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 6
		{
			call This.Named6 "Gok'Chai the Substantiator"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#6: Gok'Chai the Substantiator"]
				return TRUE
			}
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 7
		{
		call This.Named7 "Leviathor'Glamar"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#7: Leviathor'Glamar"]
				return True
			}
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 8
		{
			call This.Named8 "Kuom'Ziki the Prevailer"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#8: Kuom'Ziki the Prevailer"]
				return TRUE
			}
			
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 9
		{
			call This.Named9 "Bbal'Gaz the Enthraller"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#9: Bbal'Gaz the Enthraller"]
				return TRUE
			}
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 10
		{
			call This.Named10 "Majora Leviathora"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#10: Majora Leviathora"]
				return TRUE
			}
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 11
		{
			call This.Named11 "The Blue Baron"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#11: The Blue Baron"]
				return TRUE
			}
			call Obj_OgreIH.Get_Chest
			
			_StartingPoint:Inc
		}

		;// Finish zone, evac, move to zone-out, zone out. Move back to zone-in, loop.
        if ${_StartingPoint} == 12
        {
            Obj_OgreIH:SetCampSpot
            echo Evacing
			oc !c -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 19000
			oc !c -Resume
            Obj_OgreIH:SetCampSpot
			Obj_OgreIH:ChangeCampSpot["-83.256378,32.999660,510.253967"]
			call Obj_OgreUtilities.HandleWaitForCampSpot 10
			wait 100
			oc !c -Zone
			oc !c all -door 1
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 100
			call Obj_OgreIH.ZoneNavigation.ZoneOut
			wait 10
			relay all OgreBotAPI:ZoneResetAll
			wait 100
			relay all OgreBotAPI:ResetZone["Chelsith"]
			wait 50
			relay all OgreBotAPI:ZoneResetAll
			wait 100
			relay all OgreBotAPI:ResetZone["Chelsith"]
			wait 50
			relay all OgreBotAPI:ZoneResetAll
			wait 100
            Obj_OgreIH:ClearCampSpot
			wait 10
			OgreBotAPI:ZoneResetAll
			wait 50
			OgreBotAPI:ResetZone["Chelsith"]
			wait 50
			OgreBotAPI:resume["${Me.Name}"]
            wait 10
            Obj_OgreIH:SetCampSpot
			wait 10        
            Obj_OgreIH:ChangeCampSpot["596.634399,-52.971779,1249.753174"]
			call Obj_OgreUtilities.HandleWaitForCampSpot 10
			call Obj_OgreUtilities.HandleWaitForCombat
            wait 10
            OgreBotAPI:FlyUp["${Me.Name}"]
            Obj_OgreIH:ChangeCampSpot["601.371826,-53.013847,1416.893188"]
			call Obj_OgreUtilities.HandleWaitForCampSpot 10
			call Obj_OgreUtilities.HandleWaitForCombat
            wait 10
            OgreBotAPI:FlyStop["${Me.Name}"]
            wait 10
            OgreBotAPI:FlyDown["${Me.Name}"]
			Obj_OgreIH:ChangeCampSpot["513.535767,-127.291367,1452.596558"]
			call Obj_OgreUtilities.HandleWaitForCampSpot 10
			call Obj_OgreUtilities.HandleWaitForCombat
            wait 10
            OgreBotAPI:FlyDown["${Me.Name}"]
			Obj_OgreIH:ChangeCampSpot["537.651978,-165.527679,1405.849365"]
			call Obj_OgreUtilities.HandleWaitForCampSpot 10
			call Obj_OgreUtilities.HandleWaitForCombat
            wait 10
            OgreBotAPI:FlyStop["${Me.Name}"]

            Obj_OgreIH:ChangeCampSpot["563.527649,-153.613937,1341.751465"]
			call Obj_OgreUtilities.HandleWaitForCampSpot 10
			call Obj_OgreUtilities.HandleWaitForCombat
            wait 10
			relay all OgreBotAPI:ZoneResetAll
			wait 100
			relay all OgreBotAPI:ResetZone["Chelsith"]
			wait 50

            if !${Return}
            {
                Obj_OgreIH:Message_FailedZoneOut
                return TRUE
            }
            _StartingPoint:Inc
        }
        return TRUE
    }

    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		;// Preparations
		Obj_OgreIH:SetCampSpot
       
		Obj_OgreIH:ChangeCampSpot["-70.576653,30.380865,510.627502"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		OgreBotAPI:UseItem_Relay["all","Mechanized Platinum Repository of Reconstruction"]
		wait 10
		oc !c -RepairGear all
		wait 10
		
        ;// Moving to Leviathor'Tentar
		Obj_OgreIH:ChangeCampSpot["-72.796310,30.319704,512.341187"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-0.652362,28.269640,500.006073"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["6.159122,21.895460,475.420410"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-1.172125,4.512005,388.704865"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-3.877893,4.578607,376.523743"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-11.680809,4.228658,345.134186"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-39.175045,1.494205,326.114929"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-69.808167,0.252023,303.462067"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-105.675941,1.866577,283.524567"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-118.238899,1.913721,273.454651"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-138.400925,3.174733,253.617401"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-151.576096,2.347004,215.179001"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-160.368179,2.311938,187.086731"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-173.161240,1.593507,191.163651"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-213.069885,1.966358,177.771469"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-216.999817,0.994956,192.358047"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-229.272675,1.122471,217.391373"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-243.215775,2.303442,233.153122"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-238.152847,3.024437,246.876480"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-219.692902,2.291043,258.713135"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-206.678619,1.519313,237.747513"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Leviathor'Tentar
		Obj_OgreIH:SetCampSpot
		wait 10
		Obj_OgreIH:ChangeCampSpot["-213.753326,0.909632,239.587631"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 10
		Obj_OgreIH:SetUpFor
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 10
		Actor[Leviathor'Tentar]:DoTarget
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}"
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Gather Remains"]
	    wait 30
		call Obj_OgreIH.Get_Chest
				
        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return FALSE
        }
		return TRUE
	}

	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Krel'Vhap the Defeater
        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-219.053848,1.169008,238.736176"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-240.122833,3.288463,249.137955"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-232.983200,1.838362,231.782150"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-258.295715,7.171557,276.754150"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-225.449677,23.613861,331.451324"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-184.952240,37.245228,350.814636"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-173.921890,38.825920,351.304047"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-173.556152,38.877598,351.154510"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Krel'Vhap the Defeater
		Obj_OgreIH:ChangeCampSpot["-151.450928,37.302898,354.355530"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		Obj_OgreIH:SetUpFor
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		Actor[Krel'Vhap the Defeater]:DoTarget
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}"
		wait 10
		call Obj_OgreIH.KillAll "${_NamedNPC}" -NoPosition
		wait 10
		call Obj_OgreIH.Get_Chest
		wait 10
		
        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return FALSE
        }
		return TRUE	
	}

	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Leviathor'Consuma
        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-144.985291,37.418785,356.561035"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-162.795715,39.004204,354.584442"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-216.950058,28.621954,342.514984"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-257.340607,8.001931,281.431030"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-240.845398,2.337672,237.272171"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-228.383606,1.624884,234.760361"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-189.127243,1.785305,250.999283"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-166.002487,1.611409,228.288849"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-138.265335,3.136741,252.641403"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-24.444921,5.296670,335.172516"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["8.437989,4.578607,350.777924"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["8.817378,4.578611,358.273895"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["28.564400,6.011672,335.673523"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["57.626221,3.801482,315.089691"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["72.108253,4.198736,301.779388"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["88.106743,4.178310,281.504822"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["111.696823,4.077290,260.173889"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["135.201538,2.657748,246.649567"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["148.124222,2.452203,238.313583"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["143.662628,1.857656,217.987793"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["160.854004,0.822619,212.154465"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["166.275436,1.685839,254.978256"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["195.671112,1.742758,261.396820"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["213.125504,0.151051,234.496567"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["239.046677,1.667415,217.737411"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["238.626526,1.758232,201.923508"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["215.254288,1.501120,178.810287"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["179.408081,0.409547,193.742264"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["234.034378,-2.314055,153.531235"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		/* Harvesting Fish */
		OgreBotAPI:Actor[exactname,"a school of bluefins"]:DoTarget
		Actor[exactname,"a school of bluefins"]:DoTarget
        wait 10
		OgreBotAPI:ApplyVerbForWho["igw:${Me.Name}","a school of bluefins","Fish"]
		wait 100

		Obj_OgreIH:ChangeCampSpot["234.034378,-2.314055,153.531235"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		OgreBotAPI:Actor[exactname,"a school of bluefins"]:DoTarget
		Actor[exactname,"a school of bluefins"]:DoTarget
        wait 10
		OgreBotAPI:ApplyVerbForWho["igw:${Me.Name}","a school of bluefins","Fish"]
		wait 100
		
		Obj_OgreIH:ChangeCampSpot["248.787384,1.699008,160.903641"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["258.659698,2.597890,171.294098"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["212.276810,0.922248,200.674789"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;// Leviathor'Consuma
		Obj_OgreIH:SetCampSpot
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		Obj_OgreIH:ChangeCampSpot["209.972992,2.022804,203.551163"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 20
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 40
		/* Use fish from inventory near water to spawn named */
		OgreBotAPI:UseItem["${Me.Name}","Large bluefin"]
		wait 10
		Obj_OgreIH:ChangeCampSpot["214.778595,0.160574,198.829620"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 20
		Obj_OgreIH:SetUpFor
		wait 20
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 10
		Actor["Leviathor'Consuma"]:DoTarget
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}"
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Gather Remains"]
		wait 50
		call Obj_OgreIH.Get_Chest
		wait 10

        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return TRUE
        }
		return TRUE
	}

	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Uth'Gak the Grand Devotor
        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["234.724396,1.736045,191.227829"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["250.291840,3.080540,180.145477"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["270.200745,3.767527,164.536850"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["292.158295,7.593282,150.232285"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["302.139099,9.618788,142.773621"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["310.478516,12.158002,135.263687"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["321.443390,15.127945,130.591415"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["330.965485,17.606693,152.024506"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["348.979614,21.042553,163.394501"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["361.264404,23.907553,164.419785"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["379.593658,29.816132,161.618057"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["399.203522,38.044712,153.861282"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Porcupine"]
		wait 10

		;// Uth'Gak the Grand Devotor
		call Obj_OgreUtilities.PreCombatBuff 5
		Obj_OgreIH:ChangeCampSpot["413.042847,46.089954,142.978027"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreIH.KillAll "${_NamedNPC}" 
            wait 20
        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return FALSE
        }
		return TRUE
	}

	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Mucus of the Deep One
        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["419.128876,44.415100,135.712753"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["397.386108,35.719322,158.535080"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["358.555115,23.137072,167.257477"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["310.287323,11.869571,136.750992"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["328.402008,19.455378,112.548431"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["339.367401,24.631834,88.914398"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["351.392181,29.232941,60.049232"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["352.124969,30.999802,42.726994"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["351.590607,31.298370,24.973507"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["350.914642,31.186575,0.488488"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		
		;// Mucus of the Deep One
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["351.494507,30.684315,-3.544876"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 5
		Obj_OgreIH:SetUpFor
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		OgreBotAPI:CastAbility["all","Tortoise Shell"]
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Porcupine"]
		wait 10
		Actor["Mucus of the Deep One"]:DoTarget
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}"
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Gather Remains"]
		wait 50
		call Obj_OgreIH.Get_Chest
		wait 10
		
        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return TRUE
        }
		return TRUE
	}

	function:bool Named6(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Gok'Chai the Substantiator
        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["351.036316,29.608465,-17.348244"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["370.610138,29.018715,-37.391918"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["380.037140,29.234196,-59.400757"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["357.085541,29.249269,-92.347260"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["361.515503,30.964163,-110.575500"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["367.836243,33.934021,-136.155151"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["373.632263,38.112881,-149.627823"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["379.698730,42.580605,-163.182678"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["383.943604,46.440464,-174.018265"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["384.245361,48.615376,-180.171356"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["384.482941,48.755791,-180.823212"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["384.884186,49.059353,-182.189255"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		;//  Gok'Chai the Substantiator
		call Obj_OgreUtilities.PreCombatBuff 5
		Obj_OgreIH:ChangeCampSpot["387.505371,48.127926,-207.809235"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreIH.KillAll "${_NamedNPC}" 
            wait 20
        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return FALSE
        }
		return TRUE
	}

	function:bool Named7(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Leviathor'Glamar
        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["389.633026,48.195213,-212.393997"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["385.320099,45.841736,-171.751526"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["354.929443,28.927629,-89.749901"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["324.621582,29.430567,-92.017738"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["308.361694,31.123850,-116.558311"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["300.327789,30.065100,-128.138016"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["288.924500,26.856739,-142.732346"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["277.872955,23.168980,-152.935440"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["261.021637,17.534149,-165.477188"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["243.344025,12.971628,-181.336929"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["226.018784,6.732699,-202.315125"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["213.291901,1.300324,-218.324387"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["209.092865,1.550176,-222.723404"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["196.722351,2.256924,-232.953766"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["161.515930,0.813307,-218.532822"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["133.485504,1.241059,-201.050034"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["113.646301,1.268494,-206.526443"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["100.153717,1.277035,-213.966919"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["101.511482,0.601647,-227.467697"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["86.193069,1.292758,-228.728165"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["82.881981,0.978270,-250.484207"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["80.872169,1.111613,-270.681244"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["82.267181,1.235238,-288.438934"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["93.805687,1.269425,-299.929108"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["108.718452,0.602942,-296.440826"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["134.685120,0.683298,-292.116241"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["159.760422,0.627673,-291.304688"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["169.743698,0.659388,-264.534302"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["161.021927,0.640288,-231.747055"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["131.246185,0.697374,-229.095642"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["115.084686,0.704387,-236.981644"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		;// Leviathor'Glamar
		Obj_OgreIH:SetCampSpot
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		Obj_OgreIH:ChangeCampSpot["110.724243,1.132074,-250.437546"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 20
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 30
		Obj_OgreIH:SetUpFor
		wait 20
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 10
		Actor["Leviathor'Glamar"]:DoTarget
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}"
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Gather Remains"]
		wait 50
		call Obj_OgreIH.Get_Chest
		wait 10
		
        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return TRUE
        }
		return TRUE
	}

	function:bool Named8(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Kuom'Ziki the Prevailer
       	Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["105.336914,0.691938,-272.067688"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["97.975212,0.657959,-256.370026"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["97.220009,0.946193,-295.917114"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["85.151474,2.341135,-308.531830"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["71.630493,5.992616,-322.013702"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["59.379894,11.153712,-334.556519"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["49.389877,16.868671,-346.936981"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["37.353806,23.247267,-361.462189"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["25.745192,29.519440,-370.772308"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["18.066231,33.272156,-375.268341"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["11.512328,36.387638,-379.391052"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Porcupine"]
		wait 10
		Obj_OgreIH:ChangeCampSpot["8.580094,37.190289,-381.102570"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10

		;// Kuom'Ziki the Prevailer
		Obj_OgreIH:SetCampSpot
		wait 10
		Obj_OgreIH:ChangeCampSpot["0.775154,35.888577,-397.932617"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 10
		Obj_OgreIH:SetUpFor
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Porcupine"]
		wait 10
		Actor["Kuom'Ziki the Prevailer"]:DoTarget
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}"
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Gather Remains"]
		wait 50
		call Obj_OgreIH.Get_Chest
		wait 10
		
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return TRUE
        }
		return TRUE
	}

	function:bool Named9(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Bbal'Gaz the Enthraller
        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-2.296023,35.895611,-403.104828"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["11.256019,37.049812,-382.596252"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["47.684540,19.446577,-356.071564"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["103.254852,0.635503,-284.598938"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["82.151299,2.213956,-224.646423"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["64.532822,2.454839,-219.549942"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["41.149334,3.417648,-214.302383"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["22.353296,5.273884,-212.435455"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["8.025167,6.799564,-211.024185"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-9.755122,7.917771,-206.954407"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-33.268024,7.847781,-200.860397"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-55.762890,6.256380,-203.331802"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-79.474472,3.947865,-208.053833"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-89.383102,4.402445,-208.248627"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-102.429001,4.440525,-219.695801"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-111.803207,3.120125,-228.906921"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-107.668007,3.380168,-243.578552"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-119.993019,2.581034,-245.834381"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-120.345879,3.178182,-263.570282"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-122.209061,3.196743,-275.936035"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-127.676292,3.240070,-271.727844"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-138.394775,2.489756,-266.096069"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-153.676712,3.336375,-281.221771"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-163.224487,3.309253,-282.940155"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-165.948395,2.431906,-266.637665"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-169.907089,1.927065,-258.878082"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-172.020416,1.778386,-255.073853"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-174.350876,2.070791,-249.450485"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-178.042847,2.070791,-241.527969"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-187.921844,3.366849,-267.778625"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-197.258667,3.486673,-257.942932"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-213.980362,4.991392,-254.740936"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-226.462936,9.211940,-256.837341"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-240.391418,15.178098,-261.999268"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-253.229111,20.437544,-266.257629"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-268.199188,25.670078,-271.035797"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-283.738586,30.717926,-272.922791"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-291.036377,33.423592,-274.133698"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-298.310699,36.131973,-275.079315"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-300.076569,36.781712,-274.967102"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-305.019470,38.146717,-274.940460"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Porcupine"]
		wait 20
		OgreBotAPI:CastAbility_Relay["all","Hibernation"]
		wait 20
		
		;// Bbal'Gaz the Enthraller
		Obj_OgreIH:SetCampSpot
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		Obj_OgreIH:ChangeCampSpot["-325.627655,36.368786,-278.121155"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 5
		Obj_OgreIH:SetUpFor
		wait 10
		Actor["Bbal'Gaz the Enthraller"]:DoTarget
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}"
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Gather Remains"]
		wait 50
		call Obj_OgreIH.Get_Chest
		wait 20

        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return TRUE
        }
		return TRUE
	}

	function:bool Named10(string _NamedNPC="Doesnotexist")
	{
		;// Moving to Majora Leviathora
        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-330.605774,36.065300,-278.076477"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-331.646851,36.745373,-267.190887"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-327.141113,38.199596,-252.465195"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-326.719421,37.782955,-234.751648"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-328.699432,36.447155,-217.642822"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-328.699432,36.447155,-217.642822"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-336.392670,33.105427,-185.520172"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-339.110931,31.964806,-171.194168"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-339.456055,32.263519,-163.583710"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-343.070160,31.247459,-142.344849"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-328.046082,30.337772,-122.389038"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-366.362274,30.222929,-122.996239"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-406.746521,30.462179,-97.520988"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-413.146423,30.423698,-48.128876"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-386.533386,30.411306,-11.605376"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-334.092438,30.423697,-3.645986"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-299.604523,30.425154,-28.249001"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-297.057617,30.123644,-70.560616"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-317.922058,30.868900,-68.137650"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-351.838257,31.002808,-94.338051"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-387.211731,30.799623,-71.352936"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		
		;// Majora Leviathora
		Obj_OgreIH:SetCampSpot
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		Obj_OgreIH:ChangeCampSpot["-368.772308,31.567791,-45.459225"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 20
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 30
		Obj_OgreIH:SetUpFor
		wait 20
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Porcupine"]
		wait 30
		Actor["Majora Leviathora"]:DoTarget
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}"
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10
		OgreBotAPI:CastAbility_Relay["all","Gather Remains"]
		wait 50
		call Obj_OgreIH.Get_Chest
		wait 10
		
        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return TRUE
        }
		return TRUE
	}

	function:bool Named11(string _NamedNPC="Doesnotexist")
	{
		;//Moving to Blue Baron
        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-373.848694,30.897854,-39.041428"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-395.213806,30.446856,-49.801907"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-394.898682,30.184710,-95.433395"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-306.095184,30.528667,-111.421310"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-302.675537,30.926203,-117.046936"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-290.039825,31.982960,-121.698006"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-268.276184,27.822275,-145.416290"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-255.570358,23.984863,-158.756149"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-243.256485,18.733204,-168.583252"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-223.566040,10.067801,-184.254959"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-213.096008,6.502682,-196.799225"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-199.049774,4.132084,-210.805908"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-196.863678,3.314327,-223.198532"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-171.745331,3.074114,-272.600220"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-134.274780,4.133799,-289.545807"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-115.912109,-2.216173,-301.274414"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-100.005569,-2.206881,-311.848511"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
		Obj_OgreIH:ChangeCampSpot["-81.804314,-2.243418,-324.342377"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chest
		wait 10
			
		;// Blue Baron
		Obj_OgreIH:SetCampSpot
		wait 10
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		Obj_OgreIH:ChangeCampSpot["-63.586185,-2.221746,-339.723267"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 20
		Obj_OgreIH:SetUpFor
		wait 20
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 10
		Actor["The Blue Baron"]:DoTarget
		wait 600
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		Obj_OgreIH:ChangeCampSpot["-63.586185,-23.454485,-339.723267"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
		call Obj_OgreIH.Get_Chest
		wait 10
		
        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return TRUE
        }
		return TRUE

		wait 400
	}
}