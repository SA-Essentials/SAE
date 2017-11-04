#include <a_samp>
#define FILTERSCRIPT
#define MAX_PING 18
#define INFINITE (Float:0x7F800000)

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
            new Float:health;
            GetPlayerHealth(playerid, health);
            SetPVarFloat(playerid, "lastHealth", health);
            TogglePlayerControllable(playerid, 0); 
            SetPlayerHealth(playerid, INFINITE);
            isFrozen[playerid] = true;
        }
    }
    else if(GetPlayerPing(playerid) < MAX_PING)
    {
        if(isFrozen[playerid])
        {
            SetPlayerHealth(playerid, GetPVarFloat(playerid, "lastHealth"));
            TogglePlayerControllable(playerid, 1);
            isFrozen[playerid] = false;
        }
    }
}
