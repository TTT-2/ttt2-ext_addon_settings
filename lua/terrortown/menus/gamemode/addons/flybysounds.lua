-- server config support for Fly By Sounds: https://steamcommunity.com/sharedfiles/filedetails/?id=167809847

CLGAMEMODESUBMENU.base = "base_gamemodesubmenu"
CLGAMEMODESUBMENU.title = "submenu_addons_flybysounds_title"

function CLGAMEMODESUBMENU:Populate(parent)
    local form = vgui.CreateTTT2Form(parent, "header_flybysounds_settings")

    form:MakeSlider({
        label = "label_cl_flybysound_updatedelay",
        convar = "cl_flybysound_updatedelay",
        min = 0,
        max = 1,
        decimal = 1,
    })

    form:MakeSlider({
        label = "label_cl_flybysound_scandelay",
        convar = "cl_flybysound_scandelay",
        min = 0,
        max = 1,
        decimal = 1,
    })

    form:MakeSlider({
        label = "label_cl_flybysound_cutoffdist",
        convar = "cl_flybysound_cutoffdist",
        min = 0,
        max = 10000,
        decimal = 0,
    })

    form:MakeCheckBox({
        label = "label_cl_flybysound_altsound",
        convar = "cl_flybysound_altsound",
    })
end

function CLGAMEMODESUBMENU:ShouldShow()
    return ConVarExists("cl_flybysound_updatedelay")
end
