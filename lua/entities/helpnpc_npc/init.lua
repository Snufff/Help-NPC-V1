AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
include("cl_helpnpc_config.lua")

function ENT:Initialize()
	self:SetModel("models/Barney.mdl"); -- CHANGE MODEL HERE
	self:SetHullType(HULL_HUMAN);
	self:SetHullSizeNormal();
	self:SetNPCState(NPC_STATE_SCRIPT);
	self:SetSolid(SOLID_BBOX);
	self:CapabilitiesAdd(bit.bor(CAP_ANIMATEDFACE, CAP_TURN_HEAD));
	self:SetUseType(SIMPLE_USE);
	self:DropToFloor();
	self:SetMaxYawSpeed(90);
	self:DropToFloor();
end

 function ENT:AcceptInput( input, ply, caller )
if input == "Use" && ply:IsPlayer() then
	ply:ConCommand( "cl_helpnpc" )
end
end
