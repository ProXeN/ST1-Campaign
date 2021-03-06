
// INFO ========================================================================
//
//    The structure of a poorly equipped army.
//
// =============================================================================

// MEDICAL SUPPLIES ============================================================

switch (true) do {
  case (mission_ACE3_enabled): {
    _suppliesMEDIC = [
        [_packingBandage, _countBANDAGE],[_elasticBandage, _countBANDAGE],[_quickClot, _countBANDAGE],
        [_tourniquet, _countCAT],
        [_morphine, _countMORPHINE],[_epi, _countEPI],
        [_blood500, _countBLOODBAG],
        [_defib, 1],[_surgKit, 1]
    ];
    _suppliesNORMAL = [[_fieldDressing, 2],[_packingBandage, 3],[_quickClot, 2],[_elasticBandage, 2],[_tourniquet, 1],[_morphine,1],[_epi,1]];
  };

  default {
    _suppliesMEDIC = [["FirstAidKit",20],["Medikit",1]];
    _suppliesNORMAL = [["FirstAidKit",3]];
  };
};

// =============================================================================
if (!_assignLoadoutMode) exitWith {};

switch (true) do {
// =============================================================================

    case (_isOfficer): {
        [_unit, _officerHEAD, _officerUNIFORM, _officerVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_fnc_addWeaponKit;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit, "LR"] call BRM_fnc_addRadio;
        [_unit, "BP"] call BRM_fnc_addRadio;
    };

    case (_isSquadLeader): {
        [_unit,_leaderHEAD, _commonUNIFORM, _slVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_fnc_addAmmoAuto;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit, "LR"] call BRM_fnc_addRadio;
        [_unit, "BP"] call BRM_fnc_addRadio;
    };

    case (_isTeamLeader): {
        [_unit, _leaderHEAD, _commonUNIFORM, _ftlVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_fnc_addAmmoAuto;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonCCO] call BRM_fnc_attachToWeapon;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit, "LR"] call BRM_fnc_addRadio;
    };

    case (_isReconLeader): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_rchemlight,2],[_bchemlight,2],[_wflare,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_fnc_addWeaponKit;
        [_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_fnc_addAmmoAuto;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
        [_unit, "handgun", _commonPISTOLSUPPRESSOR] call BRM_fnc_attachToWeapon;
        [_unit, "LR"] call BRM_fnc_addRadio;
        [_unit, "BP"] call BRM_fnc_addRadio;
    };

    case (_isRTO): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_grenade,_countGRENADES],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit, "BP"] call BRM_fnc_addRadio;
    };

    case (_isRifleman): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade, _countGRENADES]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, _commonRIFLE select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_fnc_addAmmoAuto;
    };

    case (_isDemo): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_fnc_useUniform;
        [_unit, [[_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call BRM_fnc_addtoUniform;
        [_unit,[[_apMINE,2],[_apBoundingMINE,2]]] call BRM_fnc_addtoVest;
        [_unit,[[_C4,3],[_satchelCharge,1],[_deadManSwitch,1]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_fnc_addWeaponKit;
    };

    case (_isRiflemanAT): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _bigBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_fnc_addWeaponKit;
        [_unit, _specAT] call BRM_fnc_addWeapon;
        [_unit, [[_specAT select RAMMO, _countAT] ]] call BRM_fnc_addtoBackpack;
        [_unit, _specAT select GUN, 1, ["HE"]] call BRM_fnc_addAmmoAuto;
    };

    case (_isMarksman): {
        [_unit, _commonHEAD, _marksmanUNIFORM, _marksmanVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonMARKSMAN, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, _commonMARKSMAN select GUN, _countTracerRIFLE, ["TRACER"]] call BRM_fnc_addAmmoAuto;
        [_unit, "primary", _commonRCO] call BRM_fnc_attachToWeapon;
    };

    case (_isAutorifleman): {
        [_unit, _commonHEAD, _mgUNIFORM, _mgVEST, _commonBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_spareBarrel,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonMG, _countMG] call BRM_fnc_addWeaponKit;
        [_unit, _commonMG select GUN, _countTracerMG, ["TRACER"]] call BRM_fnc_addAmmoAuto;
    };

    case (_isGrenadier): {
        [_unit, _commonHEAD, _commonUNIFORM, _grenadierVEST, _commonBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit,[[_commonRIFLEGL select GL, _count40mm]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLEGL, _countRIFLELOW] call BRM_fnc_addWeaponKit;
    };

    case (_isLifeSaver): {
        [_unit, _medicHEAD, _medicUNIFORM, _medicVEST, _commonBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2], [_gsmoke,3]]] call BRM_fnc_addtoVest;
        [_unit, _suppliesMEDIC] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_fnc_addWeaponKit;
        _defaultInsignia = "MedB";
    };

    case (_isHMG): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _HMG] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isStaticAT): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _StaticAT] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isHMGTripod): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _HMGTripod] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isATTripod): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _ATTripod] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isMortar): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _mortar] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isMortarAssistant): {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, _mortarTripod] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
    };

    case (_isUAVOperator): {
        [_unit, _commonHEAD, _commonUNIFORM, _slVEST, _UAVBag] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke, 2]]] call BRM_fnc_addtoVest;
        [_unit,[["ACE_UAVBattery", 1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit, [_UAVTerminal]] call BRM_fnc_linkItem;
    };

    case (_isRecon): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, "empty"] call BRM_fnc_useUniform;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_rchemlight,2],[_bchemlight,2],[_wflare,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_fnc_attachToWeapon;
    };

    case (_isReconMedic): {
        [_unit, _medicHEAD, _reconUNIFORM, _reconVEST, _commonBACKPACK] call BRM_fnc_useUniform;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _suppliesMEDIC] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLE] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_fnc_attachToWeapon;
        _defaultInsignia = "MedB";
    };

    case (_isReconDemo): {
        [_unit, _reconHEAD, _reconUNIFORM, _reconVEST, _bigBACKPACK] call BRM_fnc_useUniform;
        [_unit, "binoc"] call BRM_fnc_addOptics;
        [_unit, [[_clacker,1],[_mineDetector,1],[_defusalKit,1]]] call BRM_fnc_addtoUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit,[[_C4,3],[_satchelCharge,1],[_deadManSwitch,1]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_fnc_addWeaponKit;
        [_unit, "primary", _commonSUPPRESSOR] call BRM_fnc_attachToWeapon;
    };

    case (_isPilot): {
        [_unit, _pilotHEAD, _pilotUNIFORM, "empty", _parachute] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_mapTools,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonPISTOL, _countPISTOL] call BRM_fnc_addWeaponKit;
    };

    case (_isHelicopterCrew): {
        [_unit, _helicrewHEAD, _helicrewUNIFORM, "empty", _parachute] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonSMG, _countRIFLELOW] call BRM_fnc_addWeaponKit;
    };

    case (_isHelicopterPilot): {
        [_unit, _helipilotHEAD, _helicrewUNIFORM, "empty", _parachute] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonSMG, _countRIFLELOW] call BRM_fnc_addWeaponKit;
    };

    case (_isCrewman): {
        [_unit, _crewmanHEAD, _crewUNIFORM, "empty", "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2]]] call BRM_fnc_addtoVest;
        [_unit, _commonSMG, _countRIFLELOW] call BRM_fnc_addWeaponKit;
        if (_isLeader) then { [_unit, "BP"] call BRM_fnc_addRadio };
    };

    case (_isSniper): {
        [_unit, _sniperHEAD, _sniperUNIFORM, _commonVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_mapTools,1],[_kestrel,1]]] call BRM_fnc_addtoVest;
        [_unit, _commonSNIPER, _countSNIPER] call BRM_fnc_addWeaponKit;
        [_unit, _commonSNIPER select GUN, (_countSNIPER/2)+1, ["TRACER"]] call BRM_fnc_addAmmoAuto;
        [_unit, "primary", _commonMAGNIFIED] call BRM_fnc_attachToWeapon;
        if (_isLeader) then { [_unit, "BP"] call BRM_fnc_addRadio };
    };

    case (_isSpotter): {
        [_unit, _sniperHEAD, _sniperUNIFORM, _commonVEST, _commonBACKPACK] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_rsmoke,2],[_gsmoke,2],[_mapTools,1],[_kestrel,1]]] call BRM_fnc_addtoVest;
        [_unit,[[_commonSNIPER select RAMMO, (_countSNIPER*2)]]] call BRM_fnc_addtoBackpack;
        [_unit, _commonRIFLE, _countRIFLELOW] call BRM_fnc_addWeaponKit;
        [_unit, "binoc"] call BRM_fnc_addOptics;
    };

    default {
        [_unit, _commonHEAD, _commonUNIFORM, _commonVEST, "empty"] call BRM_fnc_useUniform;
        [_unit,[[_wsmoke,2],[_grenade,3]]] call BRM_fnc_addtoVest;
        [_unit, _commonRIFLE, 5] call BRM_fnc_addWeaponKit;
    };
};

// ADDS ESSENTIALS =============================================================

[_unit, _suppliesNORMAL] call BRM_fnc_addtoUniform;

[_unit, ["ItemMap", "ItemCompass", "ItemWatch"]] call BRM_fnc_linkItem;

[_unit, "SR"] call BRM_fnc_addRadio;
