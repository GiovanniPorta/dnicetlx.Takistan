// Contains whitelist/blacklist arrays!

private["_uid"];
_uid = getPlayerUID player;

// Remember the Array format! No comma on last item in array!

// Developers

A_LIST_DEVS     =
[
	"76561198101924418" // Lex_the_great
];

A_LIST_TESTERS =
[
	"76561198065161712" //Stridey.
];

// Directors and Deputy Directors

A_LIST_DERPS	=
[
	"76561198124176578", // 1st Lt Monkey
	"76561198093358722"  // Gio
];

// Senior Admins

A_LIST_SNADMINS	=
[
	"76561198101924418" // Lex_the_great
];

// Remember the Array format! No comma on last item in array!

// Admins

A_LIST_ADMINS	=
[
	"76561198053580599", // Martin
	"76561198134796571", // Bacon
	"76561198101924418" // Lex_the_great
];

// Remember the Array format! No comma on last item in array!

// Moderators

A_LIST_MODS	=
[

	"76561198101924418", // Lex_the_great
	"76561198095702747", // Irish
	"76561198159209074", // Deutsch Flieger
	"76561198044511240", // Comrade Blackei
	"76561198211441867", // Kevlar
	"76561198161493575", // Ivan
	"76561198092131123" // JacksonS
];

isDeveloper = (getPlayerUID player) in A_LIST_DEVS;
isTester = (getPlayerUID player) in A_LIST_TESTERS;
isAdminDev = (getPlayerUID player) in A_LIST_DERPS;
isSnAdmin = (getPlayerUID player) in A_LIST_SNADMINS;

isAdmin = (getPlayerUID player) in A_LIST_ADMINS;
isMod = (getPlayerUID player) in A_LIST_MODS;
isAdmins = (isAdmin||isSnAdmin||isAdminDev||isDeveloper);
isStaff = (isAdminDev || isSnAdmin || isAdmin || isMod || isDeveloper);


// Remember the Array format! No comma on last item in array!

// Whitelisting
pmcwhitelist = [
"169460806", //TLXGOD
"245049094", // Fyodor
"251317574", //KillerKris
"254861574" //KillaCali3
];


//if (!(_uid in isStaff) && (call player_cop;) && (    )) then {call kick_whitelist};


// Remember the Array format! No comma on last item in array!

// Blacklisting
if(isNil "copblacklist") then {
	copblacklist = [
	"76561198040462947", //Son of the Bitch
	"76561198095037617", //Goldenpotaters
	"76561198150297021"//Envy
	];
};
if(isNil "opfblacklist") then {
	opfblacklist = [
	"76561198040462947" //Son of the Bitch
	];
};
if(isNil "opfcmdblacklist") then {
	opfcmdblacklist = [

	];
};
if(isNil "insblacklist") then {
	insblacklist = [

	];
};
pmcblacklist = [
"76561198203570236", //Austin
"76561198177166307", //Dark Arrow
"76561198083392018" //jpf
];

issup = true; // ((_uid in supporters1) || (_uid in supporters2) || (_uid in supporters3) || (_uid in supporters4) || (_uid in supportersVIP));
isvip = true; // ((_uid in supportersVIP));
ispmc = ((_uid in pmcwhitelist) or (isStaff) or (issup));

_side = playerSide;
if((_uid in copblacklist) && (_side == west)) then {
	player groupChat "You are Blacklisted from Blufor!";
	sleep 7;
	failMission "END1";
};

if((_uid in opfblacklist) && (_side == east)) then {
	player groupChat "You are Blacklisted from Opfor!";
	sleep 7;
	failMission "END1";};

if((_uid in insblacklist) && (_side == resistance)) then {
	player groupChat "You are Blacklisted from Insurgent!";
	sleep 7;
	failMission "END1";};

if((!ispmc) && (isciv) && rolenumber >= 60) then {
	player groupChat "You cannot join a PMC slot without supporter privileges!";
	sleep 7;
	failMission "END1";};
if((!isAdmins) && rolenumber == 72) then {
	player groupChat "You cannot join a Admin slot without being an admin!";
	sleep 7;
	failMission "END1";};
if((!isvip) && rolenumber == 71) then {
	player groupChat "You cannot join a VIP slot without VIP privileges!";
	sleep 7;
	failMission "END1";};
_notAllowed = false;
if(!issup) then {
	if((rolenumber == 70) ||(rolenumber >= 73 && rolenumber <= 78)||(rolenumber >= 92 && rolenumber <= 95)) then {
		player groupChat "You cannot join a supporter slot without supporter privileges!";
		sleep 7;
		failMission "END1";
	};
};
if(!(isStaff || isTester)) then {
	if((rolenumber == 96) || (rolenumber == 67)) then {
		player groupChat "You cannot join a Developer slot without Developer privileges!";
		sleep 7;
		failMission "END1";
	};
};
if(_uid in opfcmdblacklist) then {
	if (rolenumber >= 73 && rolenumber <= 74) then {
		player groupChat "You are Blacklisted from Opfor Command Slots!";
		sleep 7;
		failMission "END1";
	};
};
