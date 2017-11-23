#include <a_samp>
#define FILTERSCRIPT
#define MAX_PING 100 //Change me to any amount
#define INFINITE (Float:0x7F800000)

new isFrozen[MAX_PLAYERS];
new name[MAX_PLAYER_NAME], string[24+MAX_PLAYER_NAME];
new Float:pHealth[MAX_PLAYERS];

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
            GameTextForPlayer(playerid, "~r~Your ping exceeds the servers expectations. ~w~You will be ping banned until your ping is normal.", 3000, 5);
            GetPlayerHealth(playerid, pHealth[playerid]);
            TogglePlayerControllable(playerid, 0);
            SetPlayerHealth(playerid, INFINITE);
            GetPlayerName(playerid, name, sizeof(name));
   			format(string, sizeof(string), "SERVER: %s has been ping banned.", name);
            SendClientMessageToAll(-1, string);

            isFrozen[playerid] = true;
        }
    }
    else if(GetPlayerPing(playerid) < MAX_PING)
    {
        if(isFrozen[playerid])
        {
            TogglePlayerControllable(playerid, 1);
            SetPlayerHealth(playerid, pHealth[playerid]);

            isFrozen[playerid] = false;
        }
    }
}

/*
Contributors:
- Billz
- Eoussama (help with pHealth)
- frouzen (help with stopping the script getting repeated)
*/
