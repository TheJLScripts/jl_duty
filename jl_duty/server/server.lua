ESX.RegisterServerCallback('jl_duty:ToggleClock', function(src, cb, jobName, clockIn)
    local jobTable = Config.Jobs[jobName]
    if jobTable == nil then return cb(false) end

    local xPlayer = ESX.GetPlayerFromId(src)
    local xPlayerJob = xPlayer.getJob()

    local job = jobTable.OffDutyJob

    if clockIn then
        job = jobTable.OnDutyJob
        if Config.DiscordLogs.enabled then
            local playerName = xPlayer.getName()
            local xPlayerJob = xPlayer.getJob()
            local jobName = xPlayer.job.name
        sendToDiscord(65280," Duty-Log ","["..jobName.."] " ..playerName.." - ("..xPlayerJob.grade_label..")".. " - went OnDuty")
        end
    else
        if Config.DiscordLogs.enabled then
            local playerName = xPlayer.getName()
            local xPlayerJob = xPlayer.getJob()
        sendToDiscord(16711680," Duty-Log ","["..jobName.."] " ..playerName.." - ("..xPlayerJob.grade_label..")".. " - went OffDuty")
        end
    end

    if ESX.DoesJobExist(job, xPlayerJob.grade) then
        xPlayer.setJob(job, xPlayerJob.grade)

        cb(true)
    else
        cb(false)
    end
end)

function sendToDiscord(color, name, message, footer)
    local embed = {
        {
            ['color']       = color,
            ['title']       = '**'..name..'**',
            ['description'] = message,
            ["fields"] = {
                {
                    ["name"] = 'Time',
                    ["value"] = os.date('%d/%m/%Y - %X')
                }
            },
            ['footer']      = {
                ['text']    = footer,
            },
        }
    }
    PerformHttpRequest(Config.DiscordLogs.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = 'Duty-Log', embeds = embed}), { ['Content-Type'] = 'application/json' })
end