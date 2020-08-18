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
            player.insert {name = "logistic-chest-passive-provider", count = 50}
            player.insert {name = "logistic-chest-requester", count = 50}
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
        player.insert {name = "logistic-chest-passive-provider", count = 50}
        player.insert {name = "logistic-chest-requester", count = 50}
        player.insert {name = "logistic-robot", count = 200}
        player.insert {name = "construction-robot", count = 50}
        player.insert {name = "roboport", count = 10}
    end
end)
