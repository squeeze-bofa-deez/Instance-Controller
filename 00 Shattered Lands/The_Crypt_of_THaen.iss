variable string sZoneName="The Crypt of T'Haen"

variable string sZoneShortName="mod01_dun_crypt_of_thaen"
variable string sZoneIn_ObjectName="zone_to_crypt_of_thaen_lower"
variable(global) collection:string gcsRetValue

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process ${_StartingPoint} "-NoAutoLoadMapOnZone" ${Args.Expand}
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
			if !${Zone.Name.Equals["${sZoneName}"]}
			{
				Obj_OgreIH:Actor_Click["${sZoneIn_ObjectName}"]
				wait 30
				OgreBotAPI:ZoneDoor["${sZoneName}"]
				call Obj_OgreUtilities.HandleWaitForZoning
			}

			Ogre_Instance_Controller:ZoneSet
			
			call Obj_OgreIH.Set_VariousOptions
			call Obj_OgreIH.Set_PriestAscension FALSE
			
			oc !ci -LetsGo igw:${Me.Name}
			Obj_OgreIH:SetCampSpot
			oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_movetoarea TRUE TRUE
			oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_facenpc TRUE TRUE
			oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_autotarget_outofcombatscanning FALSE TRUE
			oc !c -ChangeLootOptions all RoundRobin AutoSplit

			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 1
		{
			call This.DoTheInstance 
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["Failed to run the zone!"]
				return FALSE
			}

			echo "Leaving the zone..."
			
			; Check zone for reset.
			; Load Ogre Instance Controller Assister - it handles the internal stuff.
			ogre ica
			wait 2
			; Populate the information. This will open the zone reuse window and scan it.
			Ogre_Instance_Controller_Assister:PopulateInternalMemory
			wait 2
			while ${Ogre_Instance_Controller_Assister.bPopulateInternalMemoryRunning}
			wait 2
			
			; Pick how you want the data. Put both options in, but realistically you will only be using 1 at a time.
			call CheckASpecificZone "${sZoneName}"

			_StartingPoint:Inc
		}

		return TRUE
    }

    function:bool DoTheInstance()
	{
		call This.Move "8.721404,2.605151,108.757103"
		call This.Move "-12.718039,1.256845,96.438477"
		call This.Move "-12.792964,1.495752,76.716492"
		call This.Move "-12.870082,1.039763,66.115036"
		call This.Move "-12.978679,-0.316930,51.186359"
		call This.Move "-19.216839,-0.486032,46.042179"
		call This.Move "-3.160958,-0.497500,39.257854"
		call This.Move "11.582856,-0.497500,33.074638"
		call This.Move "25.045942,-0.497500,27.428535"
		call This.Move "51.802898,-0.497500,20.625711"
		call This.Move "28.756578,-0.334109,-10.663543"
		call This.Move "35.485226,-0.331761,-22.322220"
		call This.Move "52.671883,-0.497500,-24.983091"
		call This.Move "60.478447,-0.497500,-33.409851"
		call This.Move "59.837494,-0.497500,-36.869225"
		call This.Move "60.550209,-0.497500,-46.151665"
		call This.Move "53.143696,-0.497500,-85.449028"

		call This.Move "37.272202,-0.497500,-90.095810"
		call This.Move "28.598459,-0.497500,-75.655678"
		Actor[exactname, "a rotting watcher"]:DoTarget
		call Obj_OgreUtilities.HandleWaitForCombat

		call This.Move "24.049097,-0.497500,-89.717064"

		call This.Move "6.429605,-0.497500,-87.729340"
		Actor[exactname, "a whispering tormentor"]:DoTarget

		call This.Move "-2.650585,-0.713833,-102.339752"
		call This.Move "4.870029,-0.108568,-76.586952"
		call This.Move "-26.302212,-0.497500,-81.829865"
		call This.Move "-49.243702,-0.497500,-91.737610"
		call This.Move "-57.238899,-0.497500,-79.862511"
		call This.Move "-67.539711,-0.497500,-63.574497"
		call This.Move "-83.390106,-0.497500,-44.345585"
		call This.Move "-78.551682,-0.497500,-35.180542"
		call This.Move "-91.327126,-0.497500,-27.178505"
		call This.Move "-102.822350,-0.497500,-13.290819"
		call This.Move "-93.272026,1.346014,33.077934"
		call This.Move "-114.099525,1.396615,28.875942"
		call This.Move "-101.325569,0.907642,12.033178"
		call This.Move "-84.616684,-0.497500,-29.694620"
		call This.Move "-74.586029,-0.497500,-16.967075"
		call This.Move "-75.874352,-0.497500,-3.357370"
		call This.Move "-56.427715,-0.497500,8.224589"
		call This.Move "-62.927238,1.173600,25.607889"
		call This.Move "-59.859245,8.685117,34.636368"
		call This.Move "-55.544598,16.800571,49.835419"
		call This.Move "-52.621101,16.878208,56.524734"
		call This.Move "-50.986523,15.994064,73.404648"
		call This.Move "-53.712601,13.898206,85.358795"
		call This.Move "-43.860611,13.858563,96.561928"
		call This.Move "-59.717674,14.183757,112.999031"
		call This.Move "-44.134441,13.807565,97.157249"
		call This.Move "-23.348486,10.660858,116.957893"
		call This.Move "-10.733816,10.966619,120.747971"
		call This.Move "-13.519335,10.814011,105.131569"
		call This.Move "-0.960247,13.300142,90.342705"
		call This.Move "7.416553,13.506427,93.974197"
		call This.Move "4.760303,13.449528,86.926468"
		call This.Move "-6.668225,12.092862,95.378059"
		call This.Move "-9.764187,10.516535,111.597359"
		call This.Move "-32.936054,11.337978,106.746025"
		call This.Move "-52.230488,14.042340,83.713280"
		call This.Move "-53.666740,16.793816,52.891838"
		call This.Move "-57.552128,15.009289,46.649254"
		call This.Move "-64.057091,-0.497500,20.140715"
		call This.Move "-46.077152,-0.497500,23.846024"
		call This.Move "-54.091026,-0.497500,46.912159"
		call This.Move "-1.562934,-0.497500,41.917919"
		call This.Move "16.823225,-0.497500,27.479805"
		call This.Move "57.477383,-0.490213,35.157433"
		call This.Move "77.638817,0.575137,28.488945"
		call This.Move "86.799133,1.276219,33.404224"
		call This.Move "87.938515,1.113379,42.490284"
		call This.Move "95.254295,2.259050,55.725853"
		call This.Move "93.853462,1.722476,72.625870"
		call This.Move "80.273796,0.265794,81.545685"
		call This.Move "56.789291,0.474058,69.473267"
		call This.Move "80.720810,0.500035,44.356483"
		call This.Move "106.326729,3.203442,49.351826"
		call This.Move "119.491554,7.253521,28.497200"
		call This.Move "110.070976,9.166135,0.734192"
		call This.Move "106.466896,11.334612,-24.579752"
		call This.Move "89.760780,10.593485,-40.305347"
		call This.Move "88.903053,13.313513,-59.587711"
		call This.Move "63.728588,13.081890,-51.208763"
		call This.Move "49.796608,16.402943,-64.522202"
		call This.Move "64.822617,14.224772,-70.339798"
		call This.Move "76.169281,13.042344,-72.568932"
		call This.Move "65.968025,15.236122,-93.002365"
		call This.Move "48.014854,15.782330,-99.761383"
		call This.Move "29.317823,18.515060,-109.227753"
		call This.Move "6.405880,19.613758,-106.612297"
		call This.Move "-10.012153,21.571829,-105.886734"
		call This.Move "-4.976445,21.563097,-96.900291"
		call This.Move "-4.685669,23.890526,-64.139076"
		call This.Move "-0.161281,23.691717,-45.356522"
		call This.Move "-16.462692,23.792652,-38.057034"
		call This.Move "-15.077499,23.933529,-27.135118"
		call This.Move "-21.974695,23.713499,-35.819790"
		call This.Move "-32.646183,23.251440,-26.743771"
		call This.Move "-32.134270,23.785318,-19.737986"
		call This.Move "-50.882942,24.444113,-10.476705"
		call This.Move "-65.050339,23.041649,-5.057805"
		call This.Move "-85.620453,23.842361,3.846209"
		call This.Move "-82.593109,24.508543,15.638849"
		call This.Move "-104.201591,25.690498,-3.529051"
		call This.Move "-101.150787,25.175678,-20.495935"
		call This.Move "-102.706253,25.349937,-16.064131"
		call This.Move "-103.565735,25.576633,-5.607702"
		call This.Move "-92.199326,26.062954,18.666153"
		call This.Move "-94.711708,28.591890,34.940586"
		call This.Move "-89.465340,31.435730,44.376522"
		call This.Move "-78.249649,34.558495,47.356750"
		call This.Move "-70.760597,37.572216,40.189777"
		call This.Move "-58.249290,39.229214,46.700176"
		call This.Move "-56.388096,39.719021,31.995228"
		call This.Move "-41.433994,46.380211,10.726517"
		call This.Move "-15.342785,53.038418,8.502915"
		call This.Move "-7.088201,54.350407,7.413018"
		call This.Move "1.774049,56.540367,-3.282735"
		call This.Move "16.338520,55.692093,-20.860439"
		call This.Move "13.353388,57.246136,-41.681011"
		call This.Move "-5.559541,56.718536,-54.179604"
		call This.Move "-26.801802,56.490879,-46.053905"
		call This.Move "-28.557730,56.618641,-25.707270"
		call This.Move "-31.984371,56.490551,-47.451775"
		call This.Move "-9.081180,61.195827,-24.995607"
		call This.Move "-28.218668,56.434418,-43.167431"
		call This.Move "-44.757942,53.902340,-29.093035"
		call This.Move "-40.755322,50.819851,-12.454899"
		call This.Move "-46.504208,54.821945,-37.487606"
		call This.Move "-26.076271,55.718834,-59.478764"
		call This.Move "-27.794817,45.689259,-75.322624"
		call This.Move "-32.026039,42.415649,-86.236916"
		call This.Move "-34.243065,44.319401,-92.994034"
		call This.Move "-40.924809,42.214207,-91.688477"
		call This.Move "-57.482891,22.506983,-89.278656"
		call This.Move "-66.264313,22.229385,-106.514297"
		call This.Move "-55.523087,22.307823,-87.646423"
		call This.Move "-46.405987,-0.497500,-74.934418"
		call This.Move "-42.707726,-0.300961,-68.195091"
		call This.Move "-54.069576,-0.497500,-58.875603"
		call This.Move "-69.749382,-0.497500,-61.655613"
		call This.Move "-87.475288,-0.497500,-35.512737"
		call This.Move "-75.157906,-0.497500,-10.020769"
		call This.Move "-57.964901,-0.497500,6.195679"
		call This.Move "-44.035168,-0.497500,35.903984"
		call This.Move "-18.669996,-0.497500,43.988155"
		call This.Move "-11.247850,0.976324,63.032284"
		call This.Move "-14.186547,1.496299,79.063202"
		call This.Move "-6.332198,1.805251,93.395767"
		call This.Move "-2.933021,1.998708,108.341568"
		call This.Move "4.847512,2.905322,109.498932"
		call This.Move "19.284513,2.425545,105.012802"
		call This.Move "27.477200,2.805299,97.701118"
		call This.Move "30.309023,2.899852,99.418755"

        return TRUE
    }

	function Move(point3f location, bool combat=TRUE, bool prebuff=TRUE)
	{
		if ${prebuff}
		{
			call Obj_OgreUtilities.PreCombatBuff 5
		}

		Obj_OgreIH:ChangeCampSpot["${location}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 20
		
		if ${combat}
		{
			call Obj_OgreUtilities.HandleWaitForCombat
		}
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
			
			wait ${gcsRetValue.Element["TimeLeft"]}
			wait ${gcsRetValue.Element["TimeLeft"]}
			wait ${gcsRetValue.Element["TimeLeft"]}
			wait ${gcsRetValue.Element["TimeLeft"]}
			wait ${gcsRetValue.Element["TimeLeft"]}
			wait ${gcsRetValue.Element["TimeLeft"]}
			wait ${gcsRetValue.Element["TimeLeft"]}
			wait ${gcsRetValue.Element["TimeLeft"]}
			wait ${gcsRetValue.Element["TimeLeft"]}
			wait ${gcsRetValue.Element["TimeLeft"]}
			Obj_OgreIH:Actor_Click["zone_bottom_entrance"]
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 100
		}
		else
			echo GetZoneData was false
	}
}