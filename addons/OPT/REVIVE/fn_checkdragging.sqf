/**
* Author: James
* check whether player can drag target 
*
* Arguments:
* 0: <OBJECT> target add action is attached to
* 1: <OBJECT> unit that called the add action
*
* Return Value:
* 0: <BOOL> true - patient can be dragged, false - otherwise
*
* Example:
* [cursorObject, player] call fnc_checkDragging.sqf;
*
*/
#include "script_component.hpp"

params ["_target", "_caller"];

private _return = false;

if (!alive _caller || {!(lifeState _caller isEqualTo "INCAPACITATED")} || {GVAR(OPT_isDragging)} || {isNil "_target"} || {!alive _target} || {!isPlayer _target} || {(_target distance _caller) > 5}) exitWith 
{
	_return;
};

// Target of the action
private _isTargetUnconscious = false;
private _isDragged = _target getVariable "OPT_isDragged"; 

if (lifeState _target isEqualTo "INCAPACITATED") then
{
	private _isTargetUnconscious = 	true;
};	

if (_isTargetUnconscious && {_isDragged == 0}) then 
{
	_return = true;
};

_return