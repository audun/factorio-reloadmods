require 'mod-gui'
local button_name = 'quick-reload-mods-button'
script.on_event({defines.events.on_gui_click}, function(event)
   if(event.element.name == button_name) then
      game.reload_mods()
   end
end)

local function create_gui(e)
   for i, player in pairs(game.players) do
      local bf = mod_gui.get_button_flow(player)
      if not bf[button_name] then
         bf.add{
            type = "button",
            name = button_name,
            style = mod_gui.button_style,
            caption = "Reload mods"
         }
      end
   end
end

script.on_configuration_changed(create_gui)
script.on_event(defines.events.on_player_created, create_gui)
script.on_event(defines.events.on_player_joined_game, create_gui)

