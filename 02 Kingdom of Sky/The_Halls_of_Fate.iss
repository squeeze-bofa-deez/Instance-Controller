variable string sZoneName="The Halls of Fate"
variable string sZoneShortName="exp02_dun_halls_of_fate"
variable string sZoneIn_ObjectName="zone_to_halls_of_fate"
variable string exitName="01_door_to_bonemire"



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
                oc "You must be standing just inside of The Halls of Fate for this script to work."
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
            call This.KillDoomGuardTammuz
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        if ${_StartingPoint} == 2
        {
            call This.KillDoomGuardVimock
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        if ${_StartingPoint} == 3
        {
            call This.KillJintiztheCataloguer
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        if ${_StartingPoint} == 4
        {
            call This.KillIshtarantheSkarize
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        if ${_StartingPoint} == 5
        {
            call This.KillIshiKurrat
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        if ${_StartingPoint} == 6
        {
            call This.KillSothis
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }
        
        if ${_StartingPoint} == 7
        {
            call This.KillKatalkana
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        if ${_StartingPoint} == 8
        {
            call This.KillDoomLordSeptimus
            
            if !${Return}
            {
                Obj_OgreIH:Message_FailedZone
                return FALSE
            }

            _StartingPoint:Inc
        }

        call This.LeaveInstance

        return TRUE
    }

    function KillDoomGuardTammuz()
    {
        oc "Doom Guard Tammuz"
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
          '-0.233198,39.202576,-64.908295',
          '0.209568,39.202381,-43.449398',
          '-0.561957,39.234623,-19.669182',
          '-7.876490,39.234802,-20.074339',
          '-16.674885,34.713264,-13.027813',
          '-18.781567,34.379482,-11.340600',
          '-21.921856,29.883940,0.819348',
          '-18.364914,26.180477,9.702146',
          '-16.373657,24.930038,14.165476',
          '-8.641222,21.204073,18.994278',
          '-4.825704,20.201429,20.695187',
          '5.698205,15.909309,20.417881',
          '8.161467,15.581806,19.468466',
          '16.694262,11.182234,12.768637',
          '17.572470,10.910296,10.656033',
          '21.252121,6.506818,0.376917',
          '17.470806,2.088400,-11.541697',
          '12.267106,1.667617,-16.690374',
          '5.653909,1.667617,-20.504641',
          '-0.109757,1.667617,-20.158461'

        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        oc !ci -Zone "${Me.Name}"

        ; Pretty sure this ends in too big of a pull
        route:SetValue["$$>[
            '0.529571,1.667781,-27.848696',
            '-0.151516,1.667792,-36.024857',
            '-0.229096,1.667877,-58.063591',
            '-0.313269,1.667969,-69.300438',
            '-0.262447,1.667969,-87.594429',
            
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        route:SetValue["$$>[
            '-0.502817,1.641651,-96.325653',
            '3.803947,1.641651,-101.978302',
            '7.540841,1.903305,-97.775757',
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route FALSE
        

        call Obj_OgreIH.Get_Chest

       return TRUE
    }

    function KillDoomGuardVimock()
    {
        oc "Doom Guard Vimock"
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
            '7.853008,1.641651,-100.456123',
            '19.103920,1.641651,-101.964699',
            '19.418945,1.641651,-121.313850',
            '19.011076,1.641651,-138.102753',
            '22.451948,1.641651,-139.792877'
          
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        oc !ci -Zone "${Me.Name}"

        route:SetValue["$$>[
            '32.902927,1.641651,-139.866104',
            '50.094757,1.641651,-140.699020',
            '59.985554,1.615743,-140.344284',
            '65.108597,1.532197,-140.160568',
            '67.914719,1.532197,-126.948380'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route FALSE

        ; Stand here and wait for the mob to roam into range
        Actor[exactname, "Doom Guard Vimock"]:DoTarget
        do
        {
            wait 5
        }
        while ${Actor[exactname, "Doom Guard Vimock"].Distance} > 20

        call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        call Obj_OgreUtilities.HandleWaitForGroupDistance 5
       
        call Obj_OgreIH.Get_Chest

       return TRUE
    }

    function KillJintiztheCataloguer()
    {
        oc "Jin'Tiz the Catalogure"
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
            '80.318794,1.209338,-136.331894',
            '93.259842,1.365368,-134.062469',
            '122.392586,1.311323,-135.762512',
            '100.463631,1.365368,-133.961578',
            '71.171310,1.532197,-136.551285',
            '81.887825,1.532197,-127.16727',
            '106.092766,10.779366,-127.031555',
            '121.934189,10.779383,-128.667374',
            '131.664917,10.779366,-135.244598',
            '134.385056,10.779356,-135.918961'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        Actor[exactname, "a Doomwing infiltrator"]:DoTarget
        call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        call Obj_OgreUtilities.HandleWaitForGroupDistance 5

        oc !ci -Special "${Me.Name}"
        wait 50

        route:SetValue["$$>[
            '115.113579,10.944840,-135.193771',
            '105.271339,1.364033,-134.864014',
            '119.534004,1.365368,-133.595261',
            '119.345421,1.532197,-126.031616'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        oc !ci -Zone "${Me.Name}"

        route:SetValue["$$>[
            '119.538010,-3.502322,-109.089523',
            '119.101952,-11.196525,-89.969597'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        route:SetValue["$$>[
            '119.659569,-11.164824,-72.246704',
            '119.652733,-10.014266,-93.077873',
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route FALSE

        route:SetValue["$$>[
            '119.652733,-10.014266,-93.077873'
            '119.328484,-11.164777,-56.090855'
        ]<$$"]
        
        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE
            
        oc !ci -Zone "${Me.Name}"

        route:SetValue["$$>[
            '119.561256,-11.123453,-47.848396',
            '126.849731,-11.123454,-43.493954',
            '113.892830,-11.123454,-41.784760',
            '119.276978,-11.123454,-43.538116',
            '119.507401,-11.123454,-25.850349',
            '118.934982,-11.817752,-17.808554',
            '102.477554,-11.817463,-14.010921',
            '94.890625,-12.096768,-7.655835',
            '87.610649,-15.665926,7.403797',
            '89.677132,-23.407227,26.173477',
            '97.681450,-27.535433,35.205978',
            '104.825447,-27.535433,41.761539',
            '110.955811,-27.535433,32.638569',
            '111.314377,-27.535433,23.240362',
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        call Obj_OgreIH.Get_Chest

        return TRUE
    }

    function KillIshtarantheSkarize() 
    {
        oc "Ishtaran the Skarize"
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
            '111.314377,-27.535433,23.240362',
            '120.742447,-27.535433,17.579470',
            '142.607956,-27.535433,22.596130',
            '120.742447,-27.535433,17.579470'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        oc !ci -Special
        wait 50

        Actor[exactname, "Ishtaran the Skarize"]:DoTarget
        route:SetValue["$$>[
            '142.607956,-27.535433,22.596130',
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route FALSE
        wait 20
        call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        call Obj_OgreUtilities.HandleWaitForGroupDistance 5

        call Obj_OgreIH.Get_Chest

       return TRUE
    }

    function KillIshiKurrat()
    {
        oc "Ishi Kurrat"
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
            '120.742447,-27.535433,17.579470',
            '126.551498,-27.535433,17.369865',
            '127.136162,-27.535433,26.890182',
            '125.322838,-27.535433,28.923061',
            '132.507812,-26.959215,51.324482',
            '137.793716,-26.959200,63.556385',
            '130.261826,-26.959200,70.446556',
            '123.311081,-26.959200,74.027466',
            '119.179085,-26.959200,77.543907'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        wait 50
        call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        call Obj_OgreUtilities.HandleWaitForGroupDistance 5

        oc !ci -Zone "${Me.Name}"

        route:SetValue["$$>[
            '118.997856,-26.985170,86.954399',
            '119.238922,-26.985170,101.053345',
            '119.151848,-26.985147,116.108231',
            '120.179878,-26.984917,130.414902',
            '103.958717,-27.006121,130.010056',
            '89.164070,-27.006121,129.865051',
            '68.821365,-29.259235,129.712891',
            '50.103943,-36.876968,129.437134',
            '18.531918,-39.729279,129.568390',
            '14.020721,-39.729282,129.789658'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        oc !ci -Zone "${Me.Name}"

        route:SetValue["$$>[
            '5.291794,-39.728909,130.020157',
            '-1.045058,-39.708733,129.671707',
            '-9.285229,-43.264751,135.891693',
            '-16.323071,-43.291229,122.728386',
            '-21.410870,-39.692856,101.858910',
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        oc !ci -Zone "${Me.Name}"

        route:SetValue["$$>[
            '-21.449532,-39.729282,92.978470',
            '-21.449532,-40.142189,76.976799',
            '-31.889660,-41.599022,68.246628',
            '-28.642168,-42.420792,62.586292',
            '-17.316828,-44.271790,55.537872',
            '-18.895214,-49.214355,34.404915',
            '-18.626371,-55.444077,20.659252',
            '-30.788557,-57.124874,10.050951',
            '-40.718761,-59.085918,-3.868282',
            '-46.175190,-58.986176,-14.704230',
            '-45.535648,-57.514992,-23.818060',
            '-49.156582,-57.184647,-34.287300',
            '-45.486122,-58.824387,-50.625702',
            '-45.780190,-58.939884,-59.562374',
            '-48.660267,-62.370655,-71.821785',
            '-58.217747,-62.373863,-81.518402',
            '-55.620720,-62.371880,-93.317558',
            '-39.981060,-62.201183,-95.034019',
            '-37.354744,-62.206985,-78.050865',
            '-45.417034,-62.239140,-69.589066',

        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        call Obj_OgreIH.Get_Chest

        return TRUE
    }

    function KillSothis()
    {
        oc "Sothis"
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
            '-45.793312,-58.955830,-57.899345',
            '-46.223045,-57.475204,-34.848907',
            '-46.563358,-59.037586,-12.824786',
            '-33.641327,-57.877041,5.479326',
            '-18.428673,-52.837391,27.044552',
            '-20.374443,-45.719715,43.618355',
            '-19.598042,-43.715805,56.950172',
            '-29.853558,-42.331860,63.058083',
            '-30.104797,-41.562614,68.487450',
            '-22.011538,-39.856579,78.068169',
            '-22.011538,-39.856579,78.068169',
            '-21.135481,-39.729282,96.348885'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        oc !ci -Zone "${Me.Name}"

        route:SetValue["$$>[
            '-21.947975,-39.653564,105.751106',
            '-21.987843,-43.293549,131.447235',
            '-22.189718,-39.903324,157.909256'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        oc !ci -Zone "${Me.Name}"

        route:SetValue["$$>[
            '-22.321333,-41.670605,168.845444',
            '-22.082624,-51.431999,192.845184',
            '-22.515896,-52.686192,196.121201',
            '-22.190456,-52.654224,202.407379',
            '-22.063091,-52.654236,210.544601',
            '-22.188705,-52.654156,231.650223',
            '-22.226192,-52.580265,237.947311',
            '-4.543255,-52.580265,247.888412',
            '-9.922154,-53.273907,269.447906',
            '-12.449919,-53.275173,272.500153',
            '-19.568014,-68.992249,290.232300'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        call Obj_OgreIH.Get_Chest

        return TRUE
    }

    function KillKatalkana()
    {
        oc "Katalkana"
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
           '-19.182209,-68.992249,317.803162',
           '-10.071210,-68.992249,336.254852',
           '-4.377903,-68.416016,348.278107',
           '-14.328129,-68.416016,359.388458',
           '-21.187908,-68.416016,366.204956'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE
        
        oc !ci -Zone "${Me.Name}"

        route:SetValue["$$>[
            '-22.278862,-68.441841,372.984650',
            '-21.919024,-68.441811,383.587952',
            '-22.600456,-68.441826,392.108398',
            '-21.630905,-68.441803,401.086029',
            '-21.892160,-68.441811,411.240051',
            '-22.028030,-68.441811,436.884430',
            '-20.456915,-68.441742,448.003723'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        Actor[exactname, "Katalkana"]:DoTarget

        call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        call Obj_OgreUtilities.HandleWaitForGroupDistance 5
        call Obj_OgreIH.Get_Chest

        return TRUE
    }

    function KillDoomLordSeptimus()
    {
        oc "Doom Lord Septimus"
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
            '-30.560076,-68.441666,452.145020',
            '-38.535091,-68.442017,452.797668',
            '-47.740044,-68.442024,452.939545',
            '-67.659271,-68.442024,453.246552',
            '-78.212234,-68.341721,453.263397',
            '-102.218513,-71.779251,451.843811'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route TRUE

        call Obj_OgreUtilities.PreCombatBuff 6
        Actor[exactname, "Doom Lord Septimus"]:DoTarget

        call Obj_OgreUtilities.HandleWaitForCombatOrPower 50 TRUE
        call Obj_OgreUtilities.WaitWhileGroupMembersDead
        call Obj_OgreUtilities.HandleWaitForGroupDistance 5

        call Obj_OgreIH.Get_Chest

        return TRUE
    }

    function LeaveInstance()
    {
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
           '-117.167839,-71.310982,453.380249',
           '-127.875313,-68.313843,456.039215'
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route FALSE

        oc !ci -Special "${Me.Name}"
    }
}
