;================================================================================
; Title: Evernight Abbey | Author: The Marty Party | Date: 06 Feb 2024 | Version: 1.4
;================================================================================

variable string sZoneShortName="exp05_dun_mistmoore_abbey"
variable string sZoneName="Evernight Abbey"
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
				Obj_OgreIH:Actor_Click["Portal to Evernight Abbey"]
				call Obj_OgreUtilities.HandleWaitForZoning
				Obj_OgreIH:Message_FailedZone
				return FALSE
			}

			echo ${Time}: \agStarting to auto-run ${sZoneName}. Version: 1.4
					
        	Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
			;Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			call Obj_OgreIH.Set_PriestAscension FALSE
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "40"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
			;_StartingPoint:Set[2]
		}
        
        if ${_StartingPoint} == 1
		{
			call This.Named1 "Pythoness Olrga"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Pythoness Olrga"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Nzhevar B'Texila"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Nzhevar B'Texila"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
        
		if ${_StartingPoint} == 3
		{
			call This.Named3 "Crypt Master T'golth"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: Crypt Master T'golth"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 4
		{
			call This.Named4 "Gabardine Obisgnul"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: Gabardine Obisgnul"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 5
		{
			call This.Named5 "Lord Marcus Thex"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: Lord Marcus Thex"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}

		;//Finish zone (zone out)
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

		call Obj_OgreUtilities.HandleWaitForZoning
		wait 10
		Obj_OgreIH:SetCampSpot
		wait 10
		oc !c -ChangeCampSpotWho ${Me.Name} -421.231506 8.953549 -48.607170
		wait 50
		oc !c -ChangeCampSpotWho ${Me.Name} -477.085693 9.662611 25.407948
		wait 70
		oc !c -ChangeCampSpotWho ${Me.Name} -450.507050 14.060266 52.865227
		wait 40
		oc !c -ChangeCampSpotWho ${Me.Name} -401.110016 16.418085 41.441978
		wait 40
		oc !c -ChangeCampSpotWho ${Me.Name} -377.414764 16.795065 56.756161
		wait 30

		oc !c -ApplyVerbForWho igw:${Me.Name} "crypt_door_to_mistmoore_portal_chamber" "use"
		wait 20

		oc !c -ChangeCampSpotWho ${Me.Name} -350.337402 0.854701 10.039196
		wait 40
		oc !c -ChangeCampSpotWho ${Me.Name} -339.455017 0.863179 6.307797
		wait 40

        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷          NAMED 1 - Pythoness Olrga          ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-0.349101,-0.550159,-12.550826"
		call Movetoloc "-0.174231,-0.248032,-59.313263"
		call Movetoloc "-0.121287,-3.008498,-101.711815"
		call Movetoloc "26.055422,-2.680569,-114.854485"
		call Movetoloc "56.126408,-4.338845,-114.906952"
		call Movetoloc "90.106262,-4.340748,-114.015274"
		call Movetoloc "89.823112,-4.333626,-83.635796"
		call Movetoloc "132.045227,-6.161319,-84.154793"
		call Movetoloc "131.402985,-6.811979,-105.160759"
		eq2execute target an enraged
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
        eq2execute target Pythoness Olrga
        wait 50
		call HandleNamed
		call Movetoloc "131.440430,-6.814539,-133.669434"
		call Movetoloc "131.290359,-6.167370,-154.248520"
		call Movetoloc "101.071594,-6.182811,-153.335754"
		call Movetoloc "101.057945,-6.164195,-181.761780"
		call Movetoloc "100.706772,-6.243414,-215.644897"
		call Movetoloc "100.556839,-6.165004,-252.155533"
		call Movetoloc "67.667122,-4.961679,-251.459686"
        eq2execute target Pythoness Olrga
        wait 50
		call HandleNamed
        oc !c -CS_ClearCampSpot igw:${Me.Name}
        wait 10
        oc !c -cfw igw:${Me.Name} -Evac
		wait 50
		call Obj_OgreUtilities.HandleWaitForZoning
		call Movetoloc "-0.096287,-0.550159,-14.746230"
		call Movetoloc "-0.224491,-0.248032,-57.784523"
		call Movetoloc "-0.202541,-3.009546,-101.375778"
		call Movetoloc "-23.105347,-3.090260,-114.791412"
		call Movetoloc "-56.281567,-4.337875,-114.821182"
		call Movetoloc "-90.512711,-4.355784,-114.940941"
		call Movetoloc "-89.772736,-4.347062,-84.339226"
		call Movetoloc "-131.884720,-6.174904,-83.902367"
		call Movetoloc "-131.846878,-6.816852,-104.121811"
		call Movetoloc "-131.635986,-6.786491,-118.323433"
		eq2execute target an enraged
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
        eq2execute target Pythoness Olrga
        wait 50
		call HandleNamed
		call Movetoloc "-131.776260,-6.458563,-135.464096"
		call Movetoloc "-131.752197,-6.171512,-154.185699"
		call Movetoloc "-100.973274,-6.166622,-154.122925"
		call Movetoloc "-101.309807,-6.173256,-186.003098"
		call Movetoloc "-101.282600,-6.237819,-215.628510"
		call Movetoloc "-101.515831,-6.167833,-252.267883"
		call Movetoloc "-134.004288,-4.691826,-251.808945"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 2 - Nzhevar B'Texila         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{   
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-100.814644,-6.176899,-252.336960"
		call Movetoloc "-100.312119,-6.228123,-215.535751"
		call Movetoloc "-75.621948,-8.193781,-215.713058"
		call Movetoloc "-47.920773,-9.805368,-215.707581"
		call Movetoloc "-19.449314,-10.101030,-215.702011"
		call Movetoloc "-5.686160,-9.933750,-204.709976"
		call Movetoloc "-16.829769,-9.621798,-188.421570"
		call Movetoloc "-27.164461,-7.996031,-188.128967"
		call Movetoloc "-23.075596,-7.996031,-176.764481"
		call Movetoloc "-7.291816,-7.250657,-156.712372"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷       NAMED 3 - Crypt Master T'golth       ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
    function:bool Named3(string _NamedNPC="Doesnotexist")
	{	
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-12.297760,-7.996031,-165.345627"
		call Movetoloc "-0.734848,-7.329851,-160.085815"
		call Movetoloc "-0.184767,-5.711847,-135.418076"
		call Movetoloc "21.345068,-4.894059,-141.816971"
        eq2execute target Crypt Master T'golth
        wait 50
		call HandleNamed
		call Movetoloc "-0.225522,-5.711481,-135.254440"
		call Movetoloc "-21.938576,-4.936582,-142.036591"
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 50
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷        NAMED 4 - Gabardine Obisgnul        ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named4(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
		call Movetoloc "-0.382138,-5.712861,-136.143311"
		call Movetoloc "-0.277953,-7.327835,-158.630844"
		call Movetoloc "7.622218,-7.425715,-165.618744"
		call Movetoloc "-0.513828,-10.929135,-183.042404"
		call Movetoloc "5.361604,-9.933810,-202.274429"
		call Movetoloc "-0.539946,-9.933749,-223.630112"
		call Movetoloc "-0.346348,-12.707101,-262.843231"
		call Movetoloc "-23.517809,-12.775789,-280.579529"
		call Movetoloc "-0.218623,-12.711843,-292.198608"
		call Movetoloc "21.990606,-12.728557,-279.811768"
		call Movetoloc "58.021435,-17.919573,-280.198578"
		call Movetoloc "58.097820,-17.917933,-251.346603"
		call Movetoloc "26.980768,-25.289309,-251.827805"
		call Movetoloc "27.566023,-25.562721,-223.475418"
		eq2execute target an enraged
		wait 100
		call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
		call HandleNamed
        return TRUE
    }

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷         NAMED 5 - Lord Marcus Thex         ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
	function:bool Named5(string _NamedNPC="Doesnotexist")
	{
        echo ${Time}: Moving to ${_NamedNPC}
        relay all OgreBotAtom aExecuteAtom all a_QueueCommand ChangeCastStackListBoxItem "Lifeburn" FALSE TRUE
        relay all OgreBotAtom aExecuteAtom all a_QueueCommand ChangeCastStackListBoxItem "Undead Horde" FALSE TRUE
        wait 20
		call Movetoloc "27.620949,-25.298553,-251.932861"
		call Movetoloc "58.183353,-17.908592,-251.592453"
		call Movetoloc "57.747955,-17.923845,-280.409943"
		call Movetoloc "22.739546,-12.728557,-279.857544"
		call Movetoloc "-3.509887,-12.719440,-293.862213"
        oc !c -Pause igw:${Me.Name}
        wait 50
        oc !c -ApplyVerbForWho igw:${Me.Name} "vampire shrine" "Perform the Blood Transfusion"
        wait 50
        oc !c -Resume igw:${Me.Name}
        wait 50
		call Movetoloc "-0.458866,-12.451967,-301.008911"
		call Movetoloc "-0.291188,-15.984509,-319.033142"
		call Movetoloc "22.458242,-17.394039,-326.959137"
		call Movetoloc "32.993183,-16.844591,-312.190430"
		call Movetoloc "34.866585,-16.844591,-322.104370"
        
		;//Pulling Jaas Okahm
        oc !c -ChangeCampSpotWho ${Me.Name} 33.581394 -16.844591 -311.571167
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} 10.495090 -18.780941 -343.436951
        wait 60
        oc !c -ChangeCampSpotWho ${Me.Name} -4.757018 -18.784233 -342.545593
        wait 20

        Ob_AutoTarget:AddActor["Jaas Okahm",0,FALSE,FALSE]
        wait 30
        
        if ${Me.InCombat}
        {
            oc !c -ChangeCampSpotWho ${Me.Name} 10.587206 -18.800116 -343.524292
            wait 20
            oc !c -ChangeCampSpotWho ${Me.Name} 35.921532 -16.844591 -307.986328
            wait 60
            while ${Me.InCombat}
                waitframe
        }
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat

        if ${Actor["Mayong Mistmoore's Treasure"](exists)} && ${Math.Distance[${Actor["Mayong Mistmoore's Treasure"].Loc},45.522316,-14.838219,-295.314362]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} 45.522316 -14.838219 -295.314362
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            wait 100
        }

		call Movetoloc "35.921532,-16.844591,-307.986328"
		call Movetoloc "22.487677,-17.391228,-327.322113"
		call Movetoloc "38.063366,-16.770555,-347.633759"
		call Movetoloc "36.206135,-17.420919,-370.465515"
		call Movetoloc "54.568630,-16.844606,-376.776794"
		call Movetoloc "45.930172,-16.844603,-380.665802"

        ;//Pulling Daxenyl Bechoin
        oc !c -ChangeCampSpotWho ${Me.Name} 53.671684 -17.198914 -376.047028
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} 17.588192 -18.806351 -364.431732
        wait 60
        oc !c -ChangeCampSpotWho ${Me.Name} 14.068104 -18.784227 -350.605438
        wait 20

        Ob_AutoTarget:AddActor["Daxenyl Bechoin",0,FALSE,FALSE]
        wait 30
        
        if ${Me.InCombat}
        {
            oc !c -ChangeCampSpotWho ${Me.Name} 17.302242 -18.781418 -364.246613
            wait 20
            oc !c -ChangeCampSpotWho ${Me.Name} 59.372665 -16.844606 -377.859467
            wait 60
            while ${Me.InCombat}
                waitframe
        }
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat

        if ${Actor["Mayong Mistmoore's Treasure"](exists)} && ${Math.Distance[${Actor["Mayong Mistmoore's Treasure"].Loc},73.923958,-14.838219,-382.819763]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} 73.923958 -14.838219 -382.819763
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            wait 100
        }

		call Movetoloc "59.372665,-16.844606,-377.859467"
		call Movetoloc "36.417835,-17.426058,-370.555817"
		call Movetoloc "23.344866,-16.770555,-391.023804"
		call Movetoloc "-0.469204,-17.404829,-397.296906"
		call Movetoloc "-0.625469,-16.845320,-416.551697"
		call Movetoloc "-7.282505,-16.844591,-409.221405"

        ;//Pulling Vash Luben
        oc !c -ChangeCampSpotWho ${Me.Name} -0.293248 -16.861008 -414.669708
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -0.267825 -18.774761 -377.114319
        wait 60
        oc !c -ChangeCampSpotWho ${Me.Name} 11.881099 -18.784225 -369.316681
        wait 20

        Ob_AutoTarget:AddActor["Vash Luben",0,FALSE,FALSE]
        wait 30
        
        if ${Me.InCombat}
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -0.439714 -18.794941 -377.873138
            wait 20
            oc !c -ChangeCampSpotWho ${Me.Name} -0.440606 -16.844593 -421.273102
            wait 60
            while ${Me.InCombat}
                waitframe
        }
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat

        if ${Actor["Mayong Mistmoore's Treasure"](exists)} && ${Math.Distance[${Actor["Mayong Mistmoore's Treasure"].Loc},-0.227430,-14.838219,-437.592865]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -0.227430 -14.838219 -437.592865
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            wait 100
        }

		call Movetoloc "-0.440606,-16.844593,-421.273102"
		call Movetoloc "-0.064821,-17.386705,-396.595917"
		call Movetoloc "-24.537334,-16.770557,-390.967834"
		call Movetoloc "-37.135128,-17.403234,-370.448334"
		call Movetoloc "-54.632282,-16.924440,-376.204559"
		call Movetoloc "-51.015766,-16.844591,-367.892761"

        ;//Pulling Akros Luben
        oc !c -ChangeCampSpotWho ${Me.Name} -53.618721 -16.878565 -375.930267
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -18.604904 -18.792181 -364.458191
        wait 60
        oc !c -ChangeCampSpotWho ${Me.Name} -7.895291 -18.784222 -373.173645
        wait 20

        Ob_AutoTarget:AddActor["Akros Luben",0,FALSE,FALSE]
        wait 30
        
        if ${Me.InCombat}
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -18.839737 -18.790751 -364.647766
            wait 20
            oc !c -ChangeCampSpotWho ${Me.Name} -60.903366 -16.844593 -378.312073
            wait 60
            while ${Me.InCombat}
                waitframe
        }
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat

        if ${Actor["Mayong Mistmoore's Treasure"](exists)} && ${Math.Distance[${Actor["Mayong Mistmoore's Treasure"].Loc},-74.866692,-14.838219,-382.874512]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -74.866692 -14.838219 -382.874512
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            wait 100
            oc !c -ChangeCampSpotWho ${Me.Name} -60.903366 -16.844593 -378.312073
            wait 60
        }

        ;//Getting buff
        oc !c -ChangeCampSpotWho ${Me.Name} -11.092109 -18.774445 -362.278107
        wait 100
		oc !c -Pause igw:${Me.Name}
		wait 30
        oc !c -ApplyVerbForWho igw:${Me.Name} "lubesh sarcophagi" "Consume the Power of the Lubesh"
        wait 50
		oc !c -Resume igw:${Me.Name}
		wait 10
        oc !c -ChangeCampSpotWho ${Me.Name} -60.903366 -16.844593 -378.312073
        wait 100

		call Movetoloc "-60.903366,-16.844593,-378.312073"
		call Movetoloc "-36.648884,-17.385612,-370.618713"
		call Movetoloc "-38.913628,-16.770557,-346.395569"
		call Movetoloc "-23.387482,-17.397661,-327.108368"
		call Movetoloc "-33.122147,-17.012493,-313.557587"
		call Movetoloc "-24.683002,-16.844591,-313.771545"

        ;// Pulling Trajer Myelz
        oc !c -ChangeCampSpotWho ${Me.Name} -33.138798 -16.860228 -313.883209
        wait 20
        oc !c -ChangeCampSpotWho ${Me.Name} -12.067415 -18.778980 -342.365204
        wait 60
        oc !c -ChangeCampSpotWho ${Me.Name} -16.546761 -18.784225 -357.486115
        wait 20

        Ob_AutoTarget:AddActor["Trajer Myelz",0,FALSE,FALSE]
        wait 30
        
        if ${Me.InCombat}
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -11.759991 -18.804905 -342.939178
            wait 20
            oc !c -ChangeCampSpotWho ${Me.Name} -37.278206 -16.844591 -307.949371
            wait 60
            while ${Me.InCombat}
                waitframe
        }
        wait 30
        call Obj_OgreUtilities.HandleWaitForCombat

        if ${Actor["Mayong Mistmoore's Treasure"](exists)} && ${Math.Distance[${Actor["Mayong Mistmoore's Treasure"].Loc},-46.463314,-14.838218,-294.965912]} <= 5
        {
            oc !c -ChangeCampSpotWho ${Me.Name} -46.463314 -14.838218 -294.965912
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            wait 100
        }

		call Movetoloc "-37.278206,-16.844591,-307.949371"
		call Movetoloc "-10.992499,-18.780346,-343.838837"
		call Movetoloc "-17.060144,-18.784321,-353.352997"

        ;//Setup for Named
		oc !c -Pause igw:${Me.Name}
		wait 10
        eq2execute useability 3241699042
        wait 30
		oc !c -Resume igw:${Me.Name}
		wait 10
        relay all OgreBotAtom aExecuteAtom all a_QueueCommand ChangeCastStackListBoxItem "Lifeburn" TRUE TRUE
        relay all OgreBotAtom aExecuteAtom all a_QueueCommand ChangeCastStackListBoxItem "Undead Horde" TRUE TRUE
        wait 10
        Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
        wait 20
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
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
		call Obj_OgreIH.KillActorType 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
        eq2execute summon
		wait 40
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
			wait 300
			OgreBotAPI:CastAbility_Relay["all","Bladedance"]
            while ${Me.InCombat}
                waitframe
        }
		call PostNamed
	}
}

;================================================================================
; ˏˋ°•*⁀➷ˏˋ°•*⁀➷                    ATOMS                   ˏˋ°•*⁀➷ˏˋ°•*⁀➷
;================================================================================
atom atexit()
{
	echo ${Time}: \agFinished auto-running ${sZoneName}.
}
