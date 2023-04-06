variable string sZoneNameStart="The Shard of Fear"
variable string sZoneNameEnd="The Shard of Fear"
variable string sZoneShortName="The Shard_of_Fear"

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
}

objectdef Object_Instance
{
	function:bool RunInstance(int _StartingPoint=0)
	{
        
        if ${_StartingPoint} == 0
		{
			call This.Named0 "The Skeletal Destructor"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#0: The Skeletal Destructor"]
				return FALSE
			}
			_StartingPoint:Inc
		}

        if ${_StartingPoint} == 1
		{
			call This.Named1 "Spinechill Venomfang"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Spinechill Venomfang"]
				return FALSE
			}
			_StartingPoint:Inc
		}        
		if ${_StartingPoint} == 2
		{
			call This.Named2 "Dracoliche"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Dracoliche"]
				return FALSE
			}
			_StartingPoint:Inc
		}

		if ${_StartingPoint} == 3
		{
			call This.Named3 "The Caretaker"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: The Caretaker"]
				return FALSE
			}
			_StartingPoint:Inc
		}	

		if ${_StartingPoint} == 4
		{
			call This.Named4 "Terrock"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: The Skeletal Lord"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		 if ${_StartingPoint} == 5
		{
			call This.Named5 "The Skeletal Destructor"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#5: The Skeletal Destructor"]
				return FALSE
			}
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 6
		{
			call This.Named6 "ZoneOut"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#6: ZoneOut"]
				return FALSE
			}
			_StartingPoint:Inc
		}        
		Obj_OgreIH:LetsGo
        return TRUE
    }
    function:bool Named0(string _NamedNPC="Doesnotexist")
	{
        ;//Named The Skeletal Destructor
		variable point3f TrashSpot1="-5.024852,6.219964,356.708252"
		variable point3f TrashSpot2="-70.693512,9.537185,310.189819"
		variable point3f TrashSpot3="-188.824142,25.081112,405.006866"
        variable point3f TrashSpot4="-211.153290,27.916977,442.870026"
		variable point3f TrashSpot5="-235.189957,27.529818,437.244385"
        variable point3f TrashSpot6="-246.837204,28.702820,413.732025"
        variable point3f TrashSpot7="-230.304260,27.453718,390.890350"
        variable point3f TrashSpot8="-201.630402,23.046049,386.812866"
        variable point3f TrashSpot9="-218.078308,31.715210,417.64409"
		variable point3f NamedMob="-218.078308,31.715210,417.64409"
		
		Obj_OgreIH:LetsGo
		;// Trashpack 1
		echo Trashpack 1 ${TrashSpot1}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 15
		Obj_OgreIH:ChangeCampSpot["${TrashSpot1}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 2
		echo Trashpack 2  ${TrashSpot2}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot2}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 3
		echo Trashpack 3 ${TrashSpot3}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot3}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 4
		echo Trashpack 4 ${TrashSpot4}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot4}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 5
		echo Trashpack 5 ${TrashSpot5}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot5}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 6
		echo Trashpack 6 ${TrashSpot6}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot6}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 7
		echo Trashpack 7 ${TrashSpot7}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot7}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 8
		echo Trashpack 8 ${TrashSpot8}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot8}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 9
		echo Trashpack 9  ${TrashSpot9}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot9}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// NamedMob
		echo Named ${_NamedNPC} ${NamedMob}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${NamedMob}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		
		Actor[namednpc,"${_NamedNPC}"]:DoTarget
		wait 20
		
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" ClearTargetIfTargetDistanceOver 100
		wait 50
		OgreBotAPI:Actor_ClickQueued[string _ForWho="all", Skeletal Destructor's skull, bool _ExactName=FALSE]
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
			
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}			
		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			oc ${Time}: ${_NamedNPC} Deaded 
		}	
		call Obj_OgreIH.Get_Chest
        return TRUE
    }
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		;//Named Spinechill Venomfang
		variable point3f TrashSpot1="-171.604431,8.871163,330.795074"
		variable point3f TrashSpot2="-201.437042,9.330025,264.439545"
        variable point3f TrashSpot3="-255.211472,17.165457,191.191055"
        variable point3f TrashSpot4="-296.386627,21.131783,189.710983"
        variable point3f TrashSpot5="-303.635925,20.457323,165.800797"
        variable point3f TrashSpot6="-296.386627,21.131783,189.710983"
        variable point3f TrashSpot7="-312.866699,20.248741,211.168869"
        variable point3f TrashSpot8="-296.386627,21.131783,189.710983"
        variable point3f TrashSpot9="-243.250000,16.208952,191.448334"
        variable point3f TrashSpot10="-165.798294,7.717987,345.437714"
        variable point3f TrashSpot11="-72.179520,12.302525,322.312012"
        variable point3f TrashSpot12="20.522562,9.237407,334.276276 "
        variable point3f TrashSpot13="97.852150,3.487653,391.932098"
        variable point3f TrashSpot14="151.530060,2.470136,382.655182"
        variable point3f TrashSpot15="188.011459,-0.384898,377.018890"
        variable point3f TrashSpot16="221.034134,3.997314,366.993439"
        variable point3f TrashSpot17="257.191010,12.056410,380.562225"
        variable point3f TrashSpot18="269.522003,14.441968,338.489868"
        variable point3f TrashSpot19="266.454865,15.025488,309.704865"
        variable point3f TrashSpot20="304.203339,13.630470,299.438690"
        variable point3f TrashSpot21="317.209229,14.206821,342.527496"
		variable point3f TrashSpot22="342.908813,15.191376,373.069489"
        variable point3f TrashSpot23="293.709137,13.554070,354.941986"
        variable point3f TrashSpot24="291.771912,17.034819,322.349060"
        variable point3f TrashSpot25="293.709137,13.554070,354.941986"
        variable point3f TrashSpot26="319.096130,13.018787,430.710907"
        variable point3f TrashSpot27="383.663269,32.188766,456.378693"
		variable point3f NamedMob="391.060974,28.879581,409.690002"
		
		Obj_OgreIH:LetsGo
		;// Trashpack 1
		echo Trashpack 1 ${TrashSpot1}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot1}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 2
		echo Trashpack 2 ${TrashSpot2}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot2}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 3
		echo Trashpack 3 ${TrashSpot3}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot3}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 4
		echo Trashpack 4 ${TrashSpot4}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot4}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 5
		echo Trashpack 5 ${TrashSpot5}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot5}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 6
		echo Trashpack 6 ${TrashSpot6}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot6}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 7
		echo Trashpack 7 ${TrashSpot7}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot7}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 7
		echo Trashpack 7 ${TrashSpot7}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot7}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 8
		echo Trashpack 8 ${TrashSpot8}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot8}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 9
		echo Trashpack 9 ${TrashSpot9}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot9}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 10
		echo Trashpack 10 ${TrashSpot10}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot10}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 11
		echo Trashpack 11 ${TrashSpot11}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot11}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 12
		echo Trashpack 12 ${TrashSpot12}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot12}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 13
		echo Trashpack 13 ${TrashSpot13}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot13}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 14
		echo Trashpack 14 ${TrashSpot14}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot14}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 15
		echo Trashpack 15 ${TrashSpot15}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot15}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 16
		echo Trashpack 16 ${TrashSpot16}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot16}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 17
		echo Trashpack 17 ${TrashSpot17}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot17}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 18
		echo Trashpack 18 ${TrashSpot18}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot18}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 19
		echo Trashpack 19 ${TrashSpot19}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot19}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 20
		echo Trashpack 20 ${TrashSpot20}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot20}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 21
		echo Trashpack 21 ${TrashSpot21}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot21}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 22
		echo Trashpack 22 ${TrashSpot22}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot22}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 23
		echo Trashpack 23 ${TrashSpot23}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot23}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
        wait 5

        ;// Trashpack 24
		echo Trashpack 24 ${TrashSpot24}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot24}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 25
		echo Trashpack 25 ${TrashSpot25}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot25}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 26
		echo Trashpack 26 ${TrashSpot26}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot26}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		 ;// Trashpack 27
		echo Trashpack 27 ${TrashSpot27}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot27}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// NamedMob
		echo Named ${_NamedNPC} ${NamedMob}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${NamedMob}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		
		Actor[namednpc,"${_NamedNPC}"]:DoTarget
		wait 20
		
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" ClearTargetIfTargetDistanceOver 100
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
			
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}	

		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			oc ${Time}: ${_NamedNPC} Deaded 
		}	
		call Obj_OgreIH.Get_Chest
        return TRUE
    }
    function:bool Named2(string _NamedNPC="Doesnotexist")
	{
		;//Named Dracoliche 
		variable point3f TrashSpot1="267.770813,13.040726,397.643280"
        variable point3f TrashSpot2="214.932678,13.590875,303.470459"
        variable point3f TrashSpot3="251.931396,30.791435,276.315582"
        variable point3f TrashSpot4="305.044586,50.848503,241.424652"
        variable point3f TrashSpot5="314.772430,61.765057,181.859665"
        variable point3f TrashSpot6="307.563751,61.687275,135.783035"
        variable point3f TrashSpot7="309.562622,78.098267,104.470734"
        variable point3f TrashSpot8="307.563751,61.687275,135.783035"
        variable point3f TrashSpot9="298.030548,61.266651,125.636093"
        variable point3f TrashSpot10="252.955185,56.863083,79.557938"
        variable point3f TrashSpot11="247.080353,56.136360,40.220726"
        variable point3f TrashSpot12="262.476654,56.742920,24.504221"
        variable point3f TrashSpot13="241.338821,57.821480,-7.230289"
        variable point3f TrashSpot14="257.513153,58.575478,-24.496578"
        variable point3f TrashSpot15="276.093597,58.651165,-28.029697"
        variable point3f TrashSpot16="257.513153,58.575478,-24.496578"
        variable point3f TrashSpot17="248.914703,57.857101,-50.083942"
        variable point3f TrashSpot18="257.513153,58.575478,-24.496578"
        variable point3f TrashSpot19="234.111450,57.079163,10.147430"
        variable point3f TrashSpot20="119.178436,56.851025,-2.938836"
        variable point3f TrashSpot21="38.602581,49.833183,8.922604"
        variable point3f TrashSpot22="10.124080,48.947388,26.444407"
		variable point3f NamedMob="-84.336769,46.250412,-1.203608"
		
		Obj_OgreIH:LetsGo
		;// Trashpack 1
		echo Trashpack 1 ${TrashSpot1}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot1}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 2
		echo Trashpack 2 ${TrashSpot2}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot2}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 3
		echo Trashpack 3 ${TrashSpot3}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot3}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 4
		echo Trashpack 4 ${TrashSpot4}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot4}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 5
		echo Trashpack 5 ${TrashSpot5}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot5}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 6
		echo Trashpack 6 ${TrashSpot6}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot6}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 7
		echo Trashpack 7 ${TrashSpot7}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot7}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3

        ;// Trashpack 8
		echo Trashpack 8 ${TrashSpot8}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot8}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 9
		echo Trashpack 9 ${TrashSpot9}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot9}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 10
		echo Trashpack 10 ${TrashSpot10}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot10}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 11
		echo Trashpack 11 ${TrashSpot11}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot11}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 12
		echo Trashpack 12 ${TrashSpot12}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot12}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 13
		echo Trashpack 13 ${TrashSpot13}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot13}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 14
		echo Trashpack 14 ${TrashSpot14}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot14}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 15
		echo Trashpack 15 ${TrashSpot15}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot15}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 16
		echo Trashpack 16 ${TrashSpot16}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot16}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 17
		echo Trashpack 17 ${TrashSpot17}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot17}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 18
		echo Trashpack 18 ${TrashSpot18}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot18}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 19
		echo Trashpack 19 ${TrashSpot19}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot19}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 20
		echo Trashpack 20 ${TrashSpot20}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot20}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 21
		echo Trashpack 21 ${TrashSpot21}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot21}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 22
		echo Trashpack 22 ${TrashSpot22}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot22}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// NamedMob
		echo Named ${_NamedNPC} ${NamedMob}
		
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${NamedMob}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		
		Actor[namednpc,"${_NamedNPC}"]:DoTarget
		wait 20
		
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" ClearTargetIfTargetDistanceOver 100
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
			
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}	

		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			oc ${Time}: ${_NamedNPC} Deaded 
		}	
		call Obj_OgreIH.Get_Chest
        return TRUE
    }
    function:bool Named3(string _NamedNPC="Doesnotexist")
	{
		;// The Caretaker
		variable point3f TrashSpot1="2.654885,49.489014,2.613653"
        variable point3f TrashSpot2="-21.499674,0.729217,-167.267380"
        variable point3f TrashSpot3="-82.662140,-0.186862,-190.416885"
        variable point3f TrashSpot4="-196.428543,5.721048,-221.264221"
		variable point3f NamedMob="-245.871918,17.770281,-208.605804"
		
		Obj_OgreIH:LetsGo
		;// Trashpack 1
		echo Trashpack 1 ${TrashSpot1}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot1}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 2
		echo Trashpack 2 ${TrashSpot2}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot2}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 3
		echo Trashpack 3 ${TrashSpot3}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot3}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 4
		echo Trashpack 4 ${TrashSpot4}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot4}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// NamedMob
		echo Named ${_NamedNPC} ${NamedMob}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${NamedMob}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		
		Actor[namednpc,"${_NamedNPC}"]:DoTarget
		wait 20
		
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" ClearTargetIfTargetDistanceOver 100
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
			
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}	

		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			oc ${Time}: ${_NamedNPC} Deaded 
		}	
		call Obj_OgreIH.Get_Chest
        return TRUE
    }
    function:bool Named4(string _NamedNPC="Doesnotexist")
	{
		;// Terrock
		variable point3f TrashSpot1="-177.770676,0.629568,-239.101746"
		variable point3f TrashSpot2="-176.194931,0.212776,-272.681671"
		variable point3f TrashSpot3="-237.137634,1.656896,-273.128784"
		variable point3f TrashSpot4="-225.940430,1.520028,-265.315521"
        variable point3f TrashSpot5="-211.037170,0.923942,-262.938293"
        variable point3f TrashSpot6="-205.009689,1.010426,-263.729767"
        variable point3f TrashSpot7="-198.868362,1.174347,-263.797058"
        variable point3f TrashSpot8="-192.762924,1.254024,-263.864075"
        variable point3f TrashSpot9="-185.820313,1.267017,-263.940277"
        variable point3f TrashSpot10="-173.420029,-0.006670,-264.076263"
        variable point3f TrashSpot11="-168.012253,-0.242174,-264.275024"
        variable point3f TrashSpot12="-154.334610,-0.964165,-264.777618"
        variable point3f TrashSpot13="-145.100601,-0.866034,-265.117004"
        variable point3f TrashSpot14="-130.673645,0.434032,-265.600006"
        variable point3f TrashSpot15="-123.086304,0.377478,-265.577576"
        variable point3f TrashSpot16="-108.399582,0.227739,-265.512054"
        variable point3f TrashSpot17="-104.108772,0.243124,-265.622040"
        variable point3f TrashSpot18="-96.040833,0.215841,-265.823425"
        variable point3f TrashSpot19="-83.499092,0.242648,-266.136230"
        variable point3f TrashSpot20="-77.896286,0.314271,-266.275970"
        variable point3f TrashSpot21="-66.265076,0.196338,-266.566040"
        variable point3f TrashSpot22="-59.894329,0.076296,-266.398865"
        variable point3f TrashSpot23="-44.536682,0.528672,-268.311462"
        variable point3f TrashSpot24="-39.032452,0.229622,-269.734283"
        variable point3f TrashSpot25="-33.908424,-0.784662,-271.635681"
        variable point3f TrashSpot26="-24.632738,-1.837623,-276.389404"
        variable point3f TrashSpot27="-16.036627,-2.234334,-276.473724"
        variable point3f TrashSpot28="-10.771539,-2.383848,-276.977753"
        variable point3f TrashSpot29="-4.812752,-2.311025,-277.548065"
        variable point3f TrashSpot30="6.020194,-2.335560,-277.217987"
        variable point3f TrashSpot31="10.856768,-2.369972,-275.194244"
        variable point3f TrashSpot32="21.117777,-1.778850,-270.005585"
        variable point3f TrashSpot33="30.687611,-0.750703,-265.102631"
        variable point3f TrashSpot34="34.102409,-0.402229,-263.619751"
        variable point3f TrashSpot35="37.651821,-0.393510,-263.947815"
        variable point3f TrashSpot36="52.312592,-0.334674,-267.933289"
        variable point3f TrashSpot37="57.399906,-0.085349,-270.042084"
        variable point3f TrashSpot38="70.427246,0.297161,-274.590973"
        variable point3f TrashSpot39="77.452797,0.253474,-285.359650"
        variable point3f TrashSpot40="78.159683,0.374943,-290.691833"
        variable point3f TrashSpot41="79.073921,0.599517,-297.012146"
        variable point3f TrashSpot42="88.226753,0.402296,-300.676361"
        variable point3f TrashSpot43="93.080841,0.234987,-303.149017"
        variable point3f TrashSpot44="100.940964,0.105742,-305.935944"
        variable point3f TrashSpot45="111.968948,0.196324,-310.129974"
        variable point3f TrashSpot46="122.284462,0.206391,-315.057220"
        variable point3f TrashSpot47="129.523300,0.153429,-318.001892"
        variable point3f TrashSpot48="139.093506,0.274762,-321.567566"
        variable point3f TrashSpot49="146.404114,0.007504,-329.668854"
        variable point3f TrashSpot50="149.345474,-0.311674,-334.541321"
        variable point3f TrashSpot51="155.202927,-0.823128,-339.714783"
        variable point3f TrashSpot52="161.140015,-1.026394,-342.440094"
        variable point3f TrashSpot53="170.638153,-1.143116,-341.859009"
        variable point3f TrashSpot54="181.346191,-1.212950,-341.989594"
        variable point3f TrashSpot55="208.593231,-8.147215,-354.264954"
        variable point3f NamedMob="211.044525,-8.640788,-364.134613"
		
		Obj_OgreIH:LetsGo
		;// Trashpack 1
		echo Trashpack 1 ${TrashSpot1}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot1}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 2
		echo Trashpack 2 ${TrashSpot2}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot2}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 3
		echo Trashpack 3 ${TrashSpot3}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot3}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 4
		echo Trashpack 4 ${TrashSpot4}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot4}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 5
		echo Trashpack 5 ${TrashSpot5}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot5}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 5
		echo Trashpack 5 ${TrashSpot5}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot5}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 6
		echo Trashpack 6 ${TrashSpot6}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot6}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 7
		echo Trashpack 7 ${TrashSpot7}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot7}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 8
		echo Trashpack 8 ${TrashSpot8}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot8}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 9
		echo Trashpack 9 ${TrashSpot9}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot9}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 10
		echo Trashpack 10 ${TrashSpot10}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot10}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 11
		echo Trashpack 11 ${TrashSpot11}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot11}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 12
		echo Trashpack 12 ${TrashSpot12}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot12}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 13
		echo Trashpack 13 ${TrashSpot13}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot13}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 14
		echo Trashpack 14 ${TrashSpot14}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot14}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 15
		echo Trashpack 15 ${TrashSpot15}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot15}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 16
		echo Trashpack 16 ${TrashSpot16}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot16}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 17
		echo Trashpack 17 ${TrashSpot17}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot17}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 18
		echo Trashpack 18 ${TrashSpot18}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot18}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 19
		echo Trashpack 19 ${TrashSpot19}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot19}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 20
		echo Trashpack 20 ${TrashSpot20}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot20}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 21
		echo Trashpack 21 ${TrashSpot21}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot21}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 22
		echo Trashpack 22 ${TrashSpot22}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot22}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 23
		echo Trashpack 23 ${TrashSpot23}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot23}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 24
		echo Trashpack 24 ${TrashSpot24}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot24}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 25
		echo Trashpack 25 ${TrashSpot25}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot25}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 26
		echo Trashpack 26 ${TrashSpot26}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot26}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 27
		echo Trashpack 27 ${TrashSpot27}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot27}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 28
		echo Trashpack 28 ${TrashSpot28}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot28}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 29
		echo Trashpack 29 ${TrashSpot29}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot29}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 30
		echo Trashpack 30 ${TrashSpot30}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot30}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 31
		echo Trashpack 31 ${TrashSpot31}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot31}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 32
		echo Trashpack 32 ${TrashSpot32}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot32}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 33
		echo Trashpack 33 ${TrashSpot33}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot33}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 34
		echo Trashpack 34 ${TrashSpot34}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot34}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 35
		echo Trashpack 35 ${TrashSpot35}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot35}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 36
		echo Trashpack 36 ${TrashSpot36}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot36}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 37
		echo Trashpack 37 ${TrashSpot37}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot37}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 38
		echo Trashpack 38 ${TrashSpot38}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot38}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 39
		echo Trashpack 39 ${TrashSpot39}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot39}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 40
		echo Trashpack 40 ${TrashSpot40}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot40}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 41
		echo Trashpack 41 ${TrashSpot41}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot41}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 42
		echo Trashpack 42 ${TrashSpot42}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot42}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 43
		echo Trashpack 43 ${TrashSpot43}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot43}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 44
		echo Trashpack 44 ${TrashSpot44}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot44}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 45
		echo Trashpack 45 ${TrashSpot45}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot45}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 46
		echo Trashpack 46 ${TrashSpot46}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot46}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 47
		echo Trashpack 47 ${TrashSpot47}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot47}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 48
		echo Trashpack 48 ${TrashSpot48}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot48}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 49
		echo Trashpack 49 ${TrashSpot49}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot49}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 50
		echo Trashpack 50 ${TrashSpot50}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot50}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 51
		echo Trashpack 51 ${TrashSpot51}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot51}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 52
		echo Trashpack 52 ${TrashSpot52}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot52}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 53
		echo Trashpack 53 ${TrashSpot53}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot53}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 54
		echo Trashpack 54 ${TrashSpot54}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot54}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 55
		echo Trashpack 55 ${TrashSpot55}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot55}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// NamedMob
		echo Named ${_NamedNPC} ${NamedMob}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${NamedMob}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		
		Actor[namednpc,"${_NamedNPC}"]:DoTarget
		wait 20
		
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" ClearTargetIfTargetDistanceOver 100
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
			
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}	

		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			oc ${Time}: ${_NamedNPC} Deaded 
		}	
		call Obj_OgreIH.Get_Chest
        return TRUE
	}	   
	 function:bool Named5(string _NamedNPC="Doesnotexist")
	{
        ;//Named The Skeletal Destructor
		variable point3f TrashSpot1="227.872284,-0.885398,-326.933624"
		variable point3f TrashSpot2="227.910416,7.190886,-297.363708"
		variable point3f TrashSpot3="231.455963,7.423794,-253.619186"
        variable point3f TrashSpot4="207.944107,7.897302,-238.674149"
		variable point3f TrashSpot5="189.078964,6.604390,-263.651184"
        variable point3f TrashSpot6="188.165176,6.496874,-263.941711"
        variable point3f TrashSpot7="187.950836,5.895335,-311.326263"
        variable point3f TrashSpot8="213.214310,10.922078,-271.189545"
        variable point3f TrashSpot9="212.143265,10.922079,-272.268005"
		variable point3f NamedMob="-212.143265,10.922079,-272.268005"
		
		Obj_OgreIH:LetsGo
		;// Trashpack 1
		echo Trashpack 1 ${TrashSpot1}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 15
		Obj_OgreIH:ChangeCampSpot["${TrashSpot1}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 2
		echo Trashpack 2  ${TrashSpot2}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot2}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 3
		echo Trashpack 3 ${TrashSpot3}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot3}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 4
		echo Trashpack 4 ${TrashSpot4}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot4}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 5
		echo Trashpack 5 ${TrashSpot5}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot5}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 6
		echo Trashpack 6 ${TrashSpot6}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot6}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 7
		echo Trashpack 7 ${TrashSpot7}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot7}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 8
		echo Trashpack 8 ${TrashSpot8}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot8}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 9
		echo Trashpack 9  ${TrashSpot9}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot9}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// NamedMob
		echo Named ${_NamedNPC} ${NamedMob}
		call Obj_OgreUtilities.PreCombatBuff 5
		Actor[namednpc,"${_NamedNPC}"]:DoTarget
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" ClearTargetIfTargetDistanceOver 100
		wait 10
		OgreBotAPI:Actor_ClickQueued[string _ForWho="all", Skeletal Destructor's skull, bool _ExactName=FALSE]
		wait 50
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
			
		if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
			return FALSE
		}			
		if !${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
		{
			oc ${Time}: ${_NamedNPC} Deaded 
		}	
		call Obj_OgreIH.Get_Chest
        return TRUE
	}
		function:bool Named6(string _NamedNPC="Doesnotexist")
	{
        ;//Zoneout
		variable point3f TrashSpot1="181.163742,5.098829,-314.282166"
		variable point3f TrashSpot2="97.987381,-0.941786,-268.862701"
		variable point3f TrashSpot3="55.762970,-0.927785,-224.091660"
        variable point3f TrashSpot4="2.107159,0.941754,-189.766479"
		variable point3f TrashSpot5="2.452629,7.332544,-118.365227"
        variable point3f TrashSpot6="2.723729,43.329956,-47.751717"
        variable point3f TrashSpot7="2.945197,49.571888,9.933652"
        variable point3f TrashSpot8="76.101952,52.153297,5.040038"
        variable point3f TrashSpot9="98.627357,56.631084,-11.476594"
		variable point3f TrashSpot10="181.652054,61.499977,2.212728"
		variable point3f TrashSpot11="206.697266,60.310394,10.640372"
		variable point3f TrashSpot12="218.702866,57.875477,29.630522"
		variable point3f TrashSpot13="207.998108,42.356979,143.000870"
		variable point3f TrashSpot14="198.658493,33.624001,201.438324"
		variable point3f TrashSpot15="189.517059,20.146919,258.635559"
		variable point3f TrashSpot16="181.338852,8.731186,309.806427"
		variable point3f TrashSpot17="152.391769,5.119856,352.453033"
		variable point3f TrashSpot18="106.688690,4.260110,382.998352"
		variable point3f TrashSpot19="61.152050,4.464605,415.126648"
		variable point3f TrashSpot20="25.864735,7.293505,449.050415"
		variable point3f TrashSpot21="-2.980228,11.564966,478.272369"
		variable point3f NamedMob="-9.906334,7.905126,485.225342"
		
		Obj_OgreIH:LetsGo
		;// Trashpack 1
		echo Trashpack 1 ${TrashSpot1}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:SetCampSpot
		wait 15
		Obj_OgreIH:ChangeCampSpot["${TrashSpot1}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 2
		echo Trashpack 2  ${TrashSpot2}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot2}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		
		;// Trashpack 3
		echo Trashpack 3 ${TrashSpot3}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot3}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 4
		echo Trashpack 4 ${TrashSpot4}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot4}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 5
		echo Trashpack 5 ${TrashSpot5}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot5}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 6
		echo Trashpack 6 ${TrashSpot6}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot6}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 7
		echo Trashpack 7 ${TrashSpot7}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot7}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

        ;// Trashpack 8
		echo Trashpack 8 ${TrashSpot8}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot8}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 9
		echo Trashpack 9  ${TrashSpot9}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot9}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 10
		echo Trashpack 10  ${TrashSpot10}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot10}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 11
		echo Trashpack 11  ${TrashSpot11}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot11}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 12
		echo Trashpack 12  ${TrashSpot12}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot12}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 13
		echo Trashpack 13  ${TrashSpot13}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot13}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 14
		echo Trashpack 14  ${TrashSpot14}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot14}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 15
		echo Trashpack 15  ${TrashSpot15}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot15}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 16
		echo Trashpack 16  ${TrashSpot16}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot16}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 17
		echo Trashpack 17  ${TrashSpot17}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot17}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 18
		echo Trashpack 18  ${TrashSpot18}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot18}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 19
		echo Trashpack 19  ${TrashSpot19}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot19}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 20
		echo Trashpack 20  ${TrashSpot20}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot20}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// Trashpack 21
		echo Trashpack 21  ${TrashSpot21}
		call Obj_OgreUtilities.PreCombatBuff 5
		wait 5
		Obj_OgreIH:ChangeCampSpot["${TrashSpot21}"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForGroupDistance 3
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC
		wait 5
		call Obj_OgreIH.KillActorType 20
		wait 5
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC

		;// NamedMob
		echo Named ${_NamedNPC} ${NamedMob}
		call Obj_OgreUtilities.PreCombatBuff 5
		Actor[namednpc,"${_NamedNPC}"]:DoTarget
		wait 20
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" ClearTargetIfTargetDistanceOver 100
		wait 10
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
    
    }
    
}