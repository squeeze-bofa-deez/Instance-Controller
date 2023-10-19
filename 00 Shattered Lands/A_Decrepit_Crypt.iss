variable string sZoneNameStart="a decrepit crypt"
variable string sZoneNameEnd="The Commonlands"
variable string sZoneShortName="qey_catacomb_epic02"
variable string sZoneIn_ObjectName="mi_coffin_entrance_easy"
variable string sZoneOut_ObjectName="to_commonlands"

#include "${LavishScript.HomeDirectory}/Scripts/EQ2OgreBot/InstanceController/Ogre_Instance_Include.iss"


function main(int _StartingPoint=0)
{
	call function_Handle_Startup_Process "-NoAutoLoadMapOnZone"
}

atom atexit()
{
	echo ${Time}: ${Script.Filename} done
}

function Load_OgreUtilities()
 {
    ogre utilities
   wait 5
    Obj_CreateOgreUtilities:CreateOgreUtilities[${Script.Filename}]
    Obj_CreateOgreUtilities:CreateOgreCharacterData[${Script.Filename}]
 } 

objectdef Object_Instance
{

  function:bool RunInstance(int _StartingPoint=0)
  {  
    if ${_StartingPoint} == 0
   {
     if !${Obj_OgreUtilities.NearLoc[-1334.93 -67.86 334.05]} 3
      {
        echo Move Closer to the door "-1334.93 -67.86 334.05"
        return FALSE
      }
      Obj_OgreIH:Actor_Click["${sZoneIn_ObjectName}"]
      call Obj_OgreUtilities.HandleWaitForZoning
      call Obj_OgreIH.Set_VariousOptions
      Ogre_Instance_Controller:ZoneSet

      Obj_OgreI:Set_NoMove
      _StartingPoint:Inc
    }   
    if ${_StartingPoint} == 1
    {
		  call This.Named1 
		  if !${Return}
		  {
		   Obj_OgreIH:Message_FailedZone
		   return FALSE
      }
		  _StartingPoint:Inc
    }
    if ${_StartingPoint} == 2
    {
      call This.Named2
      if !${Return}
      {
        Obj_OgreIH:Message_FailedZoneOut
        return FALSE
      }
      _StartingPoint:Inc
    }
    Obj_OgreIH:LetsGo
    return TRUE    
  }
 function:bool Named1(string _NamedNPC="Doesnotexist")
  {  
    variable point3f TrashSpot1="0.769943,-1.036473,-4.095769"
    variable point3f TrashSpot2="0.427361,-1.036473,12.358446"
    variable point3f TrashSpot3="-18.001532,-1.036473,17.071053"
    variable point3f Named1="-25.196249,-1.036473,8.037610"

    Obj_OgreIH:LetsGo
    echo Trashpack 1 ${TrashSpot1}
    Wait 5
    Obj_OgreIH:SetCampSpot
    wait 5
    Obj_OgreIH:ChangeCampSpot["${TrashSpot1}"]
    call Obj_OgreUtilities.HandleWaitForCampSpot 10
    call Obj_OgreUtilities.HandleWaitForGroupDistance 3
    wait 5
    Call Obj_OgreUtilities.HandleWaitForCombatWithNPC
    wait 5
    Call Obj_OgreIH.KillActorType 20
    wait 5
    call Obj_OgreUtilities.HandleWaitForCombatWithNPC

    echo Trashpack 2 ${TrashSpot2}

    Obj_OgreIH:ChangeCampSpot["${TrashSpot2}"]
    call Obj_OgreUtilities.HandleWaitForCampSpot 10
    call Obj_OgreUtilities.HandleWaitForGroupDistance 3
    wait 5
    call Obj_OgreUtilities.HandleWaitForCombatWithNPC
    wait 5
    call Obj_OgreIH.KillActorType 20
    Wait 5
    call Obj_OgreUtilities.HandleWaitForCombatWithNPC

    echo Trashpack 3 ${TrashSpot3}
 
    Obj_OgreIH:ChangeCampSpot["${TrashSpot3}"]
    call Obj_OgreUtilities.HandleWaitForCampSpot 10
    call Obj_OgreUtilities.HandleWaitForGroupDistance 3
    wait 5
    call Obj_OgreUtilities.HandleWaitForCombatWithNPC
    wait 5
    call Obj_OgreIH.KillActorType 20
    wait 5
    call Obj_OgreUtilities.HandleWaitForCombatWithNPC

    echo Named ${_NamedNPC} ${NamedMob}

    Obj_OgreIH:ChangeCampSpot["${Named1}"]
    call Obj_OgreUtilities.HandleWaitForCampSpot 10
    call Obj_OgreUtilities.HandleWaitForGroupDistance 3
    wait 5

    
 
   
    call Obj_OgreUtilities.WaitWhileGroupMembersDead
    call Obj_OgreIH.Get_Chest
  }    
  function:bool Named2(string _NamedNPC="Doesnotexist")
  {
    variable point3f Exitloc="-30.429379,-1.036473,8.136223"

    Obj_OgreIH:LetsGo
    echo Leaving Zone
    Obj_OgreUtilities:ChangeCampSpot["${Exitloc}"]
    call Obj_OgreUtilities.HandleWaitForCampSpot 10
    call Obj_OgreUtilities.HandleWaitforGroupDistance 3
    wait 5
      

    if !${Obj_OgreUtilities.NearLoc[-30.429379,-1.036473,8.136223]}
    { 
     echo Couldnt Reach door "-30.429379,-1.036473,8.136223"
     return False 
    }
    Obj_OgreIH:Actor_Click["${sZoneOut_ObjectName}"]
    call Obj_OgreUtilities.HandleWaitForZoning 

   return TRUE
  }
}
















