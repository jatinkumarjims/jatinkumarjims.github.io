--[[
  BGMI 4.4.0 No Recoil + No Shake - GameGuardian Script
  Fully fixed with underscore notation
]]

-- ============================================================
-- OFFSET CONFIGURATION
-- ============================================================

local Offsets = {
    WeaponManagerComponent = 0x21B8,
    CurrentWeaponReplicated = 0x4F0,
    ShootWeaponEntityComp = 0xFE8,
    ShootWeaponEffectComp = 0xFF0,
    ShootWeaponComponent = 0xE68,
    RecoilKickADS = 0xBE8,
    AccessoriesVRecoilFactor = 0xAB8,
    AccessoriesHRecoilFactor = 0xABC,
    AccessoriesRecoveryFactor = 0xAC0,
    AnimationKick = 0xC04,
    GameDeviationFactor = 0xB30,
    GameDeviationAccuracy = 0xB34,
    BulletFireSpeed = 0x4E0,
    RecoilInfo = 0xA48,
    CameraShakeInnerRadius = 0x258,
    CameraShakeOuterRadius = 0x25C,
    CameraShakFalloff = 0x260,
    bIsWeaponFiring = 0x15A8,
}

-- ============================================================
-- HELPER FUNCTIONS
-- ============================================================

function readPtr(addr)
    if addr == 0 or addr == nil then return 0 end
    local t = gg_getValues({{address = addr, flags = gg_TYPE_QWORD}})
    if t == nil or t[1] == nil then return 0 end
    return tonumber(t[1].value)
end

function writeFloat(addr, val)
    if addr == 0 or addr == nil then return end
    gg_setValues({{address = addr, flags = gg_TYPE_FLOAT, value = val}})
end

function getLibBase(name)
    local ranges = gg_getRangesList(name)
    if #ranges == 0 then return nil end
    for _, r in ipairs(ranges) do
        if r.state == "Xa" then return r.start end
    end
    return ranges[1].start
end

-- ============================================================
-- NO RECOIL (Pattern Search)
-- ============================================================

function NoRecoilPattern()
    gg_toast("No Recoil (Pattern Search)...")
    gg_clearResults()
    gg_setRanges(gg_REGION_C_ALLOC + gg_REGION_ANONYMOUS)
    
    gg_searchNumber("0.3~0.5;0.8~1.2::5", gg_TYPE_FLOAT, false, gg_SIGN_EQUAL, 0, -1)
    local count = gg_getResultsCount()
    
    if count ~= nil and count > 0 and count < 500 then
        local results = gg_getResults(count)
        local patched = 0
        for i, v in ipairs(results) do
            v.value = "0.0"
            v.freeze = true
            patched = patched + 1
        end
        gg_setValues(results)
        gg_addListItems(results)
        gg_toast("No Recoil! (" .. patched .. " values frozen to 0)")
    else
        gg_toast("Pattern not found. Hold a weapon first.")
    end
    gg_clearResults()
end

-- ============================================================
-- NO RECOIL (Struct Zero)
-- ============================================================

function NoRecoilStruct()
    gg_toast("No Recoil (Struct Zero)...")
    gg_clearResults()
    gg_setRanges(gg_REGION_C_ALLOC + gg_REGION_ANONYMOUS)
    
    gg_searchNumber("0.28~0.30;0.35~0.37;0.40~0.44::9", gg_TYPE_FLOAT, false, gg_SIGN_EQUAL, 0, -1)
    local count = gg_getResultsCount()
    
    if count ~= nil and count > 0 then
        local results = gg_getResults(math.min(count, 100))
        for i, v in ipairs(results) do
            v.value = "0.0"
            v.freeze = true
        end
        gg_setValues(results)
        gg_addListItems(results)
        gg_toast("Recoil curve zeroed! (" .. #results .. " points)")
    else
        gg_toast("Recoil curve not found. Equip M416 and retry.")
    end
    gg_clearResults()
end

-- ============================================================
-- NO SHAKE
-- ============================================================

function NoShake()
    gg_toast("No Camera Shake...")
    gg_clearResults()
    gg_setRanges(gg_REGION_C_ALLOC + gg_REGION_ANONYMOUS)
    
    gg_searchNumber("200~500;500~1500::5", gg_TYPE_FLOAT, false, gg_SIGN_EQUAL, 0, -1)
    local count = gg_getResultsCount()
    
    if count ~= nil and count > 0 and count < 200 then
        local results = gg_getResults(count)
        for i, v in ipairs(results) do
            v.value = "0.0"
            v.freeze = true
        end
        gg_setValues(results)
        gg_addListItems(results)
        gg_toast("No Shake! (" .. #results .. " values)")
    else
        gg_clearResults()
        gg_searchNumber("100~2000;100~2000;0.1~5.0::9", gg_TYPE_FLOAT, false, gg_SIGN_EQUAL, 0, -1)
        count = gg_getResultsCount()
        if count ~= nil and count > 0 and count < 100 then
            local results = gg_getResults(count)
            for i, v in ipairs(results) do
                v.value = "0.0"
                v.freeze = true
            end
            gg_setValues(results)
            gg_addListItems(results)
            gg_toast("No Shake (Method 2)! (" .. #results .. " values)")
        else
            gg_toast("Shake values not found. Fire a weapon first.")
        end
    end
    gg_clearResults()
end

-- ============================================================
-- COMBINED
-- ============================================================

function NoRecoilNoShake()
    NoRecoilPattern()
    gg_sleep(500)
    NoShake()
    gg_toast("No Recoil + No Shake ACTIVE!")
end

-- ============================================================
-- OFFSET METHOD (Precise)
-- ============================================================

function NoRecoilOffset()
    gg_toast("No Recoil (Offset Method)...")
    local base = getLibBase("libUE4.so")
    if base == nil then
        gg_toast("libUE4.so not loaded! Open game first.")
        return
    end
    gg_toast("Offset method needs GWorld address. Use UE4Dumper first.")
end

-- ============================================================
-- MENU
-- ============================================================

function main()
    local menu = gg_choice({
        "No Recoil (Pattern - Universal)",
        "No Recoil (Struct Zero - M416)",
        "No Camera Shake",
        "BOTH (No Recoil + No Shake)",
        "Exit"
    }, nil, "BGMI 4.4.0 - No Recoil & No Shake")
    
    if menu == 1 then NoRecoilPattern()
    elseif menu == 2 then NoRecoilStruct()
    elseif menu == 3 then NoShake()
    elseif menu == 4 then NoRecoilNoShake()
    elseif menu == 5 then os_exit()
    end
end

-- ============================================================
-- MAIN LOOP
-- ============================================================

while true do
    if gg_isVisible(true) then
        gg_setVisible(false)
        main()
    end
    gg_sleep(100)
end
