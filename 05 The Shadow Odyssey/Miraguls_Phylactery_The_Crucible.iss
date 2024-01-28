;================================================================================
; Title: Miragul's Phylactery: The Crucible | Author: Unknown, The Marty Party | Date: 26 Jan 2024 | Version: 2.0
;================================================================================

variable string sZoneShortName="exp05_dun_miragul_shard"
variable string sZoneName="Miragul's Phylactery: The Crucible"
variable(global) collection:string gcsRetValue
variable(global) int iZoneResetTime=0
variable bool KnowledgeShardPlaced=FALSE
variable bool ExileShardPlaced=FALSE
variable bool ThePlanarShardPlaced=FALSE
variable bool TheMasterShardPlaced=FALSE

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"

function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
}

atom atexit()
{
	echo ${Time} \agFinished auto-running ${sZoneName}.
}

atom(global) Crucible_onIncomingText(string Text)
{
	if ${Text.Find["Knowledge Shard"]} && ${Text.Find["locks into place"]}
    {
        echo ${Time}: \agPlacement Success! The Knowledge Shard has locked into place!
        KnowledgeShardPlaced:Set[TRUE]
    }
    elseif ${Text.Find["Exile Shard"]} && ${Text.Find["locks into place"]}
    {
        echo ${Time}: \agPlacement Success! The Exile Shard has locked into place!
        ExileShardPlaced:Set[TRUE]
    }
    elseif ${Text.Find["The Planar Shard"]} && ${Text.Find["locks into place"]}
    {
        echo ${Time}: \agPlacement Success! The Planar Shard has locked into place!
        ThePlanarShardPlaced:Set[TRUE]
    }
    elseif ${Text.Find["The Master Shard"]} && ${Text.Find["locks into place"]}
    {
        echo ${Time}: \agPlacement Success! The Master Shard has locked into place!
        TheMasterShardPlaced:Set[TRUE]
    }
}

