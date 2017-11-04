#include <a_samp>
#define FILTERSCRIPT
#define MAX_PING 18
#define INFINITE (Float:0x7F800000)


new isFrozen[MAX_PLAYERS];
new name[MAX_PLAYER_NAME], string[24+MAX_PLAYER_NAME];

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
            //warn player that they are ping banned
            GameTextForPlayer(playerid, "~r~Your ping exceeds the servers expectations. ~w~You will be ping banned until your ping is normal.", 3000, 5);

            //get and save health
            new Float:health;
            GetPlayerHealth(playerid, health);
            SetPVarFloat(playerid, "lastHealth", health);
            TogglePlayerControllable(playerid, 0);
            SetPlayerHealth(playerid, INFINITE);
            
            //warn all users that player is not hacking, but is ping banned
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
            //give original health
            TogglePlayerControllable(playerid, 1);
            SetPlayerHealth(playerid, GetPVarFloat(playerid, "lastHealth"));
            
            isFrozen[playerid] = false;
        }
    }
}

