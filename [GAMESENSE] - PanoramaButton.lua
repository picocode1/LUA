local js = panorama.loadstring([[
	var panel
	var _Create = function(layout) {
		var parent = $.GetContextPanel().FindChildTraverse("JsMainMenuNavBar")
		panel = $.CreatePanel("Panel", parent, "CustomPanel")
		if(!panel)
			return

		if(!panel.BLoadLayoutFromString(layout, false, false))
			return

		parent.MoveChildBefore(panel, parent.GetChild(14))

	}
	var _Destroy = function() {
		if(panel != null) {
			panel.RemoveAndDeleteChildren()
			panel.DeleteAsync(0.0)
			panel = null
		}
	}
	return {
		create: _Create,
		destroy: _Destroy,
	}

]], "CSGOMainMenu")()

local layout = [[
<root>	
	<Panel class="vertical-align-middle horizontal-center">
		<RadioButton id="CustomPanel"
			onactivate="$.DispatchEvent('PlaySoundEffect', 'mainmenu_press_GO', 'MOUSE' ); 
			GameInterfaceAPI.ConsoleCommand('connect 149.202.86.115:27015');"
			oncancel="MainMenu.OnEscapeKeyPressed();"
			onmouseover="UiToolkitAPI.ShowTextTooltip( 'CustomPanel', 'JOIN PICOWARE HVH');"
			onmouseout="UiToolkitAPI.HideTextTooltip();">
			<Image textureheight="42" texturewidth="-1" src="file://{images}/icons/ui/servers.svg" />
		</RadioButton>
    </Panel>
</root>
]]

js.create(layout)
client.set_event_callback("shutdown", function()
	js.destroy()
end)
