_clientID = clientOwner;
_UID = getPlayerUID player;
_name = name player;
checkForDatabase = [_clientID, _UID, _name];
publicVariableServer "checkForDatabase";

"loadData" addPublicVariableEventHandler
{
	
	_array = (_this select 1);
	systemChat "Your current Stats are:";
	_killstring = _array select 0;
	_deathstring = _array select 1;
	_ratiostring = _array select 2;
	systemChat _killstring;
	systemChat _deathstring;
	systemChat _ratiostring;
	
};


"AddKill" addPublicVariableEventHandler
{
	_UID = (_this select 1);
	//_UID = getPlayerUID _Killer;
 	_inidbi = ["new", _UID] call OO_INIDBI;
  	_kills = ["read", ["Player Stats", "Kills", []]] call _inidbi;
  	_deathsOfKiller = ["read", ["Player Stats", "Deaths", []]] call _inidbi;
  	_kills = _kills + 1;
  	_kdRatioKiller = 0;
  	["write", ["Player Stats", "Kills", _kills]] call _inidbi;
  	if(_deathsOfKiller > 0)then{
    _kdRatioKiller = _kills / _deathsOfKiller;
  	};
  	["write", ["Player Stats", "kdRatio", _kdRatioKiller]] call _inidbi;
};

"AddDeath" addPublicVariableEventHandler
{
	_UID2 =(_this select 1);
 	_inidbi2 = ["new", _UID2] call OO_INIDBI;
  	_deaths = ["read", ["Player Stats", "Deaths", []]] call _inidbi2;
  	_deaths = _deaths + 1;
  	["write", ["Player Stats", "Deaths", _deaths]] call _inidbi2;
  	_killsOfKilled = ["read", ["Player Stats", "Kills", []]] call _inidbi2;
  	_kdRatioKilled = _killsOfKilled / _deaths;
  	["write", ["Player Stats", "kdRatio", _kdRatioKilled]] call _inidbi2;
};