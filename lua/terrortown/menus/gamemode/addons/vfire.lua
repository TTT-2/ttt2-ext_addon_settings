-- server config support for vFire: https://steamcommunity.com/sharedfiles/filedetails/?id=1525218777

CLGAMEMODESUBMENU.base = "base_gamemodesubmenu"
CLGAMEMODESUBMENU.title = "submenu_addons_vfire_title"

function CLGAMEMODESUBMENU:Populate(parent)
    local form = vgui.CreateTTT2Form(parent, "header_vfire_settings")

    form:MakeComboBox({
        label = "label_vfire_lod",
        convar = "vfire_lod",
        choices = {
            { title = TryT("choice_vfire_lod_0"), value = 0 },
            { title = TryT("choice_vfire_lod_1"), value = 1 },
            { title = TryT("choice_vfire_lod_2"), value = 2 },
        },
    })

    local enbGlow = form:MakeCheckBox({
        label = "label_vfire_enable_glows",
        serverConvar = "vfire_enable_glows",
    })

    local enbLight = form:MakeCheckBox({
        label = "label_vfire_enable_glows",
        serverConvar = "vfire_enable_glows",
        master = enbGlow,
    })

    form:MakeSlider({
        label = "label_vfire_light_brightness",
        serverConvar = "vfire_light_brightness",
        min = 0,
        max = 10,
        decimal = 1,
        master = enbLight,
    })

    form:MakeHelp({
        label = "help_vfire_admin_settings",
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
