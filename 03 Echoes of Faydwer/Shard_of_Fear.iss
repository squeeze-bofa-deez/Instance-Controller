;================================================================================
; Title: The Shard of Fear | Author: The Marty Party | Date: 07 Mar 2024 | Version: 2.0
;================================================================================

variable string sZoneName="Shard of Fear"
variable string sZoneShortName="shard_of_fear"
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
				eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name="The Shard of Fear"].ID} Enter the Shard of Fear
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time}: \agStarting to auto-run ${sZoneName}. Version: 2.0
					
        	Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "40"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[2]
		}

        if ${_StartingPoint} == 1
		{
			call This.Named1 "The Skeletal Destructor"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: The Skeletal Destructor"]
				return FALSE
			}
			_StartingPoint:Inc
		}   
     
		if ${_StartingPoint} == 2
		{
			call This.Named2 "Spinechill Venomfang"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Spinechill Venomfang"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Dracoliche"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Dracoliche"]
				return FALSE
			}
			_StartingPoint:Inc
		}	

		if ${_StartingPoint} == 4
		{
			call This.Named4 "Kyr'Tok"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Kyr'Tok"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		 if ${_StartingPoint} == 5
		{
			call This.Named5 "Fearmonger"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Fearmonger"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 6
		{
			call This.Named6 "Kza'Bok"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#6: The Skeletal Destructor"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 7
		{
			call This.Named7 "Dracoliche"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#7: Dracoliche"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 8
		{
			call This.Named8 "The Caretaker"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#8: The Caretaker"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 9
		{
			call This.Named9 "The Skeletal Lord"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#9: The Skeletal Lord"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 10
		{
			call This.Named10 "Terror"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#10: Terror"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		;//Finish zone (zone out)
		if ${_StartingPoint} == 11
		{
            Obj_OgreIH:LetsGo
        	eq2execute Target_None

			call Movetoloc "1.840139,36.152531,-435.727234"
			call Movetoloc "2.004151,12.817632,-412.322296"
			call Movetoloc "3.301099,-1.879076,-367.074951"
			Obj_OgreIH:ChangeCampSpot["2.982432,-6.302072,-359.419220"]
			wait 20
			oc !c -CS_ClearCampSpot igw:${Me.Name}
			oc !c -FlyDown
			wait 10
			oc !c -FlyStop
			wait 20
			call Movetoloc "147.392532,1.037414,-309.584900"
			call Movetoloc "5.337682,-1.492811,-257.190765"
			call Movetoloc "4.647557,12.996907,-104.511894"
			call Movetoloc "12.155289,49.279579,0.984652"
			call Movetoloc "72.327759,52.785973,1.871266"
			call Movetoloc "128.247406,57.307831,-15.356686"
			call Movetoloc "229.339294,58.020168,21.881876"
			call Movetoloc "189.696381,7.249128,320.725952"
			call Movetoloc "112.176216,4.374789,381.246216"
			call Movetoloc "-2.380213,11.564971,479.742889"

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
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 1 - The Skeletal Destructor          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-3.846791,11.564966,478.116150"
		call Movetoloc "21.848713,5.817113,416.217407"
		call Movetoloc "-11.538804,10.388317,313.048157"
		call Movetoloc "-59.851204,9.041076,294.271729"
		call Movetoloc "-178.030334,8.189329,342.580597"
		call Movetoloc "-190.775482,24.792496,401.296722"
		call Movetoloc "-203.262787,28.187679,439.705566"
		call Movetoloc "-229.297363,27.281084,441.605011"
		call Movetoloc "-245.712616,28.574440,416.619324"
		call Movetoloc "-231.894211,28.150501,393.378693"
		call Movetoloc "-202.851746,24.529360,390.566956"
		call Movetoloc "-216.609238,31.715210,416.340363"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 2 - Spinechill Venomfang          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		oc !c -Pause igw:${Me.Name}
        wait 10
		oc !c -ApplyVerbForWho igw:${Me.Name} "Skeletal Destructor's skull" "investigate the skull"
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "-180.185806,7.933929,344.447906"
		call Movetoloc "-118.548592,9.263172,313.566467"
		call Movetoloc "-3.530727,10.980764,313.044495 "
		call Movetoloc "29.119467,5.916119,436.631592"
		call Movetoloc "118.227684,4.084022,381.959076"
		call Movetoloc "198.509232,11.179199,305.259125"
		call Movetoloc "247.865219,28.513428,283.460449"
		call Movetoloc "257.520233,34.354553,298.705261"
		call Movetoloc "267.656281,14.006891,320.519531"
		call Movetoloc "277.773041,18.928249,301.782410"
		call Movetoloc "300.235199,13.858466,298.970612"
		call Movetoloc "315.139923,13.814945,324.065033"
		call Movetoloc "307.167358,13.556152,351.091797"
		call Movetoloc "275.593597,13.505184,354.919098"
		call Movetoloc "254.179337,11.649733,373.063965"
		call Movetoloc "324.101166,13.397428,354.147644"
		call Movetoloc "362.963867,15.043817,399.979187"
		call Movetoloc "390.271545,28.509695,398.457703"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call WaitForNamed
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 3 - The Skeletal Master          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "364.451477,16.056309,399.246185"
		call Movetoloc "328.534912,13.947462,366.697571"
		call Movetoloc "292.670227,13.558512,352.750427"
		call Movetoloc "290.861542,17.034819,326.140747"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 4 - Kyr'Tok          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		oc !c -Pause igw:${Me.Name}
        wait 10
		oc !c -ApplyVerbForWho igw:${Me.Name} "Skeletal Master's skull" "investigate the skull"
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "293.953003,12.777811,359.259918"
		call Movetoloc "256.275055,12.562155,360.178680"
		call Movetoloc "247.357086,28.303900,283.719452"
		call Movetoloc "299.927277,50.497459,240.591873"
		call Movetoloc "314.157135,61.573761,205.509018"
		call Movetoloc "308.930817,61.814728,141.843216"
		call Movetoloc "307.875122,73.190506,114.612022"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 30
		call Movetoloc "310.203857,78.097847,107.840858"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 5 - Fearmonger          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named5(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "308.958649,61.737061,136.758972"
		call Movetoloc "287.981262,61.307735,119.868027"
		call Movetoloc "308.674194,61.196522,119.900330"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Bladedance"]
		wait 30
		call Movetoloc "308.617859,61.930336,107.998528"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 6 - Kza'Bok          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named6(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "308.916565,61.190605,119.234840"
		call Movetoloc "287.202362,61.308365,119.467896"
		call Movetoloc "241.231522,57.039570,55.634327"
		call Obj_OgreUtilities.PreCombatBuff 5
		call Movetoloc "257.539490,56.066673,41.866760"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 7 - Dracoliche          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named7(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "249.354218,56.601452,12.251396"
		call Movetoloc "238.394684,56.452919,3.351530"
		;//First Caller
		oc !c -ChangeCampSpotWho ${Me.Name} 242.987289 57.702778 -4.296951
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 235.800369 56.918808 8.743260
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		eq2execute target a Thulian Caller
		call Obj_OgreUtilities.HandleWaitForCombat 10
		call PrepareToPlaceItem "a dead lizardman"
        wait 10
		oc !c -ChangeCampSpotWho ${Me.Name} 258.950134 58.575623 -27.999306
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		call PlaceItemNoChecks "a dead lizardman"
		OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		wait 5
		oc !c -ChangeCampSpotWho ${Me.Name} 238.394684 56.452919 3.351530
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		eq2execute Target_None
		call Obj_OgreUtilities.HandleWaitForCombat 10
		call FixView
		;//Second Caller
        OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		oc !c -ChangeCampSpotWho ${Me.Name} 258.950134 58.575623 -27.999306
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 271.648193 57.726837 -27.239639
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 258.950134 58.575623 -27.999306
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 238.394684 56.452919 3.351530
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		eq2execute target a Thulian Caller
		call Obj_OgreUtilities.HandleWaitForCombat 10
		call PrepareToPlaceItem "a dead lizardman"
        wait 10
		oc !c -ChangeCampSpotWho ${Me.Name} 258.950134 58.575623 -27.999306
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		call PlaceItemNoChecks "a dead lizardman"
		OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		wait 5
		oc !c -ChangeCampSpotWho ${Me.Name} 238.394684 56.452919 3.351530
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		eq2execute Target_None
		call Obj_OgreUtilities.HandleWaitForCombat 10
		call FixView
		;//Third Caller
		OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		oc !c -ChangeCampSpotWho ${Me.Name} 258.950134 58.575623 -27.999306
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 254.142532 57.726837 -38.468189
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 258.950134 58.575623 -27.999306
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		oc !c -ChangeCampSpotWho ${Me.Name} 238.394684 56.452919 3.351530
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		eq2execute target a Thulian Caller
		call Obj_OgreUtilities.HandleWaitForCombat 10
		call PrepareToPlaceItem "a dead lizardman"
        wait 10
		oc !c -ChangeCampSpotWho ${Me.Name} 258.950134 58.575623 -27.999306
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		call PlaceItemNoChecks "a dead lizardman"
		OgreBotAPI:Target["${Me.Name}","${Me.Name}"]
		wait 5
		oc !c -ChangeCampSpotWho ${Me.Name} 238.394684 56.452919 3.351530
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		eq2execute Target_None
		call Obj_OgreUtilities.HandleWaitForCombat 10
		call FixView
		call Movetoloc "246.202927,58.651207,-9.299348"
		call Movetoloc "258.018463,58.575542,-26.168758"
        oc !c -Pause igw:${Me.Name}
        wait 10
		oc !c -ApplyVerbForWho igw:${Me.Name} "heart_of_fear" "Pick up"
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "238.306915,56.374191,2.306271"
		call Movetoloc "181.914139,61.535992,1.782849"
		call Movetoloc "107.717537,56.966179,-15.612944"
		call Movetoloc "48.644409,51.282692,6.576245"
		call Movetoloc "-5.629417,49.851810,6.751636"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 30
		call Movetoloc "-50.430687,52.502903,1.181197"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call WaitForNamed
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 8 - The Caretaker          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named8(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "2.358747,49.297222,-2.052139"
		call Movetoloc "0.898574,34.172935,-67.972511"
		call Movetoloc "-3.373201,1.076686,-183.825089"
		call Movetoloc "-1.186762,-1.642754,-257.862183"
		call Movetoloc "-83.238441,0.268004,-271.046600"
		call Movetoloc "-130.727509,0.563460,-263.847900"
		call Movetoloc "-173.042389,1.027144,-225.649048"
		call Movetoloc "-199.138840,7.501280,-216.896179"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 30
		call Movetoloc "-232.485962,18.035357,-217.094009"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 9 - The Skeletal Lord          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named9(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-150.049423,0.496425,-232.637512"
		call Movetoloc "-89.735855,-1.091660,-304.081451"
		call Movetoloc "64.752312,0.339199,-280.605591"
		call Movetoloc "120.392914,0.323213,-311.882935"
		call Movetoloc "143.892914,0.125560,-326.595276"
		call Movetoloc "170.354080,1.540244,-324.791534"
		call Movetoloc "189.110550,7.295640,-303.206177"
		call Movetoloc "223.089600,-0.098183,-325.221039"
		call Movetoloc "231.898346,7.883441,-288.912079"
		call Movetoloc "229.838058,7.347484,-253.585922"
		call Movetoloc "208.340149,7.650663,-245.150833"
		call Movetoloc "177.260727,2.495302,-268.066620"
		call Movetoloc "191.948105,7.299803,-302.104462"
		call Movetoloc "209.628342,10.922079,-274.568970"
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
	}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 10 - Terror          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named10(string _NamedNPC="Doesnotexist")
	{
		echo ${Time}: Moving to ${_NamedNPC}
		oc !c -Pause igw:${Me.Name}
        wait 10
		oc !c -ApplyVerbForWho igw:${Me.Name} "Skeletal Lord's skull" "investigate the skull"
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "192.521393,7.303085,-301.165771"
		call Movetoloc "139.740433,0.089621,-327.209534"
		oc !c -Pause igw:${Me.Name}
        wait 10
		relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} Place Heart of Fear
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "135.722473,0.166585,-321.605438"
		call Movetoloc "124.789627,0.423566,-331.713196"
		Obj_OgreIH:ChangeCampSpot["120.986847,0.929931,-335.591217"]
		wait 20
		oc !c -CS_ClearCampSpot igw:${Me.Name}
		oc !c -FlyDown
		wait 10
		oc !c -FlyStop
		wait 20
		call Movetoloc "1.292689,-3.354752,-375.371582"
		call Movetoloc "1.783633,-3.346837,-387.680542"
		call Movetoloc "2.517439,51.692524,-467.605927"
		call Movetoloc "22.839073,46.315231,-446.604675"
		call Movetoloc "10.123634,36.194069,-441.431641"
		call Movetoloc "27.037628,36.399788,-440.066467"
		call Movetoloc "10.123238,26.500528,-431.007446"
		call Movetoloc "38.033024,27.055254,-428.835571"
		oc !c -Pause igw:${Me.Name}
        wait 10
		relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use skeletal master's heart of fear
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "13.511398,18.878584,-421.119965"
		call Movetoloc "44.629635,17.037619,-419.356384"
		oc !c -Pause igw:${Me.Name}
        wait 10
		relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use skeletal lord's heart of fear
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "11.096359,6.684845,-411.050140"
		call Movetoloc "53.854942,7.273705,-409.713348"
		oc !c -Pause igw:${Me.Name}
        wait 10
		relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use skeletal destructor's heart of fear
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "2.557263,-3.345994,-381.943054"
		call Movetoloc "1.781521,51.692524,-468.282135"
		call Movetoloc "-19.710703,46.315224,-447.342499"
		call Movetoloc "-6.245551,36.194073,-441.882019"
		call Movetoloc "-22.185623,36.194061,-439.846069"
		call Movetoloc "-6.244043,26.500523,-430.866180 "
		call Movetoloc "-32.758011,26.503822,-428.980774"
		oc !c -Pause igw:${Me.Name}
        wait 10
		relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use skeletal master's corrupted mind
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "-8.416605,18.878139,-420.733185"
		call Movetoloc "-40.815086,17.037779,-419.033417"
		oc !c -Pause igw:${Me.Name}
        wait 10
		relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use skeletal lord's corrupted mind
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "-8.289022,6.684845,-410.682251"
		call Movetoloc "-48.809883,7.273705,-409.053528"
		oc !c -Pause igw:${Me.Name}
        wait 10
		relay all eq2execute apply_verb ${Actor[Query,Type="NoKill NPC"&& Name=""].ID} use skeletal lord's corrupted mind
		wait 30
		oc !c -Resume igw:${Me.Name}
		call Movetoloc "1.932175,-3.347848,-378.426270"
		call Movetoloc "1.716435,17.805641,-417.325287"
		call Movetoloc "5.641672,36.831432,-436.408173"
		call Obj_OgreUtilities.PreCombatBuff 5
		OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
		wait 30
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Amygdalan Inquisitor",0,FALSE,FALSE]
		Ob_AutoTarget:AddActor["Amygdalan Knight",0,FALSE,FALSE]
        oc !c -ChangeCampSpotWho ${Me.Name} 1.083702 52.063770 -453.158417
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		oc !c -ChangeCampSpotWho ${Me.Name} -1.763619 45.366837 -444.969208
		call Obj_OgreUtilities.HandleWaitForCampSpot 30
		oc !c -Walk
		oc !c -Crouch
		call HandleNamed
		wait 10
		oc !c -Walk
		oc !c -Crouch
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
			;oc !c -cfw igw:${Me.Name} -Zone
			oc !c -CS_ClearCampSpot igw:${Me.Name}
			wait 10
			relay all face -5000 5000
			wait 10
            relay all press -hold ${OgreForwardKey}
            wait 30
            relay all press -release ${OgreForwardKey}
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
		call Obj_OgreUtilities.HandleWaitForCampSpot 5
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		call Obj_OgreIH.KillActorType 5
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
            while ${Me.InCombat}
                waitframe
        }
		call PostNamed
	}

	function WaitForNamed()
	{
		if ${Actor["${_NamedNPC}"](exists)}
		{
			if ${Actor["${_NamedNPC}"].Type.Equal["NamedNPC"]}
			{
				echo ${Time}: Waiting for ${_NamedNPC} to die.
				while ${Actor["${_NamedNPC}"].Type.Equal["NamedNPC"]}
					waitframe
				wait 10                
			}
		}
	}

    function PrepareToPlaceItem(string _actorName)
    {
        if ${Me.In3rdPersonView}
        {
            call Obj_OgreUtilities.Set_FirstPersonView
            wait 5
            call Obj_OgreUtilities.Set_LookDown 30	
            wait 5
        }
        Actor["${_actorName.Escape}"]:DoubleClick
        wait 5
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
    }

    function PlaceItemNoChecks(string _actorName)
    {
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
        wait 5
        Mouse:LeftClick    
        wait 20
    }

    function FixView()
    {
        call Obj_OgreUtilities.ResetCameraAngle
        call Obj_OgreUtilities.Set_ZoomOut 1
        wait 5
    }
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}
