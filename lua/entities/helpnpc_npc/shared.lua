ENT.Type = "anim";
ENT.Base = "base_ai";
ENT.Type = "ai";
ENT.PrintName = "Help NPC";
ENT.Author = "Snuff";
ENT.Spawnable = "true";

function ENT:SetAutomaticFrameAdvance(bUsingAnim)
	self.AutomaticFrameAdvance = bUsingAnim;
end