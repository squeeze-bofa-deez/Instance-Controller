;// Specific to the zone
variable string sZoneName="Nektropos Castle: The Return"

;// Common to the zone category (IE: fire zones)
variable string sZoneShortName="nektropos_castle"

;// Need this include, it handles a lot of the variable creation.
#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0, ... Args)
{
	;// This creates all the required variables, and calls "RunInstances". 
	call function_Handle_Startup_Process ${_StartingPoint} "-NoAutoLoadMapOnZone" ${Args.Expand}
}

;// This is optional. I like it so I can confirm when the file has been exited.
atom atexit()
{
	echo ${Time}: ${Script.Filename} done
}

;// This object definition must be exactly this name.
objectdef Object_Instance
{
    ;// This is our main function. The name must be exactly this.
	function:bool RunInstance(int _StartingPoint=0)
	{
		; Tested 1-6
		; TODO: Test 7-16
		;_StartingPoint:Set[9]


        ;// While you can do anything you want here, this will handle getting into any zone from the mission area. If you'd like to customize it, you're free to do so!
		if ${_StartingPoint} == 0
		{
			if !${Obj_OgreUtilities.NearLoc["-1404.338989,121.759949,-1856.465698"]}
			{
				echo "Move Closer to the door Nek Castle door (-1404.338989,121.759949,-1856.465698)"
				return False

			}
			oc !ci -Zone
			oc !ci -ZoneDoor 2
			call Obj_OgreUtilities.HandleWaitForZoning 
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}
			Ogre_Instance_Controller:ZoneSet
			
			call Obj_OgreIH.Set_VariousOptions
			oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_facenpc TRUE
			
			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
		}

		Obj_OgreIH:Set_Follow
        ;// Now it's your turn! Start coding. I've left in an example of a named to give you a starting point.
        if ${_StartingPoint} == 1
		{
			call This.Named1 "Demitry the Ravager"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Demitry the Ravager"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 2
		{
			call This.Named2 "Unargin the Blacksmith"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Unargin the Blacksmith"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "Butler Balthazen"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Butler Balthazen"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		
		if ${_StartingPoint} == 4
		{
			call This.Named4 "The Burning Soul"

			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: The Burning Soul"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 5
		{
			call This.Named5 "The Spirit Sucker"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: The Spirit Sucker"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 6
		{
			call This.Named6 "Torturess Amanda"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#6: Torturess Amanda"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 7
		{
			call This.Named7 "Chalandria the Queen of the Cursed"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#7: Chalandria the Queen of the Cursed"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 8
		{
			call This.Named8 "The Cursed Remains of Sheila Everling"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#8: The Cursed Remains of Sheila Everling"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 9
		{
			call This.Named9 "Groundskeeper Edgan"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#9: Groundskeeper Edgan"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 10
		{
			call This.Named10 "The Cursed Remains of Jenni Everling"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#10: The Cursed Remains of Jenni Everling"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 11
		{
			call This.Named11 "The Cursed Remains of Crysta Everling"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#11: The Cursed Remains of Crysta Everling"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 12
		{
			call This.Named12 "Chef Callistan"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#12: Chef Callistan"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 13
		{
			call This.Named13 "The Cursed Remains of Deirdra Everling"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#13: The Cursed Remains of Deirdra Everling"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 14
		{
			call This.Named14 "The Cursed Remains of Alana Everling"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#14: The Cursed Remains of Alana Everling"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 15
		{
			call This.Named15 "The Cursed Remains of Melanie Everling"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#15: The Cursed Remains of Melanie Everling"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}
		if ${_StartingPoint} == 16
		{
			call This.Named16 "Lord Everling"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#16: Lord Everling"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chest
			_StartingPoint:Inc
		}


        return TRUE
    }

	; Demitry the Ravager
    function Named1(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "0.259765,-0.429622,29.788170"
		call This.MoveToNextWaypoint "-0.074040,-0.497908,11.461534"
		call This.MoveToNextWaypoint "-0.722269,-0.295168,-12.689919"
		if ${This.NamedIsUp["${_NamedNPC}"]}
		{
			call This.MoveToNextWaypoint "-23.667551,-0.032698,-13.209455"
			call This.MoveToNextWaypoint "-23.189110,0.002500,-28.052589"
			call This.KillNamed "${_NamedNPC}"  "-23.189110,0.002500,-28.052589"
			call This.MoveToNextWaypoint "-23.682865,-0.028021,-12.110178"
			Obj_OgreUtilities:WaitForPower
			call This.MoveToNextWaypoint "-5.157742,-0.095456,-13.329045"
		}
		else
		{
			oc "${_NamedNPC} is not up, skipping"
		}
		
		return TRUE
    }

	; Unargin the Blacksmith
    function Named2(string _NamedNPC="Doesnotexist")
	{
		
		if ${This.NamedIsUp["${_NamedNPC}"]}
		{
			OgreBotAPI:ApplyVerb["door_01_01", "use"]
			call This.MoveToNextWaypoint "-5.854615,0.002500,-27.335642"
			call This.KillNamed "${_NamedNPC}" "-5.854615,0.002500,-27.335642"
			call This.MoveToNextWaypoint "-5.323250,0.002500,-24.668442"
			OgreBotAPI:ApplyVerb["door_01_01", "use"]
			call This.MoveToNextWaypoint "-5.157742,-0.095456,-13.329045"
		}
		else 
		{
			oc "${_NamedNPC} is not up, skipping"
		}
		
		return TRUE
    }

	;Butler Balthazen
    function Named3(string _NamedNPC="Doesnotexist")
	{
		
		call This.MoveToNextWaypoint "5.452055,-0.001113,-18.840702"
		OgreBotAPI:ApplyVerb["${Actor[Query, Name =- "door_" && Distance < "5"]}", "use"]
		call This.MoveToNextWaypoint "5.152464,0.000345,-11.115710"
		Obj_OgreIH:KillAll["a flesh rampager"]
		call This.MoveToNextWaypoint "-11.285296,-0.168416,-0.056270"
		OgreBotAPI:ApplyVerb["${Actor[Query, Name =- "door_" && Distance < "5"]}", "use"]
		call This.MoveToNextWaypoint "-5.333149,-0.502629,-0.117117"
		Obj_OgreIH:KillAll["a flesh rampager"]
		Obj_OgreUtilities:WaitForPower
		call This.MoveToNextWaypoint "11.514637,-0.158634,-0.165074"
		OgreBotAPI:ApplyVerb["door_03_01", "use"]
		call This.MoveToNextWaypoint "20.120840,-0.693889,-0.321678"
		call This.MoveToNextWaypoint "30.565928,-0.187078,-1.116585"
		call This.MoveToNextWaypoint "42.899059,0.002500,0.132360"
		call This.MoveToNextWaypoint "42.578438,0.057585,-8.107603"
		call This.MoveToNextWaypoint "54.813274,-0.070481,-7.635043"
		call This.MoveToNextWaypoint "53.702137,0.019857,-17.687498"
		call This.MoveToNextWaypoint "45.336536,-0.005866,-17.517113"
		call This.MoveToNextWaypoint "40.974354,-0.075664,-17.641489"
		OgreBotAPI:ApplyVerb["door_04_00", "use"]
		call This.MoveToNextWaypoint "36.102493,-0.003719,-17.780397"
		if ${This.NamedIsUp["${_NamedNPC}"]}
		{
			call This.KillNamed "${_NamedNPC}" "36.102493,-0.003719,-17.780397"
		}
		else
		{
			oc "${_NamedNPC} is not up, skipping"
		}

		return TRUE
    }

	; The Burning Soul
	function Named4(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "36.102493,-0.003719,-17.780397"
		call This.MoveToNextWaypoint "31.121996,-0.220696,-27.318396"
		call This.MoveToNextWaypoint "36.754601,0.002500,-30.848351"
		OgreBotAPI:ApplyVerb["door_05_00", "use"]
		call This.WaitForNamedToBecomeAttackable "${_NamedNPC}"
		call This.KillTrash

		if ${This.NamedIsUp["${_NamedNPC}"]}
		{
			call This.KillNamed "${_NamedNPC}" "31.121996,-0.220696,-27.318396"
		}
		

		return TRUE
	}

	; The Spirit Sucker
	function Named5(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "36.754601,0.002500,-30.848351"
		OgreBotAPI:ApplyVerb["door_05_00", "use"]
		call This.MoveToNextWaypoint "42.793728,0.002500,-31.237871"
		call This.MoveToNextWaypoint "42.927654,0.078970,-62.061714"
		call This.MoveToNextWaypoint "32.628750,0.164393,-62.476990"
		call This.MoveToNextWaypoint "31.961206,0.029762,-75.970802"
		call This.MoveToNextWaypoint "4.910033,-1.194990,-75.787613"
		call This.MoveToNextWaypoint "5.427413,0.085170,-64.991859"
		call This.MoveToNextWaypoint "-10.500167,0.016105,-64.749634"
		call This.MoveToNextWaypoint "-10.263272,0.203678,-75.278900"
		call This.MoveToNextWaypoint "-33.135921,-0.295540,-75.657494"
		call This.MoveToNextWaypoint "-32.782627,-0.576773,-61.419724"
		call This.MoveToNextWaypoint "-49.647240,-0.715343,-62.095875"
		call This.MoveToNextWaypoint "-49.344620,0.467595,-38.093296"
		call This.MoveToNextWaypoint "-49.171040,0.260678,-7.927454"
		call This.KillNamed "${_NamedNPC}" "-49.171040,0.260678,-7.927454"
		call This.MoveToNextWaypoint "-49.654602,0.289948,-8.909170"

		return TRUE
	}

	;Torturess Amanda and/or Watchman Gantder 
	function Named6(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "-34.273861,-0.511912,-7.672253"
		call This.MoveToNextWaypoint "-34.905830,-0.000225,8.642171"
		call This.MoveToNextWaypoint "-44.131878,0.253241,7.796237"
		call This.MoveToNextWaypoint "-43.275070,-0.194755,17.650410"

		; can't pull the whole room, so pull some trash outside first
		; before we bail out.

		; campspoting group & pulling back to tghe group with tank
		oc !ci -ChangeCampSpotWho ${Me.Name} -39.518730 0.318197 18.037550 
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		OgreBotAPI:ApplyVerb["door_07_00", "use"]
		oc !ci -ChangeCampSpotWho ${Me.Name} -29.889210 0.002500 17.228897
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		oc !ci -ChangeCampSpotWho ${Me.Name} -43.275070 -0.194755 17.650410
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call This.KillTrash

		; now lets go in and kill the named(s)
		call This.MoveToNextWaypoint "-35.619625,-0.105254,17.730089"
		OgreBotAPI:ApplyVerb["door_07_00", "use"]
		call This.MoveToNextWaypoint "-28.283068,0.022814,17.829285"
		call This.MoveToNextWaypoint "-27.555054,0.157926,25.901346"
		call This.MoveToNextWaypoint "-26.862759,0.237214,17.639032"
		OgreBotAPI:ApplyVerb["door_07_00", "use"]
		call This.MoveToNextWaypoint "-44.216511,-0.162215,17.563702"

		return TRUE
	}

	; Chalandria the Queen of the Cursed
	function Named7(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "-31.206127,-0.001431,17.693386"
		OgreBotAPI:ApplyVerb["door_07_00", "use"]
		call This.MoveToNextWaypoint "-44.359089,-0.143941,17.942152"
		call This.MoveToNextWaypoint "-42.992008,-0.050796,27.535843"
		call This.MoveToNextWaypoint "-54.598652,0.012313,26.955034"
		call This.MoveToNextWaypoint "-54.047043,0.052135,43.584072"
		call This.MoveToNextWaypoint "-42.890148,0.002500,43.342709"
		call This.MoveToNextWaypoint "-43.503689,-1.283182,54.657768"
		call This.MoveToNextWaypoint "-42.984131,-0.482706,66.216377"
		call This.MoveToNextWaypoint "-27.937180,0.173831,65.966606"
		call This.MoveToNextWaypoint "-8.930157,-0.144796,66.319046"
		call This.KillNamed "${_NamedNPC}" "-8.930157,-0.144796,66.319046"

		return TRUE
	}

	; The Cursed Remains of Sheila Everling
	function Named8(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "-9.084872,-0.155977,66.818115"
		call This.MoveToNextWaypoint "-20.272165,-0.101176,66.341682"
		OgreBotAPI:ApplyVerb["door_09", "use"]
		call This.MoveToNextWaypoint "-20.385336,0.002500,76.171509"
		call This.MoveToNextWaypoint "-29.904829,-0.252153,75.853737"
		call This.MoveToNextWaypoint "-42.104706,0.002500,75.556152"
		call This.MoveToNextWaypoint "-48.656086,0.002500,75.396362"
		call This.MoveToNextWaypoint "-55.947327,0.002500,74.041237"
		call This.MoveToNextWaypoint "-55.947498,7.737494,85.641098"
		call This.MoveToNextWaypoint "-46.933056,13.501074,85.083969"
		call This.MoveToNextWaypoint "-44.656403,13.509096,76.091331"
		call This.MoveToNextWaypoint "-54.591228,13.338634,75.642982"
		
		call This.WaitForNamedToBecomeAttackable "${_NamedNPC}"

		call This.KillNamed "${_NamedNPC}", "-47.374050,13.895311,70.261238"

		return TRUE
	}

	; Groundskeeper Edgan
	function Named9(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "-43.628513,13.502501,73.377228"
		OgreBotAPI:ApplyVerb["door_10", "use"]
		call This.MoveToNextWaypoint "-36.443779,14.135035,65.898224"
		call This.MoveToNextWaypoint "-35.715961,13.359649,46.970882"
		call This.MoveToNextWaypoint "-44.781090,12.726518,47.290035"
		call This.MoveToNextWaypoint "-45.268421,12.948594,20.786308"
		call This.MoveToNextWaypoint "-35.568939,13.508295,20.113533"
		OgreBotAPI:ApplyVerb["door_11", "use"]
		call This.MoveToNextWaypoint "-28.519875,13.572936,20.198069"
		
		call This.KillNamed "${_NamedNPC}"

		return TRUE
	}

	;The Cursed Remains of Jenni Everling
	function Named10(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "-31.956419,13.502501,20.207567"
		OgreBotAPI:ApplyVerb["door_11", "use"]
		call This.MoveToNextWaypoint "-45.796051,13.041980,19.592009"
		call This.MoveToNextWaypoint "-44.480003,13.502500,7.874998"
		call This.MoveToNextWaypoint "-27.705231,13.502500,8.325558"
		call This.MoveToNextWaypoint "-27.175848,13.502501,0.258063"
		call This.MoveToNextWaypoint "-53.505783,13.497094,-0.276246"
		OgreBotAPI:ApplyVerb["door_12", "use"]
		call This.MoveToNextWaypoint "-64.238708,13.476756,0.494727"
		call This.MoveToNextWaypoint "-69.140717,13.502501,-6.816412"
		
		call This.WaitForNamedToBecomeAttackable "${_NamedNPC}"
		call This.KillNamed "${_NamedNPC}", "-76.594254,13.502501,5.350315"

		return TRUE
	}

	;The Cursed Remains of Crysta Everling
	function Named11(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "-68.849785,13.502500,-0.298071"
		OgreBotAPI:ApplyVerb["door_12", "use"]
		call This.MoveToNextWaypoint "-27.598585,13.502500,-0.460121"
		call This.MoveToNextWaypoint "-28.278952,13.502500,-8.990225"
		call This.MoveToNextWaypoint "-45.416927,12.296929,-7.804706"
		call This.MoveToNextWaypoint "-45.250790,13.694584,-28.300953"
		call This.MoveToNextWaypoint "-38.955902,13.502500,-28.457729"
		call This.MoveToNextWaypoint "-35.609943,13.502501,-28.244972"
		OgreBotAPI:ApplyVerb["door_13", "use"]
		call This.MoveToNextWaypoint "-26.561171,13.502501,-28.210005"
		call This.MoveToNextWaypoint "-20.379223,13.757372,-31.326979"
		oc !ci -letsgo
		oc !ci -special igw:${Me.Name}
		wait 40
		call This.MoveToNextWaypoint "48.728924,13.703532,-17.685776"
		call This.MoveToNextWaypoint "38.852768,13.472637,-16.309002"
		OgreBotAPI:ApplyVerb["door_14", "use"]
		call This.MoveToNextWaypoint "29.598923,13.802415,-16.387537d"
		OgreBotAPI:ApplyVerb["door_14", "use"]
		call This.MoveToNextWaypoint "49.092094,13.682255,-16.264786"
		call This.MoveToNextWaypoint "48.894611,13.871531,-7.979032"
		call This.MoveToNextWaypoint "36.894707,13.006035,-8.437075"
		call This.MoveToNextWaypoint "37.258305,12.467759,-0.318251"
		call This.MoveToNextWaypoint "51.485134,13.490030,-0.342905"
		call This.MoveToNextWaypoint "56.563816,13.499046,0.062129"
		OgreBotAPI:ApplyVerb["door_15", "use"]
		call This.MoveToNextWaypoint "65.365875,13.502500,-0.217131"
		call This.MoveToNextWaypoint "75.601685,13.502500,1.327981"
		
		call This.WaitForNamedToBecomeAttackable "${_NamedNPC}"
		call This.KillNamed "${_NamedNPC}", "79.851517,13.650186,-0.226495"

		return TRUE
	}

	; Chef Callistan
	function Named12(string _NamedNPC="Doesnotexist")
	{
		; Add check to see if he's up
		call This.MoveToNextWaypoint "62.918488,13.502500,-0.161389"
		OgreBotAPI:ApplyVerb["door_15", "use"]
		call This.MoveToNextWaypoint "36.302650,12.571517,-0.439800"
		call This.MoveToNextWaypoint "36.877518,13.478261,8.625248"
		call This.MoveToNextWaypoint "49.514622,13.427365,8.009789"
		call This.MoveToNextWaypoint "49.109852,12.694846,16.183773"
		call This.MoveToNextWaypoint "37.005440,13.554825,16.028769"
		OgreBotAPI:ApplyVerb["door_16", "use"]
		call This.MoveToNextWaypoint "29.920315,13.607787,16.255463"
		call This.KillNamed "${_NamedNPC}" "29.920315,13.607787,16.255463"

		return TRUE
		
	}

	; The Cursed Remains of Deirdra Everling
	function Named13(string _NamedNPC="Doesnotexist")
	{
		OgreBotAPI:ApplyVerb["door_16", "use"]
		call This.MoveToNextWaypoint "48.817768,12.726381,16.132338"
		call This.MoveToNextWaypoint "49.608330,14.024000,28.760738"
		call This.MoveToNextWaypoint "38.750233,13.511145,29.737589"
		OgreBotAPI:ApplyVerb["door_17", "use"]
		call This.MoveToNextWaypoint "26.996426,12.678009,29.063690"
		OgreBotAPI:ApplyVerb["door_17", "use"]
		call This.MoveToNextWaypoint "48.589127,14.062851,29.364443"
		call This.MoveToNextWaypoint "49.000263,13.732147,47.198853"
		call This.MoveToNextWaypoint "38.185177,13.813270,46.716854"
		call This.MoveToNextWaypoint "37.232330,13.834101,64.852257"
		call This.MoveToNextWaypoint "42.016838,13.624345,70.323898"
		OgreBotAPI:ApplyVerb["door_18", "use"]
		call This.MoveToNextWaypoint "51.049557,13.452806,83.208694"
		call This.MoveToNextWaypoint "46.106422,13.520792,86.139961"
		call This.WaitForNamedToBecomeAttackable "${_NamedNPC}"
		call This.KillNamed "${_NamedNPC}", "42.014393,13.897952,83.133133"

		return TRUE
	}
	
	; The Cursed Remains of Alana Everling
	function Named14(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "56.631962,13.502500,84.298294"
		
		oc !ci -letsgo
		oc !ci -special igw:${Me.Name}
		wait 40
		
		call This.MoveToNextWaypoint "43.661133,14.156154,-56.606556"
		call This.MoveToNextWaypoint "28.894815,12.977839,-57.647549"
		call This.MoveToNextWaypoint "28.756403,13.052818,-72.868401"
		call This.MoveToNextWaypoint "8.242057,14.077229,-72.560402"
		call This.MoveToNextWaypoint "7.503373,13.833146,-65.265831"
		call This.MoveToNextWaypoint "-8.631652,13.157248,-65.962212"
		call This.MoveToNextWaypoint "-7.818065,13.785109,-73.424049"
		call This.MoveToNextWaypoint "-27.263502,12.916298,-73.213333"
		call This.MoveToNextWaypoint "-29.323336,14.106969,-56.850266"
		call This.MoveToNextWaypoint "-40.207947,13.502500,-69.608696"
		OgreBotAPI:ApplyVerb["door_22", "use"]
		call This.MoveToNextWaypoint "-46.629150,13.502501,-76.494637"
		call This.MoveToNextWaypoint "-46.672421,13.502500,-83.342506"
		
		call This.WaitForNamedToBecomeAttackable "${_NamedNPC}"
		call This.KillNamed "${_NamedNPC}", "-40.382298,13.701579,-77.958664"

		return TRUE
	}

	; The Cursed Remains of Melanie Everling
	function Named15(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "-45.300911,13.502501,-74.768593"
		OgreBotAPI:ApplyVerb["door_22", "use"]
		call This.MoveToNextWaypoint "-27.661234,14.071197,-58.568314"
		call This.MoveToNextWaypoint "-27.376753,12.862178,-73.677071"
		call This.MoveToNextWaypoint "-7.524272,13.863936,-72.897713"
		call This.MoveToNextWaypoint "-7.434758,13.216140,-64.609360"
		call This.MoveToNextWaypoint "8.258400,14.014200,-66.982964"
		call This.MoveToNextWaypoint "8.823439,14.018828,-73.038750"
		call This.MoveToNextWaypoint "29.396208,13.177534,-72.770752"
		call This.MoveToNextWaypoint "28.797667,12.825970,-57.992710"
		call This.MoveToNextWaypoint "41.406582,13.538271,-69.632080"
		OgreBotAPI:ApplyVerb["door_19", "use"]
		call This.MoveToNextWaypoint "48.142746,13.480465,-76.184685"
		call This.MoveToNextWaypoint "55.392998,13.508872,-80.622276"

		call This.WaitForNamedToBecomeAttackable "${_NamedNPC}"
		call This.KillNamed "${_NamedNPC}", "49.659153,13.701356,-70.068893"

		return TRUE
	}

	function Named16(string _NamedNPC="Doesnotexist")
	{
		call This.MoveToNextWaypoint "45.624752,13.518343,-73.958038"
		OgreBotAPI:ApplyVerb["door_19", "use"]
		call This.MoveToNextWaypoint "28.392597,13.220845,-57.598755"
		call This.MoveToNextWaypoint "28.469416,12.915936,-73.993134"
		call This.MoveToNextWaypoint "17.506023,13.247956,-74.199860"
		call This.MoveToNextWaypoint "17.493313,12.934968,-60.552380"
		call This.MoveToNextWaypoint "17.421072,13.217855,-57.382244"
		OgreBotAPI:ApplyVerb["door_20_00", "use"]
		call This.MoveToNextWaypoint "17.182325,13.502501,-50.295876"
		call This.MoveToNextWaypoint "16.616304,13.502500,-41.494778"

		call This.WaitForNamedToBecomeAttackable "${_NamedNPC}"
		call This.KillNamed "${_NamedNPC}", "12.902579,13.502500,-51.436981"

		return TRUE
	}

	function WaitForNamedToBecomeAttackable(string _NamedNPC)
	{
		do
		{
			wait 5
		}
		while !${Actor[Query,Name=="${_NamedNPC}" && IsAggro](exists)}
	}

	function MoveToNextWaypoint(point3f waypoint)
	{
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${waypoint}"]
		call This.KillTrash
	}

	function WaitForNamedToSpawn(string named)
	{

	}

	function KillTrash()
	{
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreUtilities.HandleWaitForGroupDistance 5
	}

	function PrePull(point3f PrePullSpot)
	{
		oc !ci -ChangeLootOptions igw:${Me.Name} LeaderOnlyLoot
		wait 10
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${PrePullSpot}"]
		call This.KillTrash
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 20
	}

	member:bool NamedIsUp(string _NamedNPC)
	{
		return ${Actor[Query,Name=="${_NamedNPC}"](exists)}
	}

	function KillNamed(string _NamedNPC, point3f KillSpot)
	{
		oc "Kill spot ${KillSpot}"
		if ${Math.Distance[${Me.Loc},${KillSpot}]} > 10
		{
			oc "No kill spot given, setting to my location (${Me.Loc})"
			KillSpot:Set[${Me.Loc}]
		}
		oc Pulling ${_NamedNPC}
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["${KillSpot}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		Actor["${_NamedNPC}"]:DoTarget
		while ${Actor[Query,Name=="${_NamedNPC}"](exists)}
		{
			do
			{
				wait 50
				if ${Actor[Query,Name=="${_NamedNPC}"].Distance} < 10
				{
					Obj_OgreIH:CCS_Actor_Position["${Actor[Query,Name=="${_NamedNPC}"].ID}"]
				}
			}
			while ${Actor[Query,Name=="${_NamedNPC}"](exists)}
			wait 50
		}
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 50
	}
}

