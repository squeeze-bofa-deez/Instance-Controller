variable string sZoneName="The Poets Palace"
variable string sZoneShortName="exp01_dun_poets_palace"
variable string sZoneIn_ObjectName="door_to_clefts_of_rujark"
variable string exitName="01_door_to_clefts_of_rujark"



#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"
#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Support_Files_Common/Path_Helper_Include.iss"

function main(int _StartingPoint=0, string statueType = "brass", ... Args)
{
	call function_Handle_Startup_Process ${_StartingPoint} ${statueType} "-NoAutoLoadMapOnZone" ${Args.Expand}
}

atom atexit()
{
    Event[EQ2_ActorSpawned]:DetachAtom[ActorSpawned]
	echo ${Time}: ${Script.Filename} done
}

atom(script) ActorSpawned(string ID, string Name, string Level, string _Type)
{
	if ${Name.Lower.Find["chest"]}
	{
		eq2execute "/summon_chest"
	}
}

objectdef Object_Instance
{
    variable int currentRuneCount
    variable bool waitingForText
    variable bool shouldKeepDoorsOpen = FALSE
    variable bool inDebugMode = TRUE
    variable string statueDoorManagerName
    variable string pedestalDoorManagerName
    
	function:bool RunInstance(int startingPoint=0, string statueType)
	{
        if ${innerspace.Build} < 7001
        {
            MessageBox "This IC file only support innerspace builds >= 7001.  Please upgrade and try again."
            return FALSE
        }

        Event[EQ2_ActorSpawned]:AttachAtom[ActorSpawned]
        if ${startingPoint} == 0
        {
            call Obj_OgreIH.Set_VariousOptions
			oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_facenpc TRUE
			
			Obj_OgreIH:Set_NoMove
            if !${Zone.ShortName.Equal["${sZoneShortName}"]}
            {
                oc "You must start the Poets Palace script from inside the zone."
                return FALSE
            }

            Ogre_Instance_Controller:ZoneSet
            startingPoint:Inc
        }

        if ${startingPoint} == 1
        {
            call This.ClearNamesFromFirstFloor
            if !${Return}
            {
                Obj_OgreIH:Message_FailedNamed["Failed to pull nameds to first floor"]
                return FALSE
            }

            startingPoint:Inc
        }

        if ${startingPoint} == 2
        {
            call This.ClearMobsOnSecondFloor

            if !${Return}
            {
                Obj_OgreIH:Message_FailedNamed["Failed to clear second floor mobs"]
                return FALSE
            }

            startingPoint:Inc
        }

        if ${startingPoint} == 3
        {
            call This.SetupForStatues
            if !${Return}
            {
                Obj_OgreIH:Message_FailedNamed["Failed to setup for statues"]
                return FALSE
            }

            startingPoint:Inc
        }

        if ${startingPoint} == 4
        {
            call This.MoveStatues ${statueType}
            if !${Return}
            {
                Obj_OgreIH:Message_FailedNamed["Failed to solve statues"]
                return FALSE
            }

            startingPoint:Inc
        }

        if ${startingPoint} == 5
        {
            call This.KillLastName

            if !${Return}
            {
                Obj_OgreIH:Message_FailedNamed["Failed to kill the last name"]
                return FALSE
            }

            startingPoint:Inc
        }

        return TRUE
    }

    function:bool ClearNamesFromFirstFloor()
    {
        variable jsonvalue route
        route:SetValue["$$>[
            '54.251995,144.882141,-61.469582',
            '18.612986,142.895554,-45.221218',
            '18.287466,145.788513,-27.677738',
            '38.424370,145.762619,-8.241594',
            '19.622166,145.757339,-5.515256'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route
        This:Log["pulling ruby scarab ring event"]
        call This.ClearRingEvent

        if !${Return}
        {
           This:Log["Failed to clear the ruby scarab ring event, skipping"]
           
        }

        route:SetValue["$$>[
            '4.664483,145.746719,-5.148266',
            '-42.688049,145.749710,-5.705729',
            '-39.129715,144.549469,-13.531248',
            '-48.586906,144.548370,-11.704060'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route

        This:Log["pulling sapphire scarab ring event"]
        call This.ClearRingEvent

        if !${Return}
        {
             This:Log["Failed to clear the sapphire scarab ring event, skipping"]
        }

        route:SetValue["$$>[
            '-54.104050,144.547546,-15.526175',
            '-48.345993,144.547546,-41.336987',
            '-45.459503,145.749329,-64.633324'
        ]<$$"]
        call Obj_PathHelper.GroupFollowCampSpotPath route

        ; Open door
        This:Log["Opening door"]
        oc !ci -Zone

        route:SetValue["$$>[
            '-44.969585,145.749329,-73.620422',
            '-47.904362,144.550034,-106.228485'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route

        This:Log["pulling emerald scarab ring event"]
        call This.ClearRingEvent
        if !${Return}
        {
            This:Log["Failed to clear the emerald scarab ring event, skipping"]
        }

        This:Log["pulling nameds"]
        call This.PetPullNameds

        route:SetValue["$$>[
            '-63.258553,145.749695,-113.809586',
            '-87.171959,144.548523,-107.439850',
            '-93.585236,145.749634,-49.478230'
        ]<$$"]
        call Obj_PathHelper.GroupFollowCampSpotPath route

        ; Open door
        This:Log["Opening door"]
        oc !ci -Zone

        route:SetValue["$$>[
            '-94.701218,145.765320,-39.391918',
            '-106.016655,144.547546,-4.031038',
            '-94.236389,145.765335,28.141315',
            '-94.888039,146.980057,38.880905'
        ]<$$"]
        call Obj_PathHelper.GroupFollowCampSpotPath route

        This:Log["Clicking Mirror"]
        oc !ci -special igw:${Me.Name}
		wait 500
		call Obj_OgreUtilities.HandleWaitForZoning 
    }

    function:bool ClearRingEvent()
    {
        variable bool didKillCobra = FALSE
        variable int loops = 0
        variable int attemptsToGetTarget = 0

        This:Log["Clearing ring event"]
        do
        {
            do
            {
                wait 50
                Actor[Query,Name=-"scarab" || Name=-"cobra"]:DoTarget
                attemptsToGetTarget:Inc
            }
            while ${attemptsToGetTarget} < 20
            
            if !${Me.Target(exists)}
            {
                return True
            }

            attemptsToGetTarget:Set[0]
            loops:Inc
            This:Log["Target: ${Me.Target.Name}"]
            

            if ${Me.Target.Name.Find["cobra"]} > 0
            {
                didKillCobra:Set[TRUE]
            }
            
            call This.PetPullTarget
            if !${Return}
            {
                This:Log["Failed to pet pull"]
                return FALSE
            }

            call Obj_OgreUtilities.HandleWaitForCombatOrPower 100 TRUE 999
            call Obj_OgreUtilities.WaitWhileGroupMembersDead
            call Obj_OgreUtilities.HandleWaitForGroupDistance 5
        }
        while !${didKillCobra} && ${loops} < 20
        
        variable bool result
        
        return TRUE
    }

    function:bool PetPullNameds()
    {
        variable int namedCount = 0
        do
        {
            Actor[Query,Name=-"creature" || Name=-"uniq" ||Name=-"keeper"]:DoTarget
            call This.PetPullTarget
            call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
            call Obj_OgreUtilities.WaitWhileGroupMembersDead
            call Obj_OgreUtilities.HandleWaitForGroupDistance 5

            namedCount:Inc
        }
        while ${namedCount} < 4
        
    }

    function:bool PetPullTarget()
    {
        variable int loopsWaitingForPetToEngage = 0
        variable int loopsWaitingForCombat = 0
        oc !ci -PetAttack
        while !${Me.Target.Target(exists)} && ${loopsWaitingForPetToEngage} < 20
        {
            wait 50
            loopsWaitingForPetToEngage:Inc
        }

        if !${Me.Target.Target(exists)}
        {
            oc "Target's Target: ${Me.Target.Target.Name}"
            oc "loopsCount"
            Obj_OgreIH:Message_FailedNamed["Failed to pet pull ${Me.Target.Name}"]
            return FALSE
        }

        oc !ci -PetOff
        do
        {
            wait 50
            loopsWaitingForCombat:Inc
        }
        while !${Me.InCombat} && ${loopsWaitingForCombat} < 20

        return ${Me.InCombat}
    }

    function:bool ClearMobsOnSecondFloor()
    {
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
            '29.995863,185.966827,-100.755539',
            '27.903864,184.764709,-64.706512',
            '20.651197,184.766830,4.473468',
            '8.520684,185.966812,5.562317'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route

        oc !ci -Zone

        route:SetValue["$$>[
            '2.200686,186.008713,6.198033',
            '-17.249477,185.010193,6.143988'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route
      
        return TRUE
    }

    function:bool SetupForStatues()
    {
        statueDoorManagerName:Set[${Me.GetGameData[Group.Group_1.Name].Label}]
        pedestalDoorManagerName:Set[${Me.GetGameData[Group.Group_2.Name].Label}]
        Obj_OgreIH:SetCampSpot
        oc !ci -ChangeCampSpotWho ${pedestalDoorManagerName} "-33.771969,186.008499,-2.846248"
        oc !ci -ChangeCampSpotWho ${statueDoorManagerName} "3.889166,186.006561,8.615744"
        oc !ci -ChangeCampSpotWho ${Me.Name} "3.313305,186.007294,5.921949"

        oc "Campspots set, waiting until we get there"

        call Obj_OgreUtilities.HandleWaitForCampSpot 10
        wait 5
        oc "At campspot, opening door"
        oc !ci -Zone ${statueDoorManagerName}
        wait 10
        oc "Door open? following route"
        
        variable jsonvalue route = "[]"
        route:SetValue["$$>[
            '11.006015,185.966812,5.895697',
            '23.088936,184.766968,-3.304097',
            '34.256638,184.764709,-50.707447 '
        ]<$$"]        
        
        call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" route

        return TRUE
    }

    function:bool MoveStatues(string startingStatueType)
    {
        variable int currentStatueType = 0
        call Obj_OgreUtilities.ResetCameraAngle
        OgreBotAPI:SetMousePosition_Middle
        echo "starting with ${startingStatueType}"
        if !${startingStatueType.Equal[NULL]}
        {
            echo "startingStatueType ${startingStatueType}"
            if ${startingStatueType.Equal["brass"]}
            {
                currentStatueType:Set[0]
            }
            if ${startingStatueType.Equal["steel"]}
            {
                currentStatueType:Set[1]
            }
            if ${startingStatueType.Equal["plat"]}
            {
                currentStatueType:Set[2]
            }
            
        }
        
        if ${currentStatueType} == 0
        {
            echo "Moving brass statues"
            call This.MoveStatuesToPedestals "brass"
            currentStatueType:Inc
        }

        if ${currentStatueType} == 1
        {
            echo "Moving steel statues"
            call This.MoveStatuesToPedestals "steel"
            currentStatueType:Inc
        }
        
        if ${currentStatueType} == 2
        {
            echo "Moving platinum statues"
            call This.MoveStatuesToPedestals "plat"
            currentStatueType:Inc
        }
       
        return TRUE
    }

    function:bool KillLastName()
    {
        return TRUE
    }

    function MoveStatuesToPedestals(string statueType)
    {
        variable jsonvalue statuesConfig
        variable string currentStatueId
        variable jsonvalue returnPath
        variable jsonvalue route = "[]"
        variable int pickupLocation = 1

        statuesConfig:SetValue["$$>
            {
                'statuePickupLocations': [
                    '40.283630,184.764740,-52.393955',
                    '35.425117,184.764709,-48.241749',
                    '34.842148,184.764709,-41.957584'
                ],
                'pathToFirstDoor': [
                    '29.595142,184.752899,-45.858353',
                    '18.436136,184.971268,3.644874',
                    '10.345403,185.966797,5.084543',
                ],
                'pathToPedestalRoomDoor': [
                    '3.960886,186.006042,6.220607',
                    '-34.188770,185.213821,3.048242'
                ],
                'pathToPedestalRoomEntrance': [
                    '-36.260475,186.002197,-9.302692'
                ],
                'brass': {
                    '1': {
                        'path': [
                            '-9.216434,185.464172,-62.606415',
                            '-2.585312,186.000061,-91.019981',
                            '-1.836224,185.998108,-92.200203'
                        ],
                        'pedestalName': 'f2_03_brass_stand_small_01'
                    },
                    '2': {
                        'path': [
                            '-9.216434,185.464172,-62.606415',
                            '-4.177772,186.000092,-57.809937'
                        ],
                        'pedestalName': 'f2_03_brass_stand_small_02'
                    },
                    '3': {
                        'path': [
                            '-27.628925,185.580261,-20.529484',
                            '-4.738121,186.000061,-25.067457'
                        ],
                        'pedestalName': 'f2_03_brass_stand_small_03'
                    },
                    '4': {
                        'path': [
                            '-39.120224,185.406555,-22.387043',
                            '-30.046535,185.998535,-14.952570'
                        ],
                        'pedestalName': 'f2_03_brass_stand_small_04'
                    },
                    '5': {
                        'path': [
                            '-37.426746,186.000183,-16.905220',
                            '-56.240456,186.000854,-14.062722',
                            '-56.800095,186.000977,-13.597249'
                        ],
                        'pedestalName': 'f2_03_brass_stand_small_05'
                    },
                    '6': {
                        'path': [
                            '-37.752853,186.000259,-16.617765',
                            '-87.932625,185.999847,-16.486786'
                        ],
                        'pedestalName': 'f2_03_brass_stand_small_06'
                    },
                    '7': {
                        'path': [
                            '-36.702831,185.317078,-22.545193',
                            '-80.691780,185.218445,-31.156696',
                            '-100.554924,186.000031,-48.382301'
                        ],
                        'pedestalName': 'f2_03_brass_stand_small_07'
                    },
                    '8': {
                        'path': [
                            '-36.702831,185.317078,-22.545193',
                            '-67.236565,185.218445,-64.491844',
                            '-81.782799,186.000092,-83.332550'  
                        ],
                        'pedestalName': 'f2_03_brass_stand_small_08'
                    },
                    '9': {
                        'path': [
                            '-36.702831,185.317078,-22.545193',
                            '-42.685940,185.218445,-49.131130',
                            '-67.811333,185.218445,-91.109947',
                            '-58.934383,186.000031,-106.579826'
                        ],
                        'pedestalName': 'f2_03_brass_stand_small_09'
                    }
                },
                'steel': {
                    '1': {
                        'path': [
                            '-9.216434,185.464172,-62.606415',
                            '-10.726053,186.000061,-106.440819'
                        ],
                        'pedestalName': 'f2_03_steel_stand_small_01'
                    },
                    '2': {
                        'path': [
                            '-14.767135,185.218445,-34.978943',
                            '-3.147804,186.000122,-40.117489'
                        ],
                        'pedestalName': 'f2_03_steel_stand_small_02'
                    },
                    '3': {
                        'path': [
                            '-41.655987,186.001083,-13.470402'
                        ],
                        'pedestalName': 'f2_03_steel_stand_small_03'
                    },
                    '4': {
                        'path': [
                            '-80.088943,185.218445,-28.243879',
                            '-100.388885,186.000046,-29.801861'
                        ],
                        'pedestalName': 'f2_03_steel_stand_small_04'
                    },
                    '5': {
                        'path': [
                            '-67.236565,185.218445,-64.491844',
                            '-76.401352,186.000122,-98.499367'
                        ],
                        'pedestalName': 'f2_03_steel_stand_small_05'
                    }
                },
                'plat': {
                    '1': {
                        'path': [
                            '-9.216434,185.464172,-62.606415',
                            '-2.685786,186.000122,-73.112846'
                        ],
                        'pedestalName': 'f2_03_plat_stand_small_01'
                    },
                    '2': {
                        'path': [
                            '-31.952591,186.000443,-15.992963',
                            '-18.775253,185.999954,-14.349489'
                        ],
                        'pedestalName': 'f2_03_plat_stand_small_02'
                    },
                    '3': {
                        'path': [
                            '-38.267223,186.000137,-17.077957',
                            '-74.492859,186.000504,-15.305400'
                        ],
                        'pedestalName': 'f2_03_plat_stand_small_03'
                    },
                    '4': {
                        'path': [
                            '-36.702831,185.317078,-22.545193',
                            '-80.691780,185.218445,-31.15669',
                            '-97.048859,185.714172,-59.56897',
                            '-100.265656,186.000061,-68.166260'
                        ],
                        'pedestalName': 'f2_03_plat_stand_small_04'
                    }
                }
            }
        <$$"]

        
        while ${pickupLocation} <= ${statuesConfig.Get[statuePickupLocations].Size}
        {
            route:SetValue["$$>[
                '${statuesConfig.Get[statuePickupLocations].Get[${pickupLocation}]}'
            ]<$$"]
            echo "pickupLocation: ${route.AsJSON~}"
            call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" route

            currentStatueId:Set[${Actor[Query, Name =- "a small ${statueType} statue" && Distance < "6"].ID}]
            echo "statueId: ${currentStatueId}"
            echo "statueDistance: ${Actor[${currentStatueId}].Distance}"

            if ${currentStatueId.Equal[NULL]}
            {
                echo "No statue found close by, go to next pickup location"
                pickupLocation:Inc
                continue
            }
            call This.GetStatueRuneCount "${currentStatueId}"

            wait 20

            Actor[${currentStatueId}]:DoubleClick
            call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" "statuesConfig.Get[pathToFirstDoor]"
            oc !ci -Zone ${statueDoorManagerName}
            call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" "statuesConfig.Get[pathToPedestalRoomDoor]"
            oc !ci -Zone ${pedestalDoorManagerName}
            call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" "statuesConfig.Get[pathToPedestalRoomEntrance]"

            call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" "statuesConfig.Get[${statueType},${currentRuneCount},path]"

            call This.PlaceStatue "${currentStatueId}" "${statuesConfig.Get[${statueType},${currentRuneCount},pedestalName]}"
            
            returnPath:SetValue["${statuesConfig.Get[${statueType},${currentRuneCount},path].AsJSON~}"]
            returnPath:Reverse
            echo "ReturnPath ${returnPath.AsJSON~}"
            call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" "returnPath"

            if ${Actor[name, "a cyclops statue"](exists)}
            {
                route:SetValue["$$>[
                    '-39.738998,185.218445,-39.780079'
                ]<$$"]
                
                call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" route
                
                call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" "returnPath"
                ${Actor[name, "a cyclops statue"]:DoTarget
                wait 5

            }

            returnPath:SetValue["${statuesConfig.Get[pathToPedestalRoomEntrance].AsJSON~}"]
            returnPath:Reverse
            call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" "returnPath"

            if ${Me.InCombat}
            {
                call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
            }
            
            oc !ci -Zone ${pedestalDoorManagerName}

            returnPath:SetValue["${statuesConfig.Get[pathToPedestalRoomDoor].AsJSON~}"]
            returnPath:Reverse
            call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" "returnPath"

            oc !ci -Zone ${statueDoorManagerName}

            returnPath:SetValue["${statuesConfig.Get[pathToFirstDoor].AsJSON~}"]
            returnPath:Reverse
            call Obj_PathHelper.FollowCampSpotPathWho "${Me.Name}" "returnPath"
        }
        
    }

    member:point3f GetClosestPickupPoint(point3f statueLocation, jsonvalueref pickupLocations)
    {
        echo "GetClosestPickupPoint"
        echo "--> statueLocation: ${statueLocation}"
        echo "--> pickupLocations: ${pickupLocations.AsJSON~}"
        if !${pickupLocations.Type.Equal[array]}
        {
            echo "pickupLocations is expecting an json array instead of ${pickupLocations.Type}"
            return
        }
            
        variable jsoniterator pickupLocationIterator
        variable point3f currentPickupLocation
        variable float currentDistance
        variable point3f closestPickupLocation
        variable float closestDistance = 9999
        pickupLocations:GetIterator[pickupLocationIterator]

        if ${pickupLocationIterator:First(exists)}
        {
            do
            {
                currentPickupLocation:Set[${pickupLocationIterator.Value}]
                currentDistance:Set[${Math.Distance[${statueLocation.X}, ${statueLocation.Y}, ${statueLocation.Z}, ${currentPickupLocation.X}, ${currentPickupLocation.Y}, ${currentPickupLocation.Z}]}]
                echo "currentPickupLocation: ${currentPickupLocation}"
                echo "currentDistance: ${currentDistance}"
                echo "closestDistance: ${closestDistance}"
                if ${currentDistance} < ${closestDistance}
                {
                    closestDistance:Set[${currentDistance}]
                    closestPickupLocation:Set[${currentPickupLocation}]
                }
            }
            while ${pickupLocationIterator:Next(exists)}
        }

        return ${closestPickupLocation}
    }

    function PlaceStatue(int statueId, string pedestalName)
    {
        echo "PlaceStatue"
        echo "-- statueId: ${statueId}"
        echo "-- pedestalName: ${pedestalName}"
        variable int count = 0
        variable int pedestalActorId 
        variable point3f pedestalLocation
        variable point3f statueLocation
        pedestalActorId:Set[${Actor[Name, "${pedestalName}"].ID}]
        pedestalLocation:Set[${Actor[${pedestalActorId}].Loc}]

        variable float x
        variable float y

        x:Set[${Math.Calc[${Display.Width}/2]}]
        y:Set[(${Math.Calc[(${Display.Height}/2)]}] 


        Actor[${pedestalActorId}]:DoFace
        wait 5
        OgreBotAPI:SetMousePosition_Middle
        wait 2
        ; if not close enough, scoot closer
        if ${Actor[${pedestalActorId}].Distance} > 4
        {
            OgreBotAPI:AutoRun
            wait 3
            OgreBotAPI:AutoRun
            wait 2
        }
        
        Actor[${pedestalActorId}]:DoFace
        wait 2
        
        variable int loopCount = 0
        Mouse:SetPosition[${x},${y}]
        statueLocation:Set[${Actor[${statueId}].Loc}]
        variable float distanceBetweenStatueAndPedestal
        echo "pedestalLoc: ${pedestalLocation}"
        echo "statueLoc: ${statueLocation}"
        distanceBetweenStatueAndPedestal:Set[${Math.Distance[${statueLocation.X}, ${statueLocation.Y}, ${statueLocation.Z}, ${pedestalLocation.X}, ${pedestalLocation.Y}, ${pedestalLocation.Z}]}]
        echo "Initial Distance: ${distanceBetweenStatueAndPedestal"
        while ${distanceBetweenStatueAndPedestal} > 2 && ${loopCount} < 150
        {
            echo "Dist ${loopCount}: ${distanceBetweenStatueAndPedestal}"
            y:Set[${y}+1]
            Mouse:SetPosition[${x},${y}]
            wait 2
            
            statueLocation:Set[${Actor[${statueId}].Loc}]
            distanceBetweenStatueAndPedestal:Set[${Math.Distance[${statueLocation.X}, ${statueLocation.Y}, ${statueLocation.Z}, ${pedestalLocation.X}, ${pedestalLocation.Y}, ${pedestalLocation.Z}]}]
            loopCount:Inc
        }

        echo "Final distance ${distanceBetweenStatueAndPedestal}"
        if ${distanceBetweenStatueAndPedestal} < 2
        {
            Mouse:LeftClick
        }
        else
        {
            echo "Placement failed"
        }

        press esc
    }

    function GetStatueRuneCount(string statueId)
    {
        Event[EQ2_onIncomingText]:AttachAtom[This:OnIncomingText]
        EQ2Execute "/apply_verb ${statueId} Inspect"

        do
        {
            timesLooped:Inc
            wait 5

        }
        while ${waitingForText} && ${timesLooped} < 10
                
        Event[EQ2_onIncomingText]:DetachAtom[This:OnIncomingText]
    }

    method OnIncomingText(string text)
    {
        if !${text.Left[15].Equals["This is a small"]}
        {
            return
        }
        if ${text.Find["a single"]} > 0
        {
            currentRuneCount:Set[1] 
        }
        elseif ${text.Find["two runes"]} > 0
        {
            currentRuneCount:Set[2] 
        }
        elseif ${text.Find["three runes"]} > 0
        {
            currentRuneCount:Set[3] 
        }
        elseif ${text.Find["has four runes"]} > 0
        {
            currentRuneCount:Set[4] 
        }
        elseif ${text.Find["has five runes"]} > 0
        {
            currentRuneCount:Set[5] 
        }
        elseif ${text.Find["has six runes"]} > 0
        {
            currentRuneCount:Set[6] 
        }
        elseif ${text.Find["has seven runes"]} > 0
        {
            currentRuneCount:Set[7] 
        }
        elseif ${text.Find["has eight runes"]} > 0
        {
            currentRuneCount:Set[8]
        }
        elseif ${text.Find["has nine runes"]} > 0
        {
            currentRuneCount:Set[9] 
        }
        else
        {
            echo ${currentId} - ${text}
            return
        }

        waitingForText:Set[FALSE]
    }

    function KeepDoorsOpen()
    {
        if ${shouldKeepDoorsOpen}
        {
            oc !ci -Zone
            TimedCommand 40 This.KeepDoorsOpen
        }
    }

    method Log(string message)
    {
        if ${inDebugMode}
        {   
            echo "${message}"
        }
    }
}

objectdef JsonArrayHelper
{
    static member:jsonvalueref Combine(jsonvalue left, jsonvalue right)
    {
        variable jsonvalue combinedArray="[]"
        combinedArray:SetValue["${left.AsJSON~}"]
        right:ForEach["echo ${ForEach.Value~}"]
        right:ForEach["combinedArray:Add[\"\${ForEach.Value~}\"]"]
        
        return combinedArray
    }
}