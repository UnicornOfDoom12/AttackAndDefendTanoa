/*
*		@File: fn_uniformfix.sqf
*       @Skins for uniform here
*		@Author: Nuclear
*/
waitUntil {!isNil "currentUniform"};
while {true} do
{
	/*if (playerSide == attackerSide) then
    {
        switch (true) do
        {
            case (uniform player isEqualTo "U_B_CTRG_Soldier_F"):
            {
                player setObjectTextureGlobal [0,"Textures\ctsfo_co.paa"];
            };
            case (uniform player isEqualTo "U_I_CombatUniform_shortsleeve"):
            {
                player setObjectTextureGlobal [0,"Textures\nca.paa"];
            };
        };
    };

    if  (playerSide != attackerSide) then
    {
        switch (true) do
        {
            case (uniform player isEqualTo "U_B_CTRG_Soldier_F"):
            {
                player setObjectTextureGlobal [0,"Textures\LobosCTRG.paa"];
            };
        };
    };*/
	waitUntil {uniform player != currentUniform && alive player && gearAssigned};

	removeUniform player;
	player forceAddUniform currentUniform;
};
