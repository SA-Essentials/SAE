#include <a_samp>
#define FILTERSCRIPT
#define MAX_PING 150 //Changeable
#define INFINITE (Float:0x7F800000) //Will be used on a future update

new isFrozen[MAX_PLAYERS];

public OnPlayerConnect(playerid)
{
    isFrozen[playerid] = false;
    return 1;
}
public OnPlayerUpdate(playerid) {
if(GetPlayerPing(playerid) > MAX_PING)
    {
    if(!isFrozen[playerid])
        {
            TogglePlayerControllable(playerid, 0);
            isFrozen[playerid] = true;
        }
    }
    else if(GetPlayerPing(playerid) < MAX_PING)
    {
        if(isFrozen[playerid])
        {
            TogglePlayerControllable(playerid, 1);
            isFrozen[playerid] = false;
        }
    }
}
