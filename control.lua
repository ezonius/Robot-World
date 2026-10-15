script.on_event(defines.events.on_player_created, function(event)
    if not remote.interfaces["freeplay"] then return end
    if settings.startup["enable-quick-start"].value then
        local player = game.players[event.player_index]
        if not player.character == nil then
            player.insert {name = "inserter", count = 200}
            player.insert {name = "small-electric-pole", count = 200}
            player.insert {name = "electric-mining-drill", count = 24}
            player.insert {name = "stone-furnace", count = 28}
            player.insert {name = "assembling-machine-1", count = 20}
            player.insert {name = "pipe", count = 5}
            player.insert {name = "steam-engine", count = 8}
            player.insert {name = "boiler", count = 4}
            player.insert {name = "offshore-pump", count = 1}
            player.insert {name = "pipe-to-ground", count = 2}
            player.insert {name = "lab", count = 10}
            player.insert {name = "coal", count = 50}
            player.insert {name = "passive-provider-chest", count = 50}
            player.insert {name = "requester-chest", count = 50}
            player.insert {name = "logistic-robot", count = 200}
            player.insert {name = "construction-robot", count = 50}
            player.insert {name = "roboport", count = 10}
        end
    end
end)

script.on_event(defines.events.on_cutscene_cancelled, function(event)
    if not remote.interfaces["freeplay"] then return end
    if settings.startup["enable-quick-start"].value then
        local player = game.players[event.player_index]
        player.insert {name = "inserter", count = 200}
        player.insert {name = "small-electric-pole", count = 200}
        player.insert {name = "electric-mining-drill", count = 24}
        player.insert {name = "stone-furnace", count = 28}
        player.insert {name = "assembling-machine-1", count = 20}
        player.insert {name = "pipe", count = 5}
        player.insert {name = "steam-engine", count = 8}
        player.insert {name = "boiler", count = 4}
        player.insert {name = "offshore-pump", count = 1}
        player.insert {name = "pipe-to-ground", count = 2}
        player.insert {name = "lab", count = 10}
        player.insert {name = "coal", count = 50}
        player.insert {name = "passive-provider-chest", count = 50}
        player.insert {name = "requester-chest", count = 50}
        player.insert {name = "logistic-robot", count = 200}
        player.insert {name = "construction-robot", count = 50}
        player.insert {name = "roboport", count = 10}
    end
end)

-- === Non-lootable robots ===
-- Uses the per-entity runtime flag `minable_flag` (Read|Write) so robots can be made
-- non-lootable live in-game, without a restart: `minable_flag = false` means the entity
-- cannot be picked up by right-click mining anymore. Toggled through the runtime-global
-- settings "non-lootable-logistic-robots" / "non-lootable-construction-robots".

local loot_setting_for_type = {
    ["logistic-robot"]     = "non-lootable-logistic-robots",
    ["construction-robot"] = "non-lootable-construction-robots",
}

local function set_loot_flag(robot_type, locked)
    for _, surface in pairs(game.surfaces) do
        for _, robot in pairs(surface.find_entities_filtered { type = robot_type }) do
            robot.minable_flag = not locked
        end
    end
end

local function apply_loot_flags()
    for robot_type, setting_name in pairs(loot_setting_for_type) do
        set_loot_flag(robot_type, settings.global[setting_name].value)
    end
end

local function loot_settings_active()
    for _, setting_name in pairs(loot_setting_for_type) do
        if settings.global[setting_name].value then
            return true
        end
    end
    return false
end

local function robot_type_for_setting(setting_name)
    for robot_type, name in pairs(loot_setting_for_type) do
        if name == setting_name then
            return robot_type
        end
    end
end

-- The `game` object is NOT available inside on_load (Factorio keeps it nil until the
-- save has finished loading), so the initial sync is deferred to the first tick after
-- a load. minable_flag and the runtime-global settings both persist in the save, so
-- this is only a safety sync - and it is skipped entirely (normal loads pay nothing)
-- unless one of the toggles is on.
local loot_flags_dirty = false

script.on_init(function()
    loot_flags_dirty = loot_settings_active()
end)

script.on_load(function()
    loot_flags_dirty = loot_settings_active()
end)

script.on_event(defines.events.on_tick, function(event)
    if not loot_flags_dirty then return end
    loot_flags_dirty = false
    apply_loot_flags()
end)

-- Live toggle: fires when the runtime-global setting is changed from the mod settings GUI.
script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    if event.setting_type ~= "runtime-global" then return end
    local robot_type = robot_type_for_setting(event.setting)
    if robot_type then
        set_loot_flag(robot_type, settings.global[event.setting].value)
    end
end)

-- Keep newly built robots non-lootable while the setting is on. Robots that respawn from a
-- roboport charging station are the SAME entity (they persist in the pad), so their
-- minable_flag survives respawns and no extra hook is needed for them.
script.on_event(defines.events.on_built_entity, function(event)
    local entity = event.entity
    if entity == nil then return end
    local setting_name = loot_setting_for_type[entity.type]
    if setting_name and settings.global[setting_name].value then
        entity.minable_flag = false
    end
end)
