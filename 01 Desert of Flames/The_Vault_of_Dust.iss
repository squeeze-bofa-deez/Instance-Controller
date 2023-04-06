variable string zoneShortName="exp01_rgn_sinking_sands_epic01_lockjaw"
variable string entranceName="l2_16_door_to_vault_of_dust"
variable string exitName="To the Clefts of Rujark"

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"
#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Support_Files_Common/Path_Helper_Include.iss"

function main(int _StartingPoint=0, ... Args)
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
            call Obj_OgreIH.Set_VariousOptions
			oc !ci -ChangeOgreBotUIOption igw:${Me.Name} checkbox_settings_facenpc TRUE
			
			Obj_OgreIH:Set_NoMove

            if !${Zone.ShortName.Equal["${zoneShortName}"]}
            {
                if !${Actor[Query, Name =- "${entranceName}" && Distance < "15"](exists)}
                {
                    oc "You must be close to the door or inside the instance to start this zone."
                }

                oc !ci -Zone
                call Obj_OgreUtilities.HandleWaitForZoning 

                Ogre_Instance_Controller:ZoneSet
            }
            else
            {
                oc "Starting in zone"
            }

            _StartingPoint:Inc
        }

        Obj_OgreIH:Set_Follow
        if ${_StartingPoint} == 1
        {
            call This.ClearZone
        }

        call Obj_OgreIH.ZoneNavigation.ZoneOut "${exitName}"

        return TRUE
    }

    function ClearZone()
    {
        variable jsonvalue route = "[]"

        route:SetValue["$$>[
			'5.300870,5.781514,18.352598',
			'26.315748,2.388876,24.876074',
			'44.917522,1.345885,20.166019',
			'71.113152,-1.941716,-4.049303',
			'85.192703,-2.143466,-15.859534',
			'64.962051,-2.189327,-35.926922',
			'50.516037,-2.298450,-39.654976',
			'45.992111,-2.321841,-52.219219',
			'47.136395,-3.704947,-64.082741',
			'61.178097,-4.059525,-66.897659',
			'73.527107,-3.377814,-64.120399',
			'88.431572,-1.701730,-49.843704',
			'116.160263,-1.558420,-45.683201',
			'132.098129,-3.492618,-52.302059',
			'154.032043,-6.627141,-56.093964',
			'182.161087,-7.082402,-47.441612',
			'189.964264,-5.868930,-35.869877',
			'213.205612,-4.868904,-44.001564',
			'223.854126,-4.914371,-58.868656',
			'245.078079,-5.495048,-61.218956',
			'257.862671,-5.944231,-78.855110',
			'244.575150,-5.712043,-96.679520',
			'221.214371,-4.935961,-72.526894',
			'224.138947,-4.917279,-58.096825',
			'191.155884,-5.590870,-33.619137',
			'172.525589,-3.216068,-13.013332',
			'141.672333,-0.201790,1.927767',
			'107.772705,-2.023929,14.731855',
			'103.998558,-3.323276,42.071991',
			'100.160530,-4.106079,68.732437',
			'112.850548,-11.176244,105.355537',
			'131.472321,-16.869024,113.899017',
			'156.643707,-21.495474,114.188660',
			'183.470703,-24.613409,114.369637',
			'208.048737,-24.941797,125.661049',
			'222.625656,-24.416922,128.060883',
			'241.388214,-26.058321,119.307640',
			'253.817780,-25.644478,106.956421',
			'269.595795,-24.353662,94.721695',
			'239.514755,-26.370670,91.954636',
			'210.542694,-25.357798,90.196175',
			'161.413025,-22.005424,115.716385',
			'115.882980,-12.006122,107.763985',
			'99.904877,-3.950361,66.875809',
			'105.256569,-2.294420,15.928187',
			'80.618576,-2.230601,-15.695485',
			'52.384560,0.375857,18.955318',
			'12.236160,4.495510,22.832499',
			'-9.701053,7.736281,-1.191723'
	
        ]<$$"]

        call Obj_PathHelper.GroupFollowCampSpotPath route
    }
}

