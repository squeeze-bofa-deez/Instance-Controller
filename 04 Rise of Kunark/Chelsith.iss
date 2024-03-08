;================================================================================
; Title: Chelsith | Author: Unknown, Derf, The Marty Party | Date: 25 Jul 2023 | Version: 2.0
;================================================================================

variable string sZoneName="Chelsith"
variable string sZoneShortName="exp04_dun_chelsith"
variable string sZoneIn_ObjectName="zone_to_chelsith"
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
				Obj_OgreIH:Actor_Click["zone_to_chelsith"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time}: \agStarting to auto-run ${sZoneName}. Version: 2.0
			
        	Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController/RoK"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "25"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
		    ;_StartingPoint:Set[5]
		}

		if ${_StartingPoint} == 1
		{
			call This.Named1 "Leviathor'Tentar"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#1: Leviathor'Tentar"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 2
		{
			call This.Named2 "Krel'Vhap the Defeater"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#2: Krel'Vhap the Defeater"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Leviathor'Consuma"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#3: Leviathor'Consuma"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 4
		{
			call This.Named4 "Uth'Gak the Grand Devotor"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#4: Uth'Gak the Grand Devotor"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 5
		{
			call This.Named5 "Mucus of the Deep One"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#5: Mucus of the Deep One"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 6
		{
			call This.Named6 "Gok'Chai the Substantiator"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#6: Gok'Chai the Substantiator"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 7
		{
			call This.Named7 "Leviathor'Glamar"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#7: Leviathor'Glamar"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 8
		{
			call This.Named8 "Kuom'Ziki the Prevailer"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#8: Kuom'Ziki the Prevailer"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 9
		{
			call This.Named9 "Bbal'Gaz the Enthraller"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#9: Bbal'Gaz the Enthraller"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 10
		{
			call This.Named10 "Majora Leviathora"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#10: Majora Leviathora"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 11
		{
			call This.Named11 "The Blue Baron"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#11: The Blue Baron"]
				return FALSE
			}

			_StartingPoint:Inc
		}

		;// Finish zone (zone out)
        if ${_StartingPoint} == 12
        {
            Obj_OgreIH:LetsGo
        	eq2execute Target_None
			oc !c -cfw igw:${Me.Name} -Evac
			call Obj_OgreUtilities.HandleWaitForZoning
			call Movetoloc "-77.418983,31.438248,511.369080"

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

		call Movetoloc "596.634399,-52.971779,1249.753174"
		oc !c -FlyUp
		call Movetoloc "601.371826,-53.013847,1416.893188"
		call Movetoloc "567.915161,-52.906609,1422.953003"
		oc !c -FlyStop
		wait 10
		oc !c -FlyDown
		wait 210
		oc !c -FlyStop
		call Movetoloc "558.173157,-161.653534,1370.757568"
		call Movetoloc "566.146973,-153.681625,1340.314575"
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 1 - Leviathor'Tentar         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-70.576653,30.380865,510.627502"
		call AutoMend
		call Movetoloc "-72.796310,30.319704,512.341187"
		call Movetoloc "-0.652362,28.269640,500.006073"
		call Movetoloc "6.159122,21.895460,475.420410"
		call Movetoloc "-1.172125,4.512005,388.704865"
		call Movetoloc "-3.877893,4.578607,376.523743"
		call Movetoloc "-11.680809,4.228658,345.134186"
		call Movetoloc "-39.175045,1.494205,326.114929"
		call Movetoloc "-69.808167,0.252023,303.462067"
		call Movetoloc "-105.675941,1.866577,283.524567"
		call Movetoloc "-118.238899,1.913721,273.454651"
		call Movetoloc "-138.400925,3.174733,253.617401"
		call Movetoloc "-151.576096,2.347004,215.179001"
		call Movetoloc "-160.368179,2.311938,187.086731"
		call Movetoloc "-173.161240,1.593507,191.163651"
		call Movetoloc "-213.069885,1.966358,177.771469"
		call Movetoloc "-216.999817,0.994956,192.358047"
		call Movetoloc "-229.272675,1.122471,217.391373"
		call Movetoloc "-243.215775,2.303442,233.153122"
		call Movetoloc "-238.152847,3.024437,246.876480"
		call Movetoloc "-219.692902,2.291043,258.713135"
		call Movetoloc "-206.678619,1.519313,237.747513"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 2 - Krel'Vhap the Defeater      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-213.753326,0.909632,239.587631"
		call Movetoloc "-219.053848,1.169008,238.736176"
		call Movetoloc "-240.122833,3.288463,249.137955"
		call Movetoloc "-232.983200,1.838362,231.782150"
		call Movetoloc "-258.295715,7.171557,276.754150"
		call Movetoloc "-225.449677,23.613861,331.451324"
		call Movetoloc "-184.952240,37.245228,350.814636"
		call Movetoloc "-173.921890,38.825920,351.304047"
		call Movetoloc "-173.556152,38.877598,351.154510"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "-151.450928,37.302898,354.355530"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE	
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 3 - Leviathor'Consuma         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-144.985291,37.418785,356.561035"
		call Movetoloc "-162.795715,39.004204,354.584442"
		call Movetoloc "-216.950058,28.621954,342.514984"
		call Movetoloc "-257.340607,8.001931,281.431030"
		call Movetoloc "-240.845398,2.337672,237.272171"
		call Movetoloc "-228.383606,1.624884,234.760361"
		call Movetoloc "-189.127243,1.785305,250.999283"
		call Movetoloc "-166.002487,1.611409,228.288849"
		call Movetoloc "-138.265335,3.136741,252.641403"
		call Movetoloc "-24.444921,5.296670,335.172516"
		call Movetoloc "8.437989,4.578607,350.777924"
		call Movetoloc "8.817378,4.578611,358.273895"
		call Movetoloc "28.564400,6.011672,335.673523"
		call Movetoloc "57.626221,3.801482,315.089691"
		call Movetoloc "72.108253,4.198736,301.779388"
		call Movetoloc "88.106743,4.178310,281.504822"
		call Movetoloc "111.696823,4.077290,260.173889"
		call Movetoloc "135.201538,2.657748,246.649567"
		call Movetoloc "148.124222,2.452203,238.313583"
		call Movetoloc "143.662628,1.857656,217.987793"
		call Movetoloc "160.854004,0.822619,212.154465"
		call Movetoloc "166.275436,1.685839,254.978256"
		call Movetoloc "195.671112,1.742758,261.396820"
		call Movetoloc "213.125504,0.151051,234.496567"
		call Movetoloc "239.046677,1.667415,217.737411"
		call Movetoloc "238.626526,1.758232,201.923508"
		call Movetoloc "215.254288,1.501120,178.810287"
		call Movetoloc "179.408081,0.409547,193.742264"
		call Movetoloc "234.034378,-2.314055,153.531235"
		Actor[exactname,"a school of bluefins"]:DoTarget
		wait 5
		oc !c -ApplyVerbForWho ${Me.Name} "a school of bluefins" "Fish"
		wait 30
		call Movetoloc "234.034378,-2.314055,153.531235"
		Actor[exactname,"a school of bluefins"]:DoTarget
		wait 5
		oc !c -ApplyVerbForWho ${Me.Name} "a school of bluefins" "Fish"
		wait 30
		call Movetoloc "248.787384,1.699008,160.903641"
		call Movetoloc "258.659698,2.597890,171.294098"
		call Movetoloc "212.276810,0.922248,200.674789"
		;call Movetoloc "209.972992,2.022804,203.551163"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		oc !c -UseItem igw:${Me.Name} "Large bluefin"
		wait 10
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷     NAMED 4 - Uth'Gak the Grand Devotor     ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "234.724396,1.736045,191.227829"
		call Movetoloc "250.291840,3.080540,180.145477"
		call Movetoloc "270.200745,3.767527,164.536850"
		call Movetoloc "292.158295,7.593282,150.232285"
		call Movetoloc "302.139099,9.618788,142.773621"
		call Movetoloc "310.478516,12.158002,135.263687"
		call Movetoloc "321.443390,15.127945,130.591415"
		call Movetoloc "330.965485,17.606693,152.024506"
		call Movetoloc "348.979614,21.042553,163.394501"
		call Movetoloc "361.264404,23.907553,164.419785"
		call Movetoloc "379.593658,29.816132,161.618057"
		call Movetoloc "399.203522,38.044712,153.861282"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "413.042847,46.089954,142.978027"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 5 - Mucus of the Deep One       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "419.128876,44.415100,135.712753"
		call Movetoloc "397.386108,35.719322,158.535080"
		call Movetoloc "358.555115,23.137072,167.257477"
		call Movetoloc "310.287323,11.869571,136.750992"
		call Movetoloc "328.402008,19.455378,112.548431"
		call Movetoloc "339.367401,24.631834,88.914398"
		call Movetoloc "351.392181,29.232941,60.049232"
		call Movetoloc "352.124969,30.999802,42.726994"
		call Movetoloc "351.590607,31.298370,24.973507"
		call Movetoloc "350.914642,31.186575,0.488488"
		call Movetoloc "351.494507,30.684315,-3.544876"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷    NAMED 6 - Gok'Chai the Substantiator    ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named6(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "351.036316,29.608465,-17.348244"
		call Movetoloc "370.610138,29.018715,-37.391918"
		call Movetoloc "380.037140,29.234196,-59.400757"
		call Movetoloc "357.085541,29.249269,-92.347260"
		call Movetoloc "361.515503,30.964163,-110.575500"
		call Movetoloc "367.836243,33.934021,-136.155151"
		call Movetoloc "373.632263,38.112881,-149.627823"
		call Movetoloc "379.698730,42.580605,-163.182678"
		call Movetoloc "383.943604,46.440464,-174.018265"
		call Movetoloc "384.245361,48.615376,-180.171356"
		call Movetoloc "384.482941,48.755791,-180.823212"
		call Movetoloc "384.884186,49.059353,-182.189255"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "387.505371,48.127926,-207.809235"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 7 - Leviathor'Glamar         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named7(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "389.633026,48.195213,-212.393997"
		call Movetoloc "385.320099,45.841736,-171.751526"
		call Movetoloc "354.929443,28.927629,-89.749901"
		call Movetoloc "324.621582,29.430567,-92.017738"
		call Movetoloc "308.361694,31.123850,-116.558311"
		call Movetoloc "300.327789,30.065100,-128.138016"
		call Movetoloc "288.924500,26.856739,-142.732346"
		call Movetoloc "277.872955,23.168980,-152.935440"
		call Movetoloc "261.021637,17.534149,-165.477188"
		call Movetoloc "243.344025,12.971628,-181.336929"
		call Movetoloc "226.018784,6.732699,-202.315125"
		call Movetoloc "213.291901,1.300324,-218.324387"
		call Movetoloc "209.092865,1.550176,-222.723404"
		call Movetoloc "196.722351,2.256924,-232.953766"
		call Movetoloc "161.515930,0.813307,-218.532822"
		call Movetoloc "133.485504,1.241059,-201.050034"
		call Movetoloc "113.646301,1.268494,-206.526443"
		call Movetoloc "100.153717,1.277035,-213.966919"
		call Movetoloc "101.511482,0.601647,-227.467697"
		call Movetoloc "86.193069,1.292758,-228.728165"
		call Movetoloc "82.881981,0.978270,-250.484207"
		call Movetoloc "80.872169,1.111613,-270.681244"
		call Movetoloc "82.267181,1.235238,-288.438934"
		call Movetoloc "93.805687,1.269425,-299.929108"
		call Movetoloc "108.718452,0.602942,-296.440826"
		call Movetoloc "134.685120,0.683298,-292.116241"
		call Movetoloc "159.760422,0.627673,-291.304688"
		call Movetoloc "169.743698,0.659388,-264.534302"
		call Movetoloc "161.021927,0.640288,-231.747055"
		call Movetoloc "131.246185,0.697374,-229.095642"
		call Movetoloc "115.084686,0.704387,-236.981644"
		call Movetoloc "110.724243,1.132074,-250.437546"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 8 - Kuom'Ziki the Prevailer      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named8(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "105.336914,0.691938,-272.067688"
		call Movetoloc "97.975212,0.657959,-256.370026"
		call Movetoloc "97.220009,0.946193,-295.917114"
		call Movetoloc "85.151474,2.341135,-308.531830"
		call Movetoloc "71.630493,5.992616,-322.013702"
		call Movetoloc "59.379894,11.153712,-334.556519"
		call Movetoloc "49.389877,16.868671,-346.936981"
		call Movetoloc "37.353806,23.247267,-361.462189"
		call Movetoloc "25.745192,29.519440,-370.772308"
		call Movetoloc "18.066231,33.272156,-375.268341"
		call Movetoloc "11.512328,36.387638,-379.391052"
		call Movetoloc "8.580094,37.190289,-381.102570"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "0.775154,35.888577,-397.932617"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷      NAMED 9 - Bbal'Gaz the Enthraller      ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named9(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-2.296023,35.895611,-403.104828"
		call Movetoloc "11.256019,37.049812,-382.596252"
		call Movetoloc "47.684540,19.446577,-356.071564"
		call Movetoloc "103.254852,0.635503,-284.598938"
		call Movetoloc "82.151299,2.213956,-224.646423"
		call Movetoloc "64.532822,2.454839,-219.549942"
		call Movetoloc "41.149334,3.417648,-214.302383"
		call Movetoloc "22.353296,5.273884,-212.435455"
		call Movetoloc "8.025167,6.799564,-211.024185"
		call Movetoloc "-9.755122,7.917771,-206.954407"
		call Movetoloc "-33.268024,7.847781,-200.860397"
		call Movetoloc "-55.762890,6.256380,-203.331802"
		call Movetoloc "-79.474472,3.947865,-208.053833"
		call Movetoloc "-89.383102,4.402445,-208.248627"
		call Movetoloc "-102.429001,4.440525,-219.695801"
		call Movetoloc "-111.803207,3.120125,-228.906921"
		call Movetoloc "-107.668007,3.380168,-243.578552"
		call Movetoloc "-119.993019,2.581034,-245.834381"
		call Movetoloc "-120.345879,3.178182,-263.570282"
		call Movetoloc "-122.209061,3.196743,-275.936035"
		call Movetoloc "-127.676292,3.240070,-271.727844"
		call Movetoloc "-138.394775,2.489756,-266.096069"
		call Movetoloc "-153.676712,3.336375,-281.221771"
		call Movetoloc "-163.224487,3.309253,-282.940155"
		call Movetoloc "-165.948395,2.431906,-266.637665"
		call Movetoloc "-169.907089,1.927065,-258.878082"
		call Movetoloc "-172.020416,1.778386,-255.073853"
		call Movetoloc "-174.350876,2.070791,-249.450485"
		call Movetoloc "-178.042847,2.070791,-241.527969"
		call Movetoloc "-187.921844,3.366849,-267.778625"
		call Movetoloc "-197.258667,3.486673,-257.942932"
		call Movetoloc "-213.980362,4.991392,-254.740936"
		call Movetoloc "-226.462936,9.211940,-256.837341"
		call Movetoloc "-240.391418,15.178098,-261.999268"
		call Movetoloc "-253.229111,20.437544,-266.257629"
		call Movetoloc "-268.199188,25.670078,-271.035797"
		call Movetoloc "-283.738586,30.717926,-272.922791"
		call Movetoloc "-291.036377,33.423592,-274.133698"
		call Movetoloc "-298.310699,36.131973,-275.079315"
		call Movetoloc "-300.076569,36.781712,-274.967102"
		call Movetoloc "-305.019470,38.146717,-274.940460"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "-325.627655,36.368786,-278.121155"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷        NAMED 10 - Majora Leviathora        ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named10(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-330.605774,36.065300,-278.076477"
		call Movetoloc "-331.646851,36.745373,-267.190887"
		call Movetoloc "-327.141113,38.199596,-252.465195"
		call Movetoloc "-326.719421,37.782955,-234.751648"
		call Movetoloc "-328.699432,36.447155,-217.642822"
		call Movetoloc "-328.699432,36.447155,-217.642822"
		call Movetoloc "-336.392670,33.105427,-185.520172"
		call Movetoloc "-339.110931,31.964806,-171.194168"
		call Movetoloc "-339.456055,32.263519,-163.583710"
		call Movetoloc "-343.070160,31.247459,-142.344849"
		call Movetoloc "-328.046082,30.337772,-122.389038"
		call Movetoloc "-366.362274,30.222929,-122.996239"
		call Movetoloc "-406.746521,30.462179,-97.520988"
		call Movetoloc "-413.146423,30.423698,-48.128876"
		call Movetoloc "-386.533386,30.411306,-11.605376"
		call Movetoloc "-334.092438,30.423697,-3.645986"
		call Movetoloc "-299.604523,30.425154,-28.249001"
		call Movetoloc "-297.057617,30.123644,-70.560616"
		call Movetoloc "-317.922058,30.868900,-68.137650"
		call Movetoloc "-351.838257,31.002808,-94.338051"
		call Movetoloc "-387.211731,30.799623,-71.352936"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		call Movetoloc "-368.772308,31.567791,-45.459225"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 30
		call HandleNamed
		return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 11 - The Blue Baron          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named11(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-373.848694,30.897854,-39.041428"
		call Movetoloc "-395.213806,30.446856,-49.801907"
		call Movetoloc "-394.898682,30.184710,-95.433395"
		call Movetoloc "-306.095184,30.528667,-111.421310"
		call Movetoloc "-302.675537,30.926203,-117.046936"
		call Movetoloc "-290.039825,31.982960,-121.698006"
		call Movetoloc "-268.276184,27.822275,-145.416290"
		call Movetoloc "-255.570358,23.984863,-158.756149"
		call Movetoloc "-243.256485,18.733204,-168.583252"
		call Movetoloc "-223.566040,10.067801,-184.254959"
		call Movetoloc "-213.096008,6.502682,-196.799225"
		call Movetoloc "-199.049774,4.132084,-210.805908"
		call Movetoloc "-196.863678,3.314327,-223.198532"
		call Movetoloc "-171.745331,3.074114,-272.600220"
		call Movetoloc "-134.274780,4.133799,-289.545807"
		call Movetoloc "-115.912109,-2.216173,-301.274414"
		call Movetoloc "-100.005569,-2.206881,-311.848511"
		call Movetoloc "-81.804314,-2.243418,-324.342377"
		call Movetoloc "-63.586185,-2.221746,-339.723267"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 20
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		eq2execute target The Blue Baron
		wait 200
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
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		call Obj_OgreIH.KillActorType 10
        eq2execute summon
		call Obj_OgreUtilities.WaitForLootWindow
		oc !c -CastAbility All Gather Remains
		wait 45
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10
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

	function AutoMend()
	{
		oc Using your tank's repair bot.
		oc !ci -UseItem igw:${Me.Name}+fighter "Mechanized Platinum Repository of Reconstruction"
		wait 70
		if !${Actor[Query,Name=="Mechanized Platinum Repository of Reconstruction"](exists)}
		{
			oc Tank's repair bot not available, trying your bard.
			oc !ci -UseItem igw:${Me.Name}+bard "Mechanized Platinum Repository of Reconstruction"
		wait 50
		}
		if !${Actor[Query,Name=="Mechanized Platinum Repository of Reconstruction"](exists)}
		{
			oc Bard's repair bot not available, trying your chanter.
			oc !ci -UseItem igw:${Me.Name}+enchanter "Mechanized Platinum Repository of Reconstruction"
			wait 50
		}
		if !${Actor[Query,Name=="Mechanized Platinum Repository of Reconstruction"](exists)}
		{
			oc Chanter's repair bot not available, trying your priests.
			oc !ci -UseItem igw:${Me.Name}+shaman "Mechanized Platinum Repository of Reconstruction"
			wait 50
		}
		if !${Actor[Query,Name=="Mechanized Platinum Repository of Reconstruction"](exists)}
		{
			oc Chanter's repair bot not available, trying your priests.
			oc !ci -UseItem igw:${Me.Name}+cleric "Mechanized Platinum Repository of Reconstruction"
			wait 50
		}
		if !${Actor[Query,Name=="Mechanized Platinum Repository of Reconstruction"](exists)}
		{
			oc Chanter's repair bot not available, trying your priests.
			oc !ci -UseItem igw:${Me.Name}+druid "Mechanized Platinum Repository of Reconstruction"
			wait 50
		}
		if !${Actor[Query,Name=="Mechanized Platinum Repository of Reconstruction"](exists)}
		{
			oc Priest's repair bot not available, trying your scouts.
			oc !ci -UseItem igw:${Me.Name}+scout "Mechanized Platinum Repository of Reconstruction"
			wait 50
		}
		if !${Actor[Query,Name=="Mechanized Platinum Repository of Reconstruction"](exists)}
		{
			oc Scout's repair bot not available, trying your mages.
			oc !ci -UseItem igw:${Me.Name}+mage "Mechanized Platinum Repository of Reconstruction"
			wait 50
		}
		oc !ci -repair igw:${Me.Name}
		wait 30
	}
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}