objectdef Object_Instance
{
	function:bool RunInstance(int _StartingPoint=0)
	{       
        Event[EQ2_onIncomingText]:AttachAtom[Crucible_onIncomingText]
		if ${_StartingPoint} == 0
		{
            ogre ica
            wait 2
            
			echo ${Time} \agStarting to auto-run ${sZoneName}. Version: 2.0
            echo ${Time} \amNOTE: This needs to move your mouse in order to place the items properly. DO NOT touch your mouse at all and you should probably leave your session running the script on top.
					
        	Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",TRUE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",TRUE]
			
			Ogre_Instance_Controller:ZoneSet
		;	Obj_OgreUtilities.OgreNavLib:ChangeLoadingPath["InstanceController"]
			Obj_OgreUtilities.OgreNavLib:LoadMap
			
			call Obj_OgreIH.Set_VariousOptions
			OgreBotAPI:AutoTarget_SetScanRadius[igw:${Me.Name}, "40"]

			Obj_OgreIH:Set_NoMove
			_StartingPoint:Inc
		;    _StartingPoint:Set[3]
		}
        
        if ${_StartingPoint} == 1
		{
			call This.Named1 "Aimedaca"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#1: Aimedaca"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
		
        if ${_StartingPoint} == 2
		{
			call This.Named2 "Xorlac the Cleanser"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#2: Xorlac the Cleanser"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
        
		if ${_StartingPoint} == 3
		{
			call This.Named3 "The Master"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#3: The Master"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}
        
        if ${_StartingPoint} == 4
		{
			call This.Named4 "The Codexicon"
			if !${Return}
			{
				Obj_OgreIH:Message_FailedZone["#4: The Codexicon"]
				return FALSE
			}
			
			_StartingPoint:Inc
		}            
                    
        return TRUE

		;// Finish zone (zone out)
		if ${_StartingPoint} == 5
		{
            Obj_OgreIH:LetsGo
        	Ob_AutoTarget:Clear
			
			oc !c -cfw igw:${Me.Name} -Evac
			
			wait 50
			call Obj_OgreUtilities.HandleWaitForZoning
			wait 50
			
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_autotarget_outofcombatscanning",FALSE]
			Obj_OgreIH:ChangeOgreBotUIOption["checkbox_settings_disableabilitycollisionchecks",FALSE]
			/*
			;Check if the zone can be reset.
			call This.CheckZoneResetStatus
			if !${Return}
            {             
                return FALSE
            }
			;Reset the zone
			call This.ResetZone
			if !${Return}
            {                
                return FALSE
            }		
			*/
			_StartingPoint:Inc
		}

        return TRUE
    }

    ;// Aimedaca
    function:bool Named1(string _NamedNPC="Aimedaca")
	{
        variable point3f KnowledgeShard_Loc1="-30.502022,0.002501,-51.925442"
        variable point3f KnowledgeShard_Loc2="-37.019802,0.002502,-53.950726" 
        variable point3f ExileShard_Loc1="-9.838437,0.002501,-52.427448"
        variable point3f ExileShard_Loc2="-3.421252,0.002502,-54.013760" 

        echo ${Time}: Moving to Aimedaca
		Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["-19.979010,0.350564,-66.894783"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-9.195451,0.002500,-65.406708"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-8.723104,0.002501,-52.133339"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-19.841654,0.002756,-44.906525"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-19.960575,0.002500,-24.336273"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-52.926907,0.002500,-2.610643"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-88.978928,0.002494,18.056389"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-83.668388,0.366263,34.011894"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        ;// Key Mob
        echo ${Time}: Killing Key Mob
		Obj_OgreIH:ChangeCampSpot["-108.043480,1.093794,40.912170"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10
        Ob_AutoTarget:AddActor["a hidden tome",0,FALSE,FALSE]
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

		Obj_OgreIH:ChangeCampSpot["-118.388412,1.093794,24.701805"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-109.266678,1.093794,8.057361"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        oc !c -ChangeCampSpotWho ${Me.Name} -113.955788 0.208666 13.591766
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        ;// Grabbing Knowledge Shard (1FEW)
        call PrepareToPlaceItem "The Knowledge Shard"

        oc !c -ChangeCampSpotWho ${Me.Name} -109.266678 1.093794 8.057361
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-109.233444,1.093794,8.223472"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-88.652122,0.002494,17.455835"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-53.732956,0.111898,-2.346630"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-20.346006,0.077946,-30.784441"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-20.381023,0.350564,-42.057629"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        oc !c -ChangeCampSpotWho ${Me.Name} -36.806862 2.156523 -55.166515
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        ;// Placing Knowledge Shard (1FEW)
        call PlaceItemWithChecks "The Knowledge Shard" 90.552345 ${KnowledgeShard_Loc1} ${KnowledgeShard_Loc2} "KnowledgeShardPlaced"

		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-20.148275,0.102644,-43.157352"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-19.809715,0.002500,-23.847103"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["12.722314,0.002500,-2.804782"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["48.424713,1.118366,17.921839"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["81.108421,1.161303,11.421154"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["81.184128,1.167084,49.099735"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["41.269962,1.184099,45.847301"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["46.971024,1.136707,17.326181"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["84.796005,1.183493,14.302903"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        oc !c -ChangeCampSpotWho ${Me.Name} 80.034996 1.110023 43.988167
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        ;// Grabbing Exile Shard (1FWW)
        call PrepareToPlaceItem "The Exile Shard"

        oc !c -ChangeCampSpotWho ${Me.Name} 84.796005 1.183493 14.302903
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["80.034996,1.110023,43.988167"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["43.088245,2.055857,50.614605"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["47.884296,1.119620,18.438576"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["33.710129,0.113129,9.226957"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-19.907490,0.002500,-27.114368"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-19.927753,0.002688,-44.394341"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		oc !c -ChangeCampSpotWho ${Me.Name} -2.996917 2.156523 -55.190434
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        ;// Placing Exile Shard (1FWW)
        call PlaceItemWithChecks "The Exile Shard" 268.049988 ${ExileShard_Loc1} ${ExileShard_Loc2} "ExileShardPlaced"

		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-19.337954,0.002641,-44.047821"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-20.296728,0.002500,-23.082167"]
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 10

        Obj_OgreIH:ChangeCampSpot["-49.413658,0.002500,-6.828265"]
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 10

        Obj_OgreIH:ChangeCampSpot["-19.895420,0.002500,18.009056"]
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 10

        Obj_OgreIH:ChangeCampSpot["-19.908068,2.867872,-2.650955"]
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 10
 
		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
			return TRUE
		}

		eq2execute summon
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10		

        return TRUE
    }
	
    ;// Xorlac the Cleanser
    function:bool Named2(string _NamedNPC="Xorlac the Cleanser")
	{        
        variable point3f WestBenchLoc="75.267227,16.078016,91.051041"
        variable point3f WestFishPlatformLoc="59.303192,17.542385,82.984818"
        variable point3f WestTreePlatformLoc="44.880814,17.436731,91.828926"
        variable point3f WestFearlingPlatformLoc="74.312515,17.509647,109.066513"
        variable point3f WestCloudPlatformLoc="59.318703,17.540070,117.430634"
        variable point3f ThePlanarShard_Loc1="11.325734,15.714262,133.809189"
        variable point3f ThePlanarShard_Loc2="7.197182,15.714262,140.954575" 

        echo ${Time}: Moving to Xorlac the Cleanser
		Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["-20.172823,0.002500,24.924437"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-20.119501,15.714262,102.675278"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10
        
		Obj_OgreIH:ChangeCampSpot["-19.874819,15.714262,124.857727"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["2.738975,15.695353,136.705582"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["12.843655,15.738943,126.687225"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["51.499657,16.047575,104.909019"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["74.649841,15.714247,97.302826"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["55.010742,16.465126,92.240318"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestBenchLoc.X} ${WestBenchLoc.Y} ${WestBenchLoc.Z}
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        EQ2EXECUTE Target_None

        call PrepareToPlaceItem "a tiny fish"         

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestFishPlatformLoc.X} ${WestFishPlatformLoc.Y} ${WestFishPlatformLoc.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 10

        call PlaceItemNoChecks "a tiny fish"  96.042892

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestBenchLoc.X} ${WestBenchLoc.Y} ${WestBenchLoc.Z}
        call Obj_OgreUtilities.HandleWaitForCampSpot 10

        call PrepareToPlaceItem "a tiny tree"

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestFishPlatformLoc.X} ${WestFishPlatformLoc.Y} ${WestFishPlatformLoc.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 10

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestTreePlatformLoc.X} ${WestTreePlatformLoc.Y} ${WestTreePlatformLoc.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 10

        call PlaceItemNoChecks "a tiny tree" 145.715088

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestFishPlatformLoc.X} ${WestFishPlatformLoc.Y} ${WestFishPlatformLoc.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 10

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestBenchLoc.X} ${WestBenchLoc.Y} ${WestBenchLoc.Z}
        call Obj_OgreUtilities.HandleWaitForCampSpot 10

        call PrepareToPlaceItem "a tiny fearling"

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestFearlingPlatformLoc.X} ${WestFearlingPlatformLoc.Y} ${WestFearlingPlatformLoc.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 10

        call PlaceItemNoChecks "a tiny fearling" 157.946228

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestBenchLoc.X} ${WestBenchLoc.Y} ${WestBenchLoc.Z}
        call Obj_OgreUtilities.HandleWaitForCampSpot 10

        call PrepareToPlaceItem "a tiny cloud"

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestFearlingPlatformLoc.X} ${WestFearlingPlatformLoc.Y} ${WestFearlingPlatformLoc.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 10 

        oc !c -ChangeCampSpotWho ${Me.Name} ${WestCloudPlatformLoc.X} ${WestCloudPlatformLoc.Y} ${WestCloudPlatformLoc.Z}
		call Obj_OgreUtilities.HandleWaitForCampSpot 10

        call PlaceItemNoChecks "a tiny cloud" 118.668854

        oc !c -ChangeCampSpotWho ${Me.Name} 46.744919 15.714247 106.952431
        call Obj_OgreUtilities.HandleWaitForCampSpot 10        

        oc !c -ChangeCampSpotWho ${Me.Name} 55.478809 16.380919 93.390816
        call Obj_OgreUtilities.HandleWaitForCampSpot 10

		Ob_AutoTarget:AddActor["${_NamedNPC}",0,FALSE,FALSE]
		wait 10
		call Obj_OgreUtilities.HandleWaitForCombatWithNPC "${_NamedNPC}" 
        wait 10
		
        Ob_AutoTarget:AddActor["Narciss",0,FALSE,FALSE]
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10
        Ob_AutoTarget:AddActor["Xorlac the Cleanser",0,FALSE,FALSE]
        call Obj_OgreUtilities.HandleWaitForCombat
        wait 10

		if !${Actor[exactname,"${_NamedNpc}"].ID(exists)}
		{
			Obj_OgreIH:Message_NamedDoesNotExistSkipping["${_NamedNpc}"]
		}

		eq2execute summon
		call Obj_OgreUtilities.WaitWhileGroupMembersDead
		wait 10

		Obj_OgreIH:ChangeCampSpot["59.539490,16.487272,100.288528"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        oc !c -ChangeCampSpotWho ${Me.Name} 73.232025 16.245638 92.285545
        call Obj_OgreUtilities.HandleWaitForCampSpot 10

        ;// Grabbing Planar Shard (2FWW)
        call PrepareToPlaceItem "The Planar Shard"

        oc !c -ChangeCampSpotWho ${Me.Name} 59.539490 16.487272 100.288528
        call Obj_OgreUtilities.HandleWaitForCampSpot 10

		Obj_OgreIH:ChangeCampSpot["13.493958,15.823652,126.895844"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        oc !c -ChangeCampSpotWho ${Me.Name} 8.406139 17.757206 142.079193
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        
        ;// Placing Planar Shard (2FWW)
        call PlaceItemWithChecks "The Planar Shard" 152.662201 ${ThePlanarShard_Loc1} ${ThePlanarShard_Loc2} "ThePlanarShardPlaced"

        Obj_OgreIH:SetCampSpot
        oc !c -ChangeCampSpotWho ${Me.Name} 13.493958 15.823652 126.895844
        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 10

        return TRUE
    }
	
    ;// The Master
    function:bool Named3(string _NamedNPC="The Master")
	{	
        variable string Master1="Master Velihan"
        variable string Master2="Master Rayne"
        variable string Master3="Master Delar"
        variable string Master4="The Master"   
        variable point3f TheMasterShard_Loc1="-51.132614,15.714262,131.986633"
        variable point3f TheMasterShard_Loc2="-47.092171,15.714262,140.570496"     

        echo ${Time}: Moving to The Master
		Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["-39.028648,15.569159,144.069275"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-53.420021,15.823656,126.578308"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-88.302040,15.831921,106.802963"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-92.136902,15.831923,125.599297"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-82.686890,15.831923,99.872223"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-92.983437,15.831923,91.231087"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-108.213989,15.831945,91.319809"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-111.012093, 15.831945, 111.606651"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        call Obj_OgreUtilities.PreCombatBuff 8

        if ${Actor[${Master1}](exists)} && ${Actor[${Master2}](exists)} && ${Actor[${Master3}](exists)}
        {
            Ob_AutoTarget:AddActor["${Master1}",52,FALSE,FALSE]
            Ob_AutoTarget:AddActor["${Master2}",52,FALSE,FALSE]
            Ob_AutoTarget:AddActor["${Master3}",52,FALSE,FALSE]

            OgreBotAPI:Target[${Me.Name},${Master1}]
            wait 20

            if ${Actor[${Master1}].Health} > 50 || ${Actor[${Master2}].Health} > 50 || ${Actor[${Master3}].Health} > 50
            {
                echo ${Time}: Waiting for all three masters to be at or below 50% health.
                while ${Actor[${Master1}].Health} > 50 || ${Actor[${Master2}].Health} > 50 || ${Actor[${Master3}].Health} > 50
                    waitframe
                echo ${Time}: All three masters are now at or below 50% health. ${Master1}: ${Actor[${Master1}].Health} ${Master2}: ${Actor[${Master2}].Health} ${Master3}: ${Actor[${Master3}].Health}
            }

            echo ${Time}: [1] Checking [${Master1}] for it's type [${Actor[${Master1}].Type}]. It should be NoKill NPC.
            if ${Actor[${Master1}].Type.Equal["NamedNPC"]}
            {
                do
                {
                    call ToggleMastersMove "${Master1}"              
                }
                while ${Actor[${Master1}].Type.Equal["NamedNPC"]}            
            }
            echo ${Time}: [2] Checking [${Master1}] for it's type [${Actor[${Master1}].Type}]. It should be NoKill NPC.

            echo ${Time}: [1] Checking [${Master2}] for it's type [${Actor[${Master2}].Type}]. It should be NoKill NPC.
            if ${Actor[${Master2}].Type.Equal["NamedNPC"]}
            {
                do
                {
                    call ToggleMastersMove "${Master2}"              
                }
                while ${Actor[${Master2}].Type.Equal["NamedNPC"]}
            }
            echo ${Time}: [2] Checking [${Master2}] for it's type [${Actor[${Master2}].Type}]. It should be NoKill NPC.

            echo ${Time}: [1] Checking [${Master3}] for it's type [${Actor[${Master3}].Type}]. It should be NoKill NPC.
            if ${Actor[${Master3}].Type.Equal["NamedNPC"]}
            {
                do
                {
                    call ToggleMastersMove "${Master3}"              
                }
                while ${Actor[${Master3}].Type.Equal["NamedNPC"]}
            }
            echo ${Time}: [2] Checking [${Master3}] for it's type [${Actor[${Master3}].Type}]. It should be NoKill NPC.

            echo ${Time}: All masters have changed their type to NoKill NPC. Moving on to the final Master fight.
            
            oc !c -ChangeCampSpotWho igw:${Me.Name} -111.012093 15.831945 111.606651
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            call Obj_OgreUtilities.HandleWaitForGroupDistance 2
        }

        wait 100

        if ${Actor["${Master4}"](exists)}
        {
            if ${Actor["${Master4}"].Type.Equal["NoKill NPC"]}
            {
                echo ${Time}: Waiting for ${Master4} to become attackable.
                while ${Actor["${Master4}"].Type.Equal["NoKill NPC"]}
                    waitframe

                wait 10                
            }

            Ob_AutoTarget:AddActor["${Master4}",0,FALSE,FALSE]
            echo ${Time}: Attacking ${Master4}
            wait 40
            if ${Me.InCombat}
            {
                echo ${Time}: Waiting while I'm in combat.
                while ${Me.InCombat}
                    waitframe
            }            
        }       
    
        call Obj_OgreUtilities.HandleWaitForCombat
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        eq2execute summon
        wait 30
        
        Obj_OgreIH:SetCampSpot
        oc !c -ChangeCampSpotWho ${Me.Name} -125.276451 14.644460 111.395538
        call Obj_OgreUtilities.HandleWaitForCampSpot 20

        ;// Grabbing Master Shard (2FEW)
        call PrepareToPlaceItem "The Master Shard"

        oc !c -ChangeCampSpotWho ${Me.Name} -111.012093 15.831945 111.606651
        call Obj_OgreUtilities.HandleWaitForCampSpot 20
        call Obj_OgreUtilities.HandleWaitForGroupDistance 2	        

		Obj_OgreIH:ChangeCampSpot["-109.624657,15.831945,91.365028"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-90.142731,15.831923,91.701889"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-86.959862,15.831923,107.199409"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-74.374832,15.824926,115.115524"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-53.845497,15.823668,126.907433"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-34.391682,15.714262,117.711014"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

        oc !c -ChangeCampSpotWho ${Me.Name} -48.436272 17.868279 141.506149
        call Obj_OgreUtilities.HandleWaitForCampSpot 20

        ;// Placing Master Shard (2FEW)
        call PlaceItemWithChecks "The Master Shard" 115.261673 ${TheMasterShard_Loc1} ${TheMasterShard_Loc2} "TheMasterShardPlaced"

        oc !c -ChangeCampSpotWho ${Me.Name} -34.391682 15.714262 117.711014
        call Obj_OgreUtilities.HandleWaitForCampSpot 10

        wait 400
        return TRUE
    }

    ;// Codexicon
    function:bool Named4(string _NamedNPC="Codexicon")
	{	       
        echo ${Time}: Moving to Codexicon
		Obj_OgreIH:SetCampSpot

		Obj_OgreIH:ChangeCampSpot["-19.343893,17.800816,134.422989"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-12.215135,19.628014,124.922798"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-21.355253,21.381470,118.044411"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-27.379297,23.113075,127.312248"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-19.687054,24.731367,133.904938"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-11.691615,26.303310,126.723969"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-19.555485,28.133965,117.921349"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-28.091948,29.943903,126.473221"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-18.539005,31.785126,133.932037"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-12.242017,33.623695,123.804520"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-23.559227,35.583035,118.462097"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-27.113628,37.471310,131.066086"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-13.621172,39.380329,132.224304"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-15.205899,41.447792,118.050316"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-28.606735,43.352173,123.006012"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-21.481190,45.242134,135.527206"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-11.075454,47.272358,124.279289"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-22.062134,49.066490,117.744530"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-29.615841,50.426052,126.771828"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-20.077208,50.426052,136.507568"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		wait 10

		Obj_OgreIH:ChangeCampSpot["-19.875662,50.536861,155.097031"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
        call Obj_OgreUtilities.HandleWaitForCombat
		eq2execute summon
		wait 10

        ;// Moving into named room
        oc !c -ChangeCampSpotWho igw:${Me.Name} -19.865181 50.536861 154.662598
        call Obj_OgreUtilities.HandleWaitForCampSpot 10	
        call Obj_OgreUtilities.HandleWaitForCombat 20

        oc !c -ChangeCampSpotWho igw:${Me.Name} -21.001884 49.672085 186.301239
        call Obj_OgreUtilities.HandleWaitForCampSpot 10	
        call Obj_OgreUtilities.HandleWaitForCombat 20

        ;// Setup for Named
        oc !c -ChangeCampSpotWho igwbn:${Me.Name} -18.665012 49.672085 205.123978
        oc !c -ChangeCampSpotWho ${Me.Name} -21.073830 49.672085 196.769119
        
        wait 300
        if ${Me.InCombat}
        {
            OgreBotAPI:CastAbility_Relay["all","Tortoise Shell"]
            wait 300
            OgreBotAPI:CastAbility_Relay["all","Bladedance"]
            echo ${Time}: Waiting while I'm in combat.
            while ${Me.InCombat}
                waitframe
        }  

        wait 20
        eq2execute summon
		wait 20
		call Obj_OgreUtilities.WaitWhileGroupMembersDead

        if ${Actor["A Chest of Tangible Memories"](exists)} && ${Math.Distance[${Actor["A Chest of Tangible Memories"].Loc},-33.456093,49.669998,189.811157]} <= 5
        {
            oc !c -ChangeCampSpotWho igw:${Me.Name} -33.456093 49.669998 189.811157
            call Obj_OgreUtilities.HandleWaitForCampSpot 20
            call Obj_OgreUtilities.HandleWaitForGroupDistance 2	
        }

        oc !c -LetsGo igw:${Me.Name}

        return TRUE
    }  

    function ToggleMastersMove(string _actorName)
    {
        variable point3f MasterMoveNorth="-105.602066,15.831945,89.294685"
        variable point3f MasterMoveSouth="-106.178726,15.831945,128.512741"
        
        if ${Math.Distance[${Me.Loc},${MasterMoveNorth}]} > 10
        {
            echo ${Time}: Moving [${_actorName}] to north location.
            oc !c -ChangeCampSpotWho igw:${Me.Name} ${MasterMoveNorth.X} ${MasterMoveNorth.Y} ${MasterMoveNorth.Z}
            call Obj_OgreUtilities.HandleWaitForGroupDistance 2	
            call Obj_OgreUtilities.HandleWaitForCampSpot 100
        }
        elseif ${Math.Distance[${Me.Loc},${MasterMoveSouth}]} > 10
        {
            echo ${Time}: Moving [${_actorName}] to south location.
            oc !c -ChangeCampSpotWho igw:${Me.Name} ${MasterMoveSouth.X} ${MasterMoveSouth.Y} ${MasterMoveSouth.Z}
            call Obj_OgreUtilities.HandleWaitForGroupDistance 2	
            call Obj_OgreUtilities.HandleWaitForCampSpot 100
        }
    }

    function PrepareToPlaceItem(string _actorName)
    {
        if ${Me.In3rdPersonView}
        {
            echo ${Time}: Setting first person
            call Obj_OgreUtilities.Set_FirstPersonView
            wait 30
            echo ${Time}: Looking down
            call Obj_OgreUtilities.Set_LookDown 30	
            wait 30
        }

        echo ${Time}: Picking up [${_actorName}]
        Actor["${_actorName.Escape}"]:DoubleClick
        wait 10
        echo ${Time}: Moving mouse to center of screen
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
    }	

    function PlaceItemNoChecks(string _actorName, float _heading)
    {
        echo ${Time}: Facing heading.
        Me:Face[${_heading}]
        wait 10

        ;echo ${Time}: Moving mouse to center of screen
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
        wait 10
        echo ${Time}: Placing [${_actorName}]
        Mouse:LeftClick    
        wait 10

        ;echo ${Time}: Reseting view
        ;call Obj_OgreUtilities.ResetCameraAngle
        ;call Obj_OgreUtilities.Set_ZoomOut

        wait 10
    }

    function PlaceItemWithChecks(string _actorName, float _heading, point3f _location1, point3f _location2, string _boolName)
    {        
        echo ${Time}: Facing heading.
        Me:Face[${_heading}]
        wait 10

        ;echo ${Time}: Moving mouse to center of screen
        Mouse:SetPosition[${Math.Calc[(${Display.WindowWidth}*50)/100].Int},${Math.Calc[(${Display.WindowHeight}*50)/100].Int}]
        wait 10
        echo ${Time}: Placing [${_actorName}]
        Mouse:LeftClick    
        wait 10

        ;echo ${Time}: Reseting view
        ;call Obj_OgreUtilities.ResetCameraAngle
        ;call Obj_OgreUtilities.Set_ZoomOut

        wait 10

        ;Check if the item was correctly placed
        if !${${_boolName}}
        {
            echo ${Time}: \ar[${_actorName}] did NOT place correctly. Trying again.
            call PrepareToPlaceItem "${_actorName}"
            call PlaceItemWithChecks "${_actorName}" ${_heading} ${_location1} ${_location2} "${_boolName}"
            return
        }

        echo ${Time}: Reseting view
        call Obj_OgreUtilities.ResetCameraAngle
        call Obj_OgreUtilities.Set_ZoomOut
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
			;	echo ${Time}: Time remaining until reset: [${Math.Calc[${iZoneResetTime}-${Time.Timestamp}].Int} seconds] [${Math.Calc[(${iZoneResetTime}-${Time.Timestamp})/60].Int} minutes]
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
}