CreateThread(function()
    for i, j in pairs(Config.Jobs) do
        for _, v in pairs(j.Locations) do
            if GetResourceState("ox_target") ~= "missing" then
                exports.ox_target:addSphereZone({
                    coords = v,
                    radius = Config.Radius,
                    debug = false,
                    options = {
                        {
                            name = i,
                            icon = Config.Icon,
                            label = '[' .. i .. '] - ' .. Config.Label,
                            canInteract = function(entity, distance, coords, name)
                                local playerData = ESX.GetPlayerData()
                                local jobTable = Config.Jobs[name]
                                local jobName = playerData.job.name

                                if distance < Config.InteractDistance and (jobName == jobTable.OnDutyJob or jobName == jobTable.OffDutyJob) then
                                    return true
                                else
                                    return false
                                end
                            end,
                            onSelect = function (data)
                                local playerData = ESX.GetPlayerData()
                                local jobTable = Config.Jobs[data.name]
                                local jobName = playerData.job.name

                                if jobName == jobTable.OnDutyJob then
                                    ESX.TriggerServerCallback("jl_duty:ToggleClock", function(sucess)
                                        if not sucess then return ESX.ShowNotification('An error has occured') end

                                        return ESX.ShowNotification(Config.Lang['offDuty'])
                                    end, data.name, false)
                                elseif jobName == jobTable.OffDutyJob then
                                    ESX.TriggerServerCallback("jl_duty:ToggleClock", function(sucess)
                                        if not sucess then return ESX.ShowNotification('An error has occured') end

                                        return ESX.ShowNotification(Config.Lang['onDuty'])
                                    end, data.name, true)
                                end
                            end
                        }
                    }
                })
            end
        end
    end
end)