variable string sZoneName="The Den of the Devourer"
variable string sZoneShortName="exp02_dun_halls_of_fate_epic02_devourer"
variable string sZoneIn_ObjectName="zone_to_den_of_the_devourer"
variable string exitName="Zone to the Bonemire"



#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"
#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Support_Files_Common/Path_Helper_Include.iss"

function main(int _StartingPoint=0, ... Args)
{
    call function_Handle_Startup_Process ${_StartingPoint} "-NoAutoLoadMapOnZone" ${Args.Expand}
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
    function:bool RunInstance(int _StartingPoint=0)
    {
        Event[EQ2_ActorSpawned]:AttachAtom[ActorSpawned]
        if ${_StartingPoint} == 0
        {
            call Obj_OgreIH.Set_VariousOptions
            oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_facenpc TRUE
            
            Obj_OgreIH:Set_NoMove

            if !${Zone.ShortName.Equal["${sZoneShortName}"]}
            {
                oc "You must be standing just inside of The Den of the Devourer for this script to work."
                return FALSE
            }
            else
            {
                oc "Starting in zone"
            }

            oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_movetoarea TRUE TRUE
            oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_facenpc TRUE TRUE
            oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_autotarget_outofcombatscanning FALSE TRUE
            _StartingPoint:Inc
        }

        Obj_OgreIH:Set_Follow
        if ${_StartingPoint} == 1
        {
            call This.KillSvacklan
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        if ${_StartingPoint} == 2
        {
            call This.KillDeepguardianKvaklin
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        if ${_StartingPoint} == 3
        {
            call This.KillSpiritofWater
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        if ${_StartingPoint} == 4
        {
            call This.KillTheDevourer
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }


        return TRUE
    }

    function KillSvacklan()
    {
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
            '-18.277264,-0.310969,0.187852',
            '-30.579908,-2.424696,9.581784',
            '-39.533302,-4.178048,-1.587897',
            '-58.272377,-8.124228,-2.340823',
            '-72.113548,-13.995220,-3.293117',
            '-95.294624,-19.176804,16.735401',
            '-109.154396,-19.489639,24.236214',
            '-128.772034,-17.628681,25.342337',
            '-146.223511,-19.212206,24.316710',
            '-155.289291,-19.506168,24.192789',
            '-165.497253,-19.842073,24.259802',
            '-180.926773,-19.842073,37.354919',
            '-180.682419,-18.902332,25.603531'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        call Obj_OgreIH.Get_Chest

       return TRUE
    }

    function KillDeepguardianKvaklin()
    {
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
            '-179.271011,-19.842073,8.992807',
            '-180.223923,-19.482300,-3.479921',
            '-181.377274,-19.719027,-10.751086',
            '-193.309311,-25.470606,-25.321949',
            '-204.425232,-28.050711,-23.364485',
            '-221.279648,-30.218243,-21.345718',
            '-234.253311,-31.071941,-21.239761',
            '-250.519684,-29.300858,-31.121590',
            '-265.642090,-29.451904,-41.645073',
            '-269.723602,-30.485189,-47.697548',
            '-283.333405,-32.711121,-49.772545',
            '-312.940613,-43.656109,-49.489902',
            '-329.647949,-43.647480,-49.560623',
            '-329.991821,-43.647602,-34.960197',
            '-330.086060,-43.606079,-18.192890',
            '-321.861053,-43.221989,-6.255656',
            '-310.035034,-40.588455,11.334943',
            '-303.769196,-36.871872,22.484009',
            '-304.294220,-36.087589,44.490192'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE
        variable int clearedCount

        for (clearedCount:Set[0] ; ${clearedCount} < 4 ; clearedCount:Inc)
        {
            route:SetValue["$$>[
                '-318.212830,-36.087585,43.927284',
                '-317.076599,-36.087589,68.599380',
                '-290.533600,-36.087585,70.221100',
                '-290.304779,-36.087593,44.583157',
                '-293.279541,-36.087589,44.811909'
                '-304.294220,-36.087589,44.490192'
            ]<$$"]
            call Obj_PathHelper.GroupFollowCampSpotPath route TRUE
        }

        call Obj_OgreUtilities.PreCombatBuff 6
        Actor[exactname, "Deepguardian Kvaklin"]:DoTarget
        call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        call Obj_OgreIH.Get_Chest

       return TRUE
    }

    function KillSpiritofWater()
    {
        variable jsonvalue route = "[]"
        route:SetValue["$$>[
            '-303.672943,-35.414581,33.944599',
            '-303.037720,-38.349255,16.926420',
            '-320.002838,-42.711361,-1.775823',
            '-329.995636,-43.615685,-18.062922',
            '-329.924316,-43.647591,-33.945381',
            '-329.461121,-43.647484,-49.182400',
            '-315.604095,-43.647465,-49.299820',
            '-300.669373,-39.773682,-49.323406',
            '-278.790344,-30.950447,-49.339474',
            '-273.623566,-30.861778,-49.339157',
            '-258.337524,-29.323503,-36.831966',
            '-246.462311,-29.817286,-28.267441',
            '-234.206039,-31.063187,-20.402878',
            '-213.744507,-29.095207,-22.355061',
            '-189.984695,-24.090721,-21.787155',
            '-181.237137,-19.540171,-8.734680',
            '-180.853790,-19.842073,10.599170',
            '-180.647934,-18.902332,27.678619',
            '-180.788193,-19.854385,36.823578',
            '-181.441940,-19.622120,55.775566',
            '-182.410110,-19.748510,74.047829',
            '-173.098785,-19.254782,82.796822',
            '-163.125977,-16.618916,95.151398',
            '-154.798492,-14.447772,103.860207',
            '-155.494156,-6.535474,123.061935',
            '-153.551437,-4.409813,137.800430',
            '-161.230270,-3.447705,140.913818',
            '-168.204651,-2.251044,149.025711',
            '-157.783463,-0.349505,159.076126',
            '-157.452621,-0.326631,169.831787',
            '-157.207352,-0.326624,181.058578'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        call Obj_OgreUtilities.PreCombatBuff 6

        route:SetValue["$$>[
            '-157.563385,-3.859611,196.930588'            
        ]<$$"]

       call Obj_PathHelper.GroupFollowCampSpotPath route TRUE
       call Obj_OgreIH.Get_Chest

       return TRUE
    }

    function KillTheDevourer() 
    {
        oc "Killing Kettleleader Ghrizhaw"
        variable jsonvalue route = "[]"

        ; Might need to destroy eggs first if this is to many mobs
        route:SetValue["$$>[
            '-167.615616,-3.882277,211.729492',
            '-187.248688,-0.326625,211.790680',
            '-225.538498,-13.010801,211.541000',
            '-248.955460,-13.003580,211.029144',
            '-262.353912,-13.579806,211.586838',
            '-270.006989,-13.579805,190.080765',
            '-287.045563,-6.640534,180.267303',
            '-306.485291,0.435640,181.788773',
            '-311.878632,1.580105,185.763550'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        route:SetValue["$$>[
            '-321.686096,2.137168,204.892502',
            '-293.478302,-14.385402,211.294464'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route FALSE
        variable point3f eggLocation
        variable point3f centerLocation = "-293.478302,-14.385402,211.294464"
        Obj_OgreIH:SetCampSpot

        do
        {
            wait 5
            if ${Actor[exactname, "an egg"](exists)}
            {
                oc "egg found, lets kick it"
                eggLocation:Set[${Actor[exactname, "an egg"].Loc}]
                oc "running to egg ${eggLocation}"
                oc !ci -ChangeCampSpotWho ${Me.Name} ${eggLocation.X} ${eggLocation.Y} ${eggLocation.Z}
                call Obj_OgreUtilities.HandleWaitForCampSpot 10
                oc "kicking egg"
                OgreBotAPI:ApplyVerb["an egg", "kick egg"]

                oc "running to center ${centerLocation}"
                oc !ci -ChangeCampSpotWho ${Me.Name} ${centerLocation.X} ${centerLocation.Y} ${centerLocation.Z}
                call Obj_OgreUtilities.HandleWaitForCampSpot 10
            }
        }
        while ${Actor[exactname, "The Devourer"].Health} > 0

        call Obj_OgreIH.Get_Chest

       return TRUE
    }
}
