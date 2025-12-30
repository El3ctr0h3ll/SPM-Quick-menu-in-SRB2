local SPMMENU = false
addHook("PlayerThink", function(player)
    if not player.mo and player.mo.valid return end
    if (player.cmd.buttons & BT_CUSTOM1) and not (player.lastbuttons & BT_CUSTOM1)
if SPMMENU == false    
CONS_Printf(player, "SPMMENU on")
SPMMENU = true
S_StartSound(player.mo, SFX_SPMLINETURNone, player)
elseif SPMMENU == true then
    CONS_Printf(player, "SPMMENU off")
   SPMMENU = false  
   S_StartSound(player.mo, SFX_SPMSYSMENUCANCELone, player)
end
end
end)



local function drawSPMMENU(v, player, cam)
    local patch = v.cachePatch("SPM_WHITEBOX") 
    if (patch == nil) then return end 
if SPMMENU == false then return end 
  
    v.draw(0, 5, patch, V_SNAPTORIGHT, v.getColormap("sonic"))
	local patch = v.cachePatch("SPM_CHAR")
	v.draw(0, 10, patch, V_SNAPTORIGHT, v.getColormap("sonic"))
	
end

addHook("HUD", drawSPMMENU, "game")