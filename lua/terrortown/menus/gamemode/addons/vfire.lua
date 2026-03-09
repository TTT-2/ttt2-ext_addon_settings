-- server config support for vFire: https://steamcommunity.com/sharedfiles/filedetails/?id=1525218777

local TryT = LANG.TryTranslation

CLGAMEMODESUBMENU.base = "base_gamemodesubmenu"
CLGAMEMODESUBMENU.title = "submenu_addons_vfire_title"

function CLGAMEMODESUBMENU:Populate(parent)
    local form = vgui.CreateTTT2Form(parent, "header_vfire_settings")

    form:MakeHelp({
        label = "help_vfire_admin_settings",
    })

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
        convar = "vfire_enable_glows",
    })

    local enbLight = form:MakeCheckBox({
        label = "label_vfire_enable_lights",
        convar = "vfire_enable_lights",
        master = enbGlow,
    })

    form:MakeSlider({
        label = "label_vfire_light_brightness",
        convar = "vfire_light_brightness",
        min = 0,
        max = 2,
        decimal = 1,
        master = enbLight,
    })
end

function CLGAMEMODESUBMENU:PopulateButtonPanel(parent)
    local buttonReset = vgui.Create("DButtonTTT2", parent)

    buttonReset:SetText("button_reset")
    buttonReset:SetSize(100, 45)
    buttonReset:SetPos(20, 20)
    buttonReset.DoClick = function(btn)
        RunConsoleCommand("vfire_default_visual_settings")

        timer.Simple(0, function()
            vguihandler.Rebuild()
        end)
    end
end

function CLGAMEMODESUBMENU:HasButtonPanel()
    return true
end

function CLGAMEMODESUBMENU:ShouldShow()
    return vFireInstalled
end
