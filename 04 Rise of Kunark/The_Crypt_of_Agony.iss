variable string sZoneName="The Crypt of Agony"
variable string sZoneShortName="exp04_dun_sebilis_epic01_crypt"
variable string sZoneIn_ObjectName="zone_to_The_Crypt_of_Agony"
;// variable string sZoneIn_ObjectName="zone_to_pow"

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"


function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
}
atom atexit()
{
	echo ${Time}: ${Script.Filename} done
}

objectdef Object_Instance
{
	function:bool RunInstance(int _StartingPoint=1)
	{
		Obj_OgreIH:Set_Debug_Mode[TRUE]
		
	
		
		if ${_StartingPoint} == 0
		{
		call This.Named1 "Fallen Emperor Vekin"
			
			if !${Return}
			{
				Obj_OgreIH:Message_FailedNamed["#1:Fallen Emperor Vekin"]
				return FALSE
			}
			call Obj_OgreIH.Get_Chestw
			
			_StartingPoint:Inc
        
        }
        return TRUE
	
    }
    function:bool Named1(string _NamedNPC="Doesnotexist")
	{
		Obj_OgreIH:SetCampSpot
       
		Obj_OgreIH:ChangeCampSpot["7.560605,-0.349369,14.650099"]
		;// OgreBotAPI:ChangeOgreBotUIOption["all","checkbox_autotarget_outofcombatscanning",TRUE]
		;// oc !c -AutoTarget_SetScanRadius ${Me.Name} 30
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		wait 100
		
        ;// Start Trash Clear Routine 
		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["11.063148,-0.349369,29.783699"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-6.472799,-0.349368,36.586491"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["0.186163,-0.286868,52.764160"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-0.528632,-3.425917,84.055183"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-20.523596,-3.425917,83.673843"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-19.893536,-3.425917,102.438904"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
			
		Obj_OgreIH:ChangeCampSpot["-43.159504,-6.174136,102.766647"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 200
		Obj_OgreIH:ChangeCampSpot["-60.598793,-5.804090,118.327194"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

		Obj_OgreIH:ChangeCampSpot["-78.249657,-9.255955,129.753265"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-100.028214,-8.201880,118.337906"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-121.648849,-6.884563,108.017555"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-136.552307,-6.812079,106.234825"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-148.065384,-6.812079,105.943085"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-123.603645,-6.486845,105.502403"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-74.684746,-9.302128,132.435181"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-69.846016,-9.306308,141.927338"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-83.825409,-7.287833,160.452408"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
			
		Obj_OgreIH:ChangeCampSpot["-95.857658,-7.302886,149.297012"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-78.167938,-7.802052,153.208069"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

		Obj_OgreIH:ChangeCampSpot["-67.688683,-9.325844,144.561768"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-48.705856,-6.935371,146.801926"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-33.659370,-6.349915,150.058578"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

		Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["-25.056234,-4.344000,175.914322"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-44.964573,-4.843092,186.061554"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-78.343803,-7.093096,191.718506"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-44.888191,-4.843092,187.022415"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-44.135052,-7.594039,216.608109"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-76.064987,-9.844042,216.777985"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
			
		Obj_OgreIH:ChangeCampSpot["-45.585827,-7.594038,216.390396"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-26.528109,-7.593411,227.089050"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

		Obj_OgreIH:ChangeCampSpot["3.420495,-7.594038,217.804871"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["34.274143,-9.844042,214.808960"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-0.268815,-7.594038,216.482391"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

		Obj_OgreIH:ChangeCampSpot["1.486352,-4.843092,187.084534"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
			
		Obj_OgreIH:ChangeCampSpot["34.073803,-7.093096,187.368423"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["1.644306,-4.843092,188.685318"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

		Obj_OgreIH:ChangeCampSpot["-2.721281,-7.593965,222.517502"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-21.303875,-7.593523,225.582962"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-18.836882,-10.093173,276.257233"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

		Obj_OgreIH:ChangeCampSpot["-9.500299,-10.093180,286.404510"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["9.542091,-10.093173,290.280853"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

        Obj_OgreIH:SetCampSpot
		Obj_OgreIH:ChangeCampSpot["28.035213,-10.093173,295.583160"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-12.861037,-10.093176,282.920044"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-11.320952,-10.093175,310.454224"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-13.171760,-13.094035,341.133575"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-32.184181,-13.094034,341.434998"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		
		Obj_OgreIH:ChangeCampSpot["-32.434673,-13.030669,361.847778"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
			
		Obj_OgreIH:ChangeCampSpot["-32.267101,-10.595408,382.825775"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10
		Obj_OgreIH:ChangeCampSpot["-18.809366,-10.422596,386.339691"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 10

		Obj_OgreIH:ChangeCampSpot["-47.550060,-10.553613,386.861450"]
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		call Obj_OgreUtilities.HandleWaitForCombat
		call Obj_OgreIH.Get_Chestw
		wait 300
		

        	;// Last named
		Obj_OgreIH:ChangeCampSpot["-33.000969,-10.595408,406.615417"]
		wait 10		
		call Obj_OgreUtilities.HandleWaitForCampSpot 10
		
		call Obj_OgreIH.KillAll "${_NamedNPC}" 
            wait 20
        if ${Actor[namednpc,"${_NamedNPC}"].ID(exists)}
        {
            Obj_OgreIH:Message_FailedToKill["${_NamedNPC}"]
            return FALSE
        }
		return TRUE
	}
}

