-- server config support for vFire: https://steamcommunity.com/sharedfiles/filedetails/?id=1525218777

CLGAMEMODESUBMENU.base = "base_gamemodesubmenu"

CLGAMEMODESUBMENU.priority = 100
CLGAMEMODESUBMENU.title = "submenu_server_addons_vfire_title"
--CLGAMEMODESUBMENU.icon = Material("vgui/ttt/vskin/helpscreen/accessibility")

function CLGAMEMODESUBMENU:Populate(parent)
    local form = vgui.CreateTTT2Form(parent, "header_vfire_settings")

    form:MakeHelp({
        label = "help_vfire_spread_boost",
    })

    form:MakeSlider({
        label = "label_vfire_spread_boost",
        serverConvar = "vfire_spread_boost",
        min = 0,
        max = 10,
        decimal = 0,
    })

    local enbDamage = form:MakeCheckBox({
        label = "label_vfire_enable_damage",
        serverConvar = "vfire_enable_damage",
    })

    form:MakeCheckBox({
        label = "label_vfire_enable_damage_in_vehicles",
        serverConvar = "vfire_enable_damage_in_vehicles",
        master = enbDamage,
    })

    form:MakeSlider({
        label = "label_vfire_damage_multiplier",
        serverConvar = "vfire_damage_multiplier",
        min = 0,
        max = 10,
        decimal = 1,
        master = enbDamage,
    })

    local enbEffects = form:MakeCheckBox({
        label = "label_vfire_enable_explosion_fires",
        serverConvar = "vfire_enable_explosion_fires",
        master = enbDamage,
    })

    form:MakeCheckBox({
        label = "label_vfire_enable_explosion_effects",
        serverConvar = "vfire_enable_explosion_effects",
        master = enbEffects,
    })

    local enbDecal = form:MakeCheckBox({
        label = "label_vfire_enable_decals",
        serverConvar = "vfire_enable_decals",
        master = enbEffects,
    })

    form:MakeSlider({
        label = "label_vfire_decal_probability",
        serverConvar = "vfire_decal_probability",
        min = 0,
        max = 1,
        decimal = 1,
        master = enbDecal,
    })

    local enbSpread = form:MakeCheckBox({
        label = "label_vfire_enable_spread",
        serverConvar = "vfire_enable_spread",
    })

    form:MakeSlider({
        label = "label_vfire_spread_delay",
        serverConvar = "vfire_spread_delay",
        min = 0,
        max = 20,
        decimal = 0,
        master = enbSpread,
    })

    form:MakeSlider({
        label = "label_vfire_decay_rate",
        serverConvar = "vfire_decay_rate",
        min = 0,
        max = 1,
        decimal = 1,
    })

    form:MakeCheckBox({
        label = "label_vfire_affect_npcs",
        serverConvar = "vfire_affect_npcs",
    })
end

function CLGAMEMODESUBMENU:PopulateButtonPanel(parent)
    local buttonReset = vgui.Create("DButtonTTT2", parent)

    buttonReset:SetText("button_reset")
    buttonReset:SetSize(100, 45)
    buttonReset:SetPos(20, 20)
    buttonReset.DoClick = function(btn)
        RunConsoleCommand("vfire_default_settings")
    end

    local buttonEditor = vgui.Create("DButtonTTT2", parent)

    buttonEditor:SetText("button_vfire_remove_all")
    buttonEditor:SetSize(200, 45)
    buttonEditor:SetPos(parent:GetWide() - 220, 20)
    buttonEditor.DoClick = function(btn)
        RunConsoleCommand("vfire_remove_all")
    end
end

function CLGAMEMODESUBMENU:HasButtonPanel()
    return true
end

function CLGAMEMODESUBMENU:ShouldShow()
    return vFireInstalled
end
