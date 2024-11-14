local commId = GetConvar("imperial_community_id", "")

if not commId or commId == "" then
    error("Could not find Imperial Community convar.") 
end

print ("ImperialCAD Community ID Found")

RegisterNetEvent("getCivData")
AddEventHandler("getCivData", function(ssn)
    local src = source
    PerformHttpRequest("https://imperialcad.app/api/1.1/wf/getCivData?ssn=" .. ssn .. "&commId=" .. commId,
    function(statusCode, response, headers)
        if statusCode == 200 then
            local data = json.decode(response)
            if data and data.ssn then  
                TriggerClientEvent("setActiveCiv", src, data)
            else
                print("No SSN found in the data. Here's what was received: " .. response)
                TriggerClientEvent("notify", src, "No civilian found with this SSN.")
            end
        else
            print("Failed to retrieve data with status code: " .. statusCode)
            TriggerClientEvent("notify", src, "Failed to retrieve data.")
        end
    end, "GET")
end)

RegisterNetEvent("updateCivilianStatus")
AddEventHandler("updateCivilianStatus", function(data)
    if data.status == "deleted" and data.ssn == GetResourceKvpString("civ_ssn") then
        DeleteResourceKvp("civ_ssn")
        DeleteResourceKvp("civ_name")
        DeleteResourceKvp("civ_age")
        DeleteResourceKvp("civ_address")
        TriggerEvent("notify", "Your active civilian profile has been deleted externally.")
    end
end)

RegisterNetEvent("registerVehicleToCAD")
AddEventHandler("registerVehicleToCAD", function(ssn, vehicleModelName, plate, colorName, makeName, year)
    local commId = GetConvar("imperial_community_id", "")
    if not commId or commId == "" then
        TriggerClientEvent("notify", source, "Community ID is not set. Cannot proceed with registration.")
        return
    end
    local data = {
        ssn = ssn,
        vehicleModel = vehicleModelName,
        plate = plate,
        commId = commId,
        year = "2015",
        make = makeName,
        color = colorName
    }
    
    local jsonData = json.encode(data)
    PerformHttpRequest("https://imperialcad.app/api/1.1/wf/registerVehicle", 
        function(statusCode, response, headers)
            if statusCode == 200 then
                TriggerClientEvent("showConsoleMessage", source, "Vehicle registered successfully.")
            else
                TriggerClientEvent("showConsoleMessage", source, "Failed to register vehicle. Please try again.")
            end
        end, 
        "POST", jsonData, {["Content-Type"] = "application/json"})
end)


