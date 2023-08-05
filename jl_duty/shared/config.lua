Config = {}
Config.InteractDistance = 2
Config.Radius = 1
Config.Icon = 'fa-solid fa-business-time'
Config.Label = 'On/Off Duty'
Config.DiscordLogs = {
        enabled = true
}

Config.Lang = {
    ['onDuty'] = 'You went OnDuty',
    ['offDuty'] = 'You went OffDuty'
}

Config.Jobs = {
    LSPD = {
        OnDutyJob = 'lspd',
        OffDutyJob = 'offlspd',
        Locations = {
            vec3(441.2242, -982.1112, 30.6895)
        }
    },

    Ambulance = {
        OnDutyJob = 'ambulance',
        OffDutyJob = 'offambulance',
        Locations = {
            vec3(-435.8526, -325.9342, 34.9108)
        }
    },

    Sheriff = {
        OnDutyJob = 'lssd',
        OffDutyJob = 'offlssd',
        Locations = {
            vec3(-447.9065, 6013.8262, 31.7163),
            vec3(1817.4017, 3672.9219, 35.3124)
        }
    },
}
