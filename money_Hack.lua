--after
                                                                                                                         
util.require_natives(1676318796)          
util.require_natives(1681379138)                                                                                           

util.require_natives("1651208000") 

-- 현재 날짜와 시간 가져오기
local currentTime = os.date("*t")

-- 연, 월, 일, 시간, 분 추출
local year = currentTime.year
local month = currentTime.month
local day = currentTime.day
local hour = currentTime.hour
local minute = currentTime.min




local Tesxt28 = ""
local Tesxt22 = ""
local vipvipvip = false


local ver = "1.4"




local ScriptName = "GTA5.WTF"
local SetRank, SetMoney = 1, nil    

INT_MIN = -2147483648
INT_MAX = 2147483647


menu.trigger_commands("seamless off")
menu.trigger_commands("skipswoopdown off")


local USER = menu.get_activation_key_hash()

local prefix = "MP" .. util.get_char_slot() .. "_"
local stat_ptr = memory.alloc(4)
---@return integer|nil
local function GetStatInt(stat)
if STATS_STAT_GET_INT(util.joaat(stat), stat_ptr, -1) then
    return memory.read_int(stat_ptr)
else
    --util.log("Failed to get stat " .. stat)
end
return nil
end

local function GetStatBool(stat)
if STATS_STAT_GET_BOOL(util.joaat(stat), stat_ptr, -1) then
    return memory.read_bool(stat_ptr)
else
    --util.log("Failed to get stat " .. stat)
end
return nil
end

local function GetPackedStatBool(stat)
return STATS_GET_PACKED_STAT_BOOL_CODE(stat, util.get_char_slot())
end
local script = setmetatable({}, {__index = _G})

script.money_options = {
"50,000,000", "100,000,000", "150,000,000", "200,000,000",
"250,000,000", "300,000,000", "350,000,000", "400,000,000",
"450,000,000", "500,000,000", "550,000,000", "600,000,000",
"650,000,000", "700,000,000", "750,000,000", "800,000,000", 
"850,000,000", "900,000,000", "950,000,000", "1,000,000,000"
}


local nv = native_invoker
local ENTITY_GET_ENTITY_COORDS                                          = function(entity,alive)nv.begin_call();nv.push_arg_int(entity);nv.push_arg_bool(alive);nv.end_call("3FEF770D40960D5A");return nv.get_return_value_vector3();end
local PLAYER_PLAYER_PED_ID                                              = function()nv.begin_call();nv.end_call("D80958FC74E988A6");return nv.get_return_value_int();end
local SYSTEM_START_NEW_SCRIPT                                           = function(scriptName,stackSize)nv.begin_call();nv.push_arg_string(scriptName);nv.push_arg_int(stackSize);nv.end_call("E81651AD79516E48");return nv.get_return_value_int();end
local SCRIPT_GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH    = function(scriptHash)nv.begin_call();nv.push_arg_int(scriptHash);nv.end_call("2C83A9DA6BFFC4F9");return nv.get_return_value_int();end
local SCRIPT_DOES_SCRIPT_EXIST                                          = function(scriptName)nv.begin_call();nv.push_arg_string(scriptName);nv.end_call("FC04745FBE67C19A");return nv.get_return_value_bool();end
local SCRIPT_REQUEST_SCRIPT                                             = function(scriptName)nv.begin_call();nv.push_arg_string(scriptName);nv.end_call("6EB5F71AA68F2E8E");end
local SCRIPT_HAS_SCRIPT_LOADED                                          = function(scriptName)nv.begin_call();nv.push_arg_string(scriptName);nv.end_call("E6CC9F3BA0FB9EF1");return nv.get_return_value_bool();end
local SCRIPT_SET_SCRIPT_AS_NO_LONGER_NEEDED                             = function(scriptName)nv.begin_call();nv.push_arg_string(scriptName);nv.end_call("C90D2DCACD56184C");end
local STATS_STAT_GET_INT                                                = function(statHash,outValue,p2)nv.begin_call();nv.push_arg_int(statHash);nv.push_arg_pointer(outValue);nv.push_arg_int(p2);nv.end_call("767FBC2AC802EF3D");return nv.get_return_value_bool();end
local STATS_SET_PACKED_STAT_BOOL_CODE                                   = function(index,value,characterSlot)native_invoker.begin_call();native_invoker.push_arg_int(index);native_invoker.push_arg_bool(value);native_invoker.push_arg_int(characterSlot);native_invoker.end_call("DB8A58AEAA67CD07");end
local NETSHOPPING_NET_GAMESERVER_TRANSACTION_IN_PROGRESS                = function()native_invoker.begin_call()native_invoker.end_call_2(0x613F125BA3BD2EB9)return native_invoker.get_return_value_bool();end

-- function SET_PACKED_STAT_BOOL_CODE(stat, value)
--     STATS.SET_PACKED_STAT_BOOL_CODE(stat, value, util.get_char_slot())
-- end


local function SetStatInt(stat, value)
if STATS_STAT_SET_INT(util.joaat(stat), value, true) then
    return true
else
    --util.log("Failed to set stat "..stat.." to "..value)
end
return false
end

local function SetStatBool(stat, value)
if STATS_STAT_SET_BOOL(util.joaat(stat), value, true) then
    return true
else
    --util.log("Failed to set stat "..stat.." to "..value)
end
return false
end

local function GetGlobalInt(address)
return memory.read_int(memory.script_global(address))
end

local function GetGlobalFloat(address)
return memory.read_float(memory.script_global(address))
end

local function SetGlobalInt(address, value)
memory.write_int(memory.script_global(address), value)
end

local function SetGlobalFloat(address, value)
memory.write_float(memory.script_global(address), value)
end

local function SetGlobalBits(address, ...)
local value = GetGlobalInt(address)
if value then
    return SetGlobalInt(address, SetBits(value, ...))
end
end
slomama = util.get_char_slot()
function SQUIDGAME(name, value)
if type(name) == "number" then
    --
end

local stat = util.joaat("MP" .. slomama .. "_" .. name)

-- set the stat
if STATS.STAT_SET_INT(stat, value, true) then
    return true -- return true if the function succeeds
else
    return false -- return false if the function fails
end
end


local function GetLocalInt(script_str, script_local)
local addr = memory.script_local(script_str, script_local)
return addr ~= 0 and memory.read_int(addr) or nil
end

local function GetLocalFloat(script_str, script_local)
local addr = memory.script_local(script_str, script_local)
return addr ~= 0 and memory.read_float(addr) or nil
end

local function GetLocalString(script_str, script_local)
local addr = memory.script_local(script_str, script_local)
return addr ~= 0 and memory.read_string(addr) or nil
end

local function ClearGlobalBits(address, ...)
local value = GetGlobalInt(address)
if value then
    return SetGlobalInt(address, ClearBits(value, ...))
end
end

local function SetLocalInt(script_str, script_local, value)
local addr = memory.script_local(script_str, script_local)
if addr ~= 0 then
    memory.write_int(addr, value)
end
return addr ~= 0
end

local function SetLocalFloat(script_str, script_local, value)
local addr = memory.script_local(script_str, script_local)
if addr ~= 0 then
    memory.write_float(addr, value)
end
return addr ~= 0
end

local function SetLocalString(script_str, script_local, value)
local addr = memory.script_local(script_str, script_local)
if addr ~= 0 then
    memory.write_string(addr, value)
end
return addr ~= 0
end

local function SetLocalBits(script_str, script_local, ...)
local value = GetLocalInt(script_str, script_local)
if value then
    return SetLocalInt(script_str, script_local, SetBits(value, ...))
end
end

local function ClearLocalBits(script_str, script_local, ...)
local value = GetLocalInt(script_str, script_local)
if value then
    return SetLocalInt(script_str, script_local, ClearBits(value, ...))
end
end



local function NOTIFY(Message)
util.toast(Message)
end

function FORCE_CLOUD_SAVE()
STATS.STAT_SAVE(0, 0, 3, 0) -- menu.trigger_commands("forcecloudsave")와 동일, https://github.com/jonaaa20/RecoverySuite
util.yield(1500)
util.arspinner_enable()
util.yield(4500)
util.arspinner_disable()
end
function IS_MPPLY(Stat)
local Stats = {
"MP_PLAYING_TIME",
}

for i = 1, #Stats do
if Stat == Stats[i] then
    return true
end
end

if string.find(Stat, "MPPLY_") then
return true
else
return false
end
end
function ADD_MP_INDEX(Stat)
if not IS_MPPLY(Stat) then
Stat = "MP" .. util.get_char_slot() .. "_" .. Stat
end
return Stat
end


local function MP_Index()
local MP_IPTR = memory.alloc(2)
STATS.STAT_GET_INT(util.joaat("MPPLY_LAST_MP_CHAR"), MP_IPTR, -1)
return "MP"..memory.read_int(MP_IPTR).."_"
end

function STAT_SET_INT(Stat, Value)
STATS.STAT_SET_INT(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end
function STAT_SET_FLOAT(Stat, Value)
STATS.STAT_SET_FLOAT(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end
function STAT_SET_BOOL(Stat, Value)
STATS.STAT_SET_BOOL(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end
function STAT_SET_STRING(Stat, Value)
STATS.STAT_SET_STRING(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end
function STAT_SET_DATE(Stat, Year, Month, Day, Hour, Min)
local DatePTR = memory.alloc(7*8) -- Thanks to help memory stuffs, aaronlink127#0127
memory.write_int(DatePTR, Year)
memory.write_int(DatePTR+8, Month)
memory.write_int(DatePTR+16, Day)
memory.write_int(DatePTR+24, Hour)
memory.write_int(DatePTR+32, Min)
memory.write_int(DatePTR+40, 0) -- Second
memory.write_int(DatePTR+48, 0) -- Millisecond
STATS.STAT_SET_DATE(util.joaat(ADD_MP_INDEX(Stat)), DatePTR, 7, true)
end

function STAT_SET_PACKED_BOOL(Stat, Value)
STATS._SET_PACKED_STAT_BOOL(Stat, Value, util.get_char_slot())
end
function STAT_SET_INCREMENT(Stat, Value)
STATS.STAT_INCREMENT(util.joaat(ADD_MP_INDEX(Stat)), Value, true)
end

function STAT_GET_INT(Stat)
local IntPTR = memory.alloc_int()
STATS.STAT_GET_INT(util.joaat(ADD_MP_INDEX(Stat)), IntPTR, -1)
return memory.read_int(IntPTR)
end
function STAT_GET_FLOAT(Stat)
local FloatPTR = memory.alloc_int()
STATS.STAT_GET_FLOAT(util.joaat(ADD_MP_INDEX(Stat)), FloatPTR, -1)
return tonumber(string.format("%.3f", memory.read_float(FloatPTR)))
end
function STAT_GET_BOOL(Stat)
if STAT_GET_INT(Stat) == 0 then
return "false"
elseif STAT_GET_INT(Stat) == 1 then
return "true"
else
return "STAT_UNKNOWN"
end 
end


function STAT_GET_STRING(Stat)
return STATS.STAT_GET_STRING(util.joaat(ADD_MP_INDEX(Stat)), -1)
end
function STAT_GET_DATE(Stat, Sort)
local DatePTR = memory.alloc(7*8)
STATS.STAT_GET_DATE(util.joaat(ADD_MP_INDEX(Stat)), DatePTR, 7, true)
local Add = 0
if Sort == "Year" then
Add = 0
elseif Sort == "Month" then
Add = 8
elseif Sort == "Day" then
Add = 16
elseif Sort == "Hour" then
Add = 24
elseif Sort == "Min" then
Add = 32
end
return memory.read_int(DatePTR+Add)
end

function SET_INT_GLOBAL(Global, Value)
memory.write_int(memory.script_global(Global), Value)
end
function SET_FLOAT_GLOBAL(Global, Value)
memory.write_float(memory.script_global(Global), Value)
end

function GET_INT_GLOBAL(Global)
return memory.read_int(memory.script_global(Global))
end

function SET_PACKED_INT_GLOBAL(StartGlobal, EndGlobal, Value)
for i = StartGlobal, EndGlobal do
SET_INT_GLOBAL(262145 + i, Value)
end
end

function SET_INT_LOCAL(Script, Local, Value)
if memory.script_local(Script, Local) ~= 0 then
memory.write_int(memory.script_local(Script, Local), Value)
end
end
function SET_FLOAT_LOCAL(Script, Local, Value)
if memory.script_local(Script, Local) ~= 0 then
memory.write_float(memory.script_local(Script, Local), Value)
end
end

function GET_INT_LOCAL(Script, Local)
if memory.script_local(Script, Local) ~= 0 then
local Value = memory.read_int(memory.script_local(Script, Local))
if Value ~= nil then
    return Value
end
end
end

util.keep_running()

local function STAT_SET_INT(Hash, Value)
STATS.STAT_SET_INT(util.joaat("MP" .. util.get_char_slot() .. "_" .. Hash), Value, true)
end
local function STAT_SET_INT_MPPLY(Hash, Value)
STATS.STAT_SET_INT(util.joaat(Hash), Value, true)
end

local function SET_INT_GLOBAL(Global, Value)
memory.write_int(memory.script_global(Global), Value)
end
local function SET_INT_LOCAL(Script, Local, Value)
if memory.script_local(Script, Local) ~= 0 then
memory.write_int(memory.script_local(Script, Local), Value)
end
end

local function GET_INT_GLOBAL(Global)
return memory.read_int(memory.script_global(Global))
end

local function STAT_SET_PACKED_BOOL(Stat, Value)
STATS._SET_PACKED_STAT_BOOL(Stat, Value, util.get_char_slot())
end

function IA_MENU_OPEN()
PAD._SET_CONTROL_NORMAL(0, 244, 1)
util.yield(100)
end
function IA_MENU_UP(Num)
for i = 1, Num do
PAD._SET_CONTROL_NORMAL(0, 172, 1)
util.yield(100)
end
end
function IA_MENU_DOWN(Num)
for i = 1, Num do
PAD._SET_CONTROL_NORMAL(0, 173, 1)
util.yield(100)
end
end
function IA_MENU_ENTER(Num)
for i = 1, Num do
PAD._SET_CONTROL_NORMAL(0, 176, 1)
util.yield(100)
end
end

local function simulate_a_mouse_click()
PAD.ENABLE_CONTROL_ACTION(2, 237, true)
PAD._SET_CONTROL_NORMAL(2, 237, 1.0)
util.yield(25)
PAD._SET_CONTROL_NORMAL(2, 237, 0.0)
end
local function simulate_an_enter_press_1()
PAD.ENABLE_CONTROL_ACTION(0, 176, true)
PAD._SET_CONTROL_NORMAL(0, 176, 1.0)
util.yield(25)
PAD._SET_CONTROL_NORMAL(0, 176, 0.0)
end
local function simulate_an_enter_press_2()
PAD.ENABLE_CONTROL_ACTION(2, 176, true)
PAD._SET_CONTROL_NORMAL(2, 176, 1.0)
util.yield(25)
PAD._SET_CONTROL_NORMAL(2, 176, 0.0)
end

local positions = {
{x = 0.474922, y = 0.555133},--to select first nightclub 
{x = 0.363114, y = 0.729087}, --to enter purchase
{x = 0.318704, y = 0.918251}, --to choose to buy
{x = 0.782132, y = 0.912548},--to buy
{x = 0.708464, y = 0.911597},--to return to the map
{x = 0.465104, y = 0.452778},--to select 2nd nightclub
{x = 0.356250, y = 0.675000},--to enter purchase
{x = 0.318704, y = 0.918251},--to cw hoose to buy
{x = 0.782132, y = 0.912548},--to buy
{x = 0.708464, y = 0.708464}--to return
}


local positions_auto = {
{x = 0.68, y = 0.45},--to select first auto 
{x = 0.363114, y = 0.74087}, --to enter purchase
{x = 0.318704, y = 0.918251}, --to choose to buy
{x = 0.782132, y = 0.912548},--to buy
{x = 0.708464, y = 0.911597},--to return to the map
{x = 0.65, y = 0.48},--to select 2nd auto 
{x = 0.363114, y = 0.709087}, --to enter purchase
{x = 0.318704, y = 0.918251}, --to choose to buy
{x = 0.782132, y = 0.912548},--to buy
{x = 0.708464, y = 0.911597},--to return to the map
}
local positions_hungar = {
{x = 0.48, y = 1},--to select first hangar 
{x = 0.363114, y = 0.74087}, --to enter purchase
{x = 0.318704, y = 0.918251}, --to choose to buy
{x = 0.782132, y = 0.912548},--to buy
{x = 0.708464, y = 0.911597},--to return to the map
{x = 0.455, y = 1},--to select 2nd hangar 
{x = 0.363114, y = 0.709087}, --to enter purchase
{x = 0.318704, y = 0.918251}, --to choose to buy
{x = 0.782132, y = 0.912548},--to buy
{x = 0.708464, y = 0.911597},--to return to the map
}
local positions_arcade = {
{x = 0.464922, y = 0.36},--to select first arcade 
{x = 0.363114, y = 0.75}, --to enter purchase
{x = 0.318704, y = 0.918251}, --to choose to buy
{x = 0.782132, y = 0.912548},--to buy
{x = 0.708464, y = 0.911597},--to return to the map
{x = 0.534922, y = 0.249},--to select 2nd arcade 
{x = 0.363114, y = 0.75}, --to enter purchase
{x = 0.318704, y = 0.918251}, --to choose to buy
{x = 0.782132, y = 0.912548},--to buy
{x = 0.708464, y = 0.911597},--to return to the map
}

---

FIRST = menu.divider(menu.my_root(), "GTA5.WTF | 메인 메뉴")

local MONEY_OPTIONS = menu.list(menu.my_root(), "돈 옵션", {}, "", function() end)


menu.divider(MONEY_OPTIONS, ScriptName .. "   |   돈 추가")

ADD_1250K = menu.action(MONEY_OPTIONS, "125달러 추가", {}, "125달러를 추가합니다. 22초마다 사용해주세요!", function()
menu.set_menu_name(ADD_1250K, "125달러 추가, 상태: 추가 중")
SET_INT_GLOBAL(1961347, 1)
util.yield(250)
SET_INT_GLOBAL(1961347, 0)
util.yield(250)
menu.set_menu_name(ADD_1250K, "125달러 추가, 상태: 추가 완료")
SET_INT_GLOBAL(1961347, 2)
util.yield(250)
SET_INT_GLOBAL(1961347, 0)
util.yield(250)
menu.set_menu_name(ADD_1250K, "125달러 추가")

end)


local function kill_appsecuroserv()
util.spoof_script("appsecuroserv", SCRIPT.TERMINATE_THIS_THREAD)
PLAYER.SET_PLAYER_CONTROL(players.user(), true, 0)
PAD.ENABLE_ALL_CONTROL_ACTIONS(0)
PAD.ENABLE_CONTROL_ACTION(2, 1, true)
PAD.ENABLE_CONTROL_ACTION(2, 2, true)
PAD.ENABLE_CONTROL_ACTION(2, 187, true)
PAD.ENABLE_CONTROL_ACTION(2, 188, true)
PAD.ENABLE_CONTROL_ACTION(2, 189, true)
PAD.ENABLE_CONTROL_ACTION(2, 190, true)
PAD.ENABLE_CONTROL_ACTION(2, 199, true)
PAD.ENABLE_CONTROL_ACTION(2, 200, true)
ENTITY.FREEZE_ENTITY_POSITION(players.user_ped(), false)
end


menu.action(MONEY_OPTIONS, "판매화면 강제 종료", {}, "스패셜 패키지 화면이 멈췄을때 눌러주시면 화면이 강제로 종료됩니다.", function(on)
kill_appsecuroserv()
end)


local function IA_MENU_OPEN_OR_CLOSE()
PAD._SET_CONTROL_NORMAL(0, 244, 1)
util.yield(200)
end

MONEY_REMOVE = menu.text_input(MONEY_OPTIONS, "돈 제거", {"removeMoney"}, "0~20억까지 원하시는 값 만큼 입력해주시면 자동으로 제거됩니다 !!", function(value)
SET_INT_GLOBAL(262145 + 20498, value) -- -156036296, https://www.unknowncheats.me/forum/3276092-post3.html
STAT_SET_PACKED_BOOL(15382, true) -- Makes able to buy the Ballistic Armor
STAT_SET_PACKED_BOOL(9461, true) -- Makes you have the Ballistic Armor

menu.trigger_commands("nopimenugrey on")
if util.is_interaction_menu_open() then
IA_MENU_OPEN_OR_CLOSE()
end
SET_INT_GLOBAL(2710114, 85) -- Renders Ballistic Equipment Services screen of the Interaction Menu
IA_MENU_OPEN_OR_CLOSE()
IA_MENU_ENTER(1)
end)







---
menu.divider(MONEY_OPTIONS, ScriptName .. "   |   돈 반복")

local MONEY_AMOUNT = 0
LOOP_1250K = menu.toggle(MONEY_OPTIONS, "$125만 반복 [오비탈]", {}, "25초 마다 125만 달러를 추가합니다.\n\n다른 돈 옵션과 같이 사용할 경우 문제가 발생 할수 있습니다.", function(Toggle)
Money_Loop = Toggle

if Money_Loop then
menu.trigger_commands("transclose on")
end

while Money_Loop do
if SetMoney ~= nil then
    if SetMoney > players.get_bank(players.user()) then
        menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $50만 추가 중")
        SET_INT_GLOBAL(1961347, 1)
        util.yield(500)
        SET_INT_GLOBAL(1961347, 0)
        util.yield(500)
        menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $50만 추가 완료")
        NOTIFY("$50만 달러를 추가하였습니다.")
        util.yield(1000)
        menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $75만 추가 대기 중")
        util.yield(10000)
        menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $75만 추가 중")
        SET_INT_GLOBAL(1961347, 2)
        util.yield(500)
        SET_INT_GLOBAL(1961347, 0)
        util.yield(500)
        menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $75만 추가 완료")
        NOTIFY("$75만 달러를 추가하였습니다.")
        util.yield(1000)
        menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: 총 $125만 추가 완료")
        util.yield(8000)

        if Money_Loop then
            menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $50만 추가 대기 중")
            MONEY_AMOUNT = MONEY_AMOUNT + 125
            menu.trigger_commands("prloopstatus")
            util.yield(1000)
        else
            menu.set_menu_name(LOOP_1250K, "$125만 반복 [오비탈]")
            return 
        end
    else
        menu.set_menu_name(LOOP_1250K, "$125만 반복 [오비탈]")
        return
    end
else
    menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $50만 추가 중")
    SET_INT_GLOBAL(1961347, 1)
    util.yield(500)
    SET_INT_GLOBAL(1961347, 0)
    util.yield(500)
    menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $50만 추가 완료")
    NOTIFY("$50만 달러를 추가하였습니다.")
    util.yield(1000)
    menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $75만 추가 대기 중")
    util.yield(10000)
    menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $75만 추가 중")
    SET_INT_GLOBAL(1961347, 2)
    util.yield(500)
    SET_INT_GLOBAL(1961347, 0)
    util.yield(500)
    menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $75만 추가 완료")
    NOTIFY("$75만 달러를 추가하였습니다.")
    util.yield(1000)
    menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: 총 $125만 추가 완료")
    util.yield(8000)

    if Money_Loop then
        menu.set_menu_name(LOOP_1250K, "$125만 반복, 상태: $50만 추가 대기 중")
        MONEY_AMOUNT = MONEY_AMOUNT + 125
        menu.trigger_commands("prloopstatus")
        util.yield(1000)
    else
        menu.set_menu_name(LOOP_1250K, "$125만 반복 [오비탈]")
        menu.set_menu_name(LOOP_STATUS, "획득한 돈: $0")
        return
    end
end

util.yield()
end

while not Money_Loop do
return
end
end)




function trigger_transaction(hash, amount)
SET_INT_GLOBAL(4537212+ 1, 2147483646)
SET_INT_GLOBAL(4537212+ 7, 2147483647)
SET_INT_GLOBAL(4537212+ 6, 0)
SET_INT_GLOBAL(4537212+ 5, 0)
SET_INT_GLOBAL(4537212+ 3, hash)
SET_INT_GLOBAL(4537212+ 2, amount)
SET_INT_GLOBAL(4537212,2)
end



menu.toggle_loop(MONEY_OPTIONS, "$5000 돈 반복 [카지노]", {}, "해당 옵션은 정지 확률이 높습니다.\n\n사용에 주의 해주세요.", function()
SET_INT_GLOBAL(1963515, 1)
util.yield(3000)
end)

menu.toggle_loop(MONEY_OPTIONS, "$100만 반복", {}, "스텔스 머니 방식으로 돈을 추가합니다.\n\n다른 돈 옵션과 함께 사용하실 경우 오류가 발생 할수도있습니다.", function()
if (NETSHOPPING_NET_GAMESERVER_TRANSACTION_IN_PROGRESS() == false) then
trigger_transaction(0x615762F1, 1000000)
util.yield(10)
end
end)






local ENTITY_SET_ENTITY_COORDS_NO_OFFSET                                = function(entity,xPos,yPos,zPos,xAxis,yAxis,zAxis)nv.begin_call();nv.push_arg_int(entity);nv.push_arg_float(xPos);nv.push_arg_float(yPos);nv.push_arg_float(zPos);nv.push_arg_bool(xAxis);nv.push_arg_bool(yAxis);nv.push_arg_bool(zAxis);nv.end_call("239A3351AC1DA385");end

local function SetEntityCoords(entity, coords)
ENTITY_SET_ENTITY_COORDS_NO_OFFSET(entity, coords.x, coords.y, coords.z, false, false, false)
end

menu.toggle_loop(MONEY_OPTIONS, "$30만 반복 [나이트클럽]", {}, "$30만을 5초마다 반복합니다.\n\n나이트 클럽을 구매후, 금고 앞에서 사용해주세요.", function()
SET_INT_GLOBAL(262145 + 24253, 300000) -- -576224669
SET_INT_GLOBAL(262145 + 24257, 300000) -- 255326369
STAT_SET_INT("CLUB_POPULARITY", 1000)
STAT_SET_INT("CLUB_PAY_TIME_LEFT", -1)
util.yield(5000)
end, function()
SET_INT_GLOBAL(262145 + 24253, 50000)
SET_INT_GLOBAL(262145 + 24257, 250000)
end)

menu.action(MONEY_OPTIONS, "금고로 순간이동", {}, "금고 바로 앞으로 이동합니다. 건물안으로 들어간후 사용해주세요.", function()
SetEntityCoords(PLAYER_PLAYER_PED_ID(), {x = -1615.8475, y = -3015.8586, z = -75.205})
end)

menu.toggle_loop(MONEY_OPTIONS, "$20만 반복 [아케이드]", {}, "$20만을 5초마다 반복합니다.\n\n아케이드를 구매후, 금고안에서 사용해주세요.", function()
SET_INT_GLOBAL(262145 + 29527, 200000) -- 1450432366
SET_INT_GLOBAL(262145 + 29528, 200000) -- -268179742
SET_INT_GLOBAL(262145 + 29529, 200000) -- 1798069290
SET_INT_GLOBAL(262145 + 29530, 200000) -- 970148074
STAT_SET_INT("ARCADE_PAY_TIME_LEFT", -1)
util.yield(5000)
end, function()
SET_INT_GLOBAL(262145 + 29527, 100000)
SET_INT_GLOBAL(262145 + 29528, 5000)
SET_INT_GLOBAL(262145 + 29529, 200)
SET_INT_GLOBAL(262145 + 29530, 250)
end)

menu.toggle_loop(MONEY_OPTIONS, "$5만 반복 [사무소]", {}, "$5만을 30초마다 반복합니다.\n\n사무소를 구매후, 금고안에서 사용해주세요.", function()
SET_INT_GLOBAL(262145 + 29537, 300000) -- 1899222198
SET_INT_GLOBAL(262145 + 29538, 300000) -- 1899222198 -1121498191
STAT_SET_INT("FIXER_PASSIVE_PAY_TIME_LEFT", -1)
util.yield(30000)
end, function()
SET_INT_GLOBAL(262145 + 29537, 250000)
SET_INT_GLOBAL(262145 + 29538, 20000)
end)

---







---

---





---

--








local RANKS = menu.list(menu.my_root(), "랭크 옵션", {}, "랭크", function() end)

function CLICK_KEYBOARD(key, num) -- https://docs.fivem.net/docs/game-references/controls/
for i = 1, num do
PAD.SET_CONTROL_VALUE_NEXT_FRAME(0, key, 1)
util.yield(200)
end
end

function CP_PRESS_ENTER(num)
CLICK_KEYBOARD(201, num)
end

menu.divider(RANKS, ScriptName .. "   |   랭크")

menu.slider(RANKS, "랭크 입력", {"rankset"}, "원하는 랭크를 입력하세요.", 1, 8000, 1, 1, function(Value)
SetRank = Value
end)

SET_RANK = menu.action(RANKS, "랭크 설정", {"changerank"}, "자동으로 새 초대 세션을 생성하여 랭크를 바꿔줍니다.\n\n랭크를 자유자재로 설정하는 것이 가능합니다.", function()
menu.set_menu_name(SET_RANK, "랭크 설정: " .. SetRank .. ", 상태: 부가 설정 진행중")
util.yield("2000")
menu.trigger_commands("seamless on")
menu.trigger_commands("skipswoopdown on")

menu.set_menu_name(SET_RANK, "랭크 설정: " .. SetRank .. ", 상태: 설정 완료")
menu.trigger_commands("setrank " .. SetRank)
util.yield(500)
menu.set_menu_name(SET_RANK, "랭크 설정: " .. SetRank .. ", 상태: 초대 세션 생성 중")
menu.trigger_commands("go solo")

while util.is_session_started() do
menu.set_menu_name(SET_RANK, "랭크 설정: " .. SetRank .. ", 상태: 모두 완료")

break
end



util.yield(2000)
menu.set_menu_name(SET_RANK, "랭크 설정")
util.show_corner_help("클라우드 저장하고 세션 바꾸는걸 추천!")



util.yield(2000)
menu.trigger_commands("seamless off")
menu.trigger_commands("skipswoopdown off")
end)


menu.divider(RANKS, ScriptName .." | 인스턴트 체인저")

menu.action(RANKS, "LV 1", {}, "", function()
STAT_SET_INT("CHAR_XP_FM", 0)
STATS.STAT_INCREMENT(util.joaat("MPPLY_GLOBALXP"), 0)
menu.trigger_commands("fcs")
end)

menu.action(RANKS, "LV 120", {}, "", function()
STAT_SET_INT("CHAR_XP_FM", 2165850)
STATS.STAT_INCREMENT(util.joaat("MPPLY_GLOBALXP"), 2165850)
menu.trigger_commands("fcs")
end)

menu.action(RANKS, "LV 999", {}, "", function()
STAT_SET_INT("CHAR_XP_FM", 47478300)
STATS.STAT_INCREMENT(util.joaat("MPPLY_GLOBALXP"), 47478300)
menu.trigger_commands("fcs")
end)

---

---

local TOOLS = menu.list(menu.my_root(), "기타 옵션", {}, "잠금 해제 | 클라우드 저장", function() end)

menu.divider(TOOLS, ScriptName .. "   |   기타")





---

---




UNLOCK_ALL = menu.action(TOOLS, "모두 잠금 해제", {"firstunlock"}, "모든 것을 잠금 해제하고, 모든 도전 과제를 잠금해제 하고 여러 컷신을 스킵합니다", function()

menu.set_menu_name(UNLOCK_ALL, "모두 잠금 해제, 상태: 도전 , 컷신 해제 중")

STATS_SET_PACKED_STAT_BOOL_CODE(18161, true)
STATS_SET_PACKED_STAT_BOOL_CODE(22067, true)
STATS_SET_PACKED_STAT_BOOL_CODE(22068, true)


mpx = MP_Index()
STAT_SET_BOOL("MPPLY_MELEECHLENGECOMPLETED", true)
STAT_SET_BOOL("MPPLY_HEADSHOTCHLENGECOMPLETED", true)
STAT_SET_BOOL("MPPLY_NAVYREVOLVERCOMPLETED", true)
SET_INT_GLOBAL(104355, 90) 
STAT_SET_INT("FM_ACT_PHN", -1)
STAT_SET_INT("FM_ACT_PH2", -1)
STAT_SET_INT("FM_ACT_PH3", -1)
STAT_SET_INT("FM_ACT_PH4", -1)
STAT_SET_INT("FM_ACT_PH5", -1)
STAT_SET_INT("FM_VEH_TX1", -1)
STAT_SET_INT("FM_ACT_PH6", -1)
STAT_SET_INT("FM_ACT_PH7", -1)
STAT_SET_INT("FM_ACT_PH8", -1)
STAT_SET_INT("FM_ACT_PH9", -1)
STAT_SET_INT("FM_CUT_DONE", -1)
STAT_SET_INT("FM_CUT_DONE_2", -1)

menu.trigger_commands("unlockresearch")

STAT_SET_INT("CHAR_ABILITY_1_UNLCK", -1)
STAT_SET_INT("CHAR_ABILITY_2_UNLCK", -1)
STAT_SET_INT("CHAR_ABILITY_3_UNLCK", -1)
STAT_SET_INT("CHAR_FM_ABILITY_1_UNLCK", -1)
STAT_SET_INT("CHAR_FM_ABILITY_2_UNLCK", -1)
STAT_SET_INT("CHAR_FM_ABILITY_3_UNLCK", -1)

SET_INT_GLOBAL(114054 + 5, 7500)
SET_INT_GLOBAL(114054 + 10, 7500)
SET_INT_GLOBAL(114054 + 15, 7500)
SET_INT_GLOBAL(114054 + 20, 7500)
SET_INT_GLOBAL(114054 + 25, 7500)
SET_INT_GLOBAL(114054 + 30, 7500)
SET_INT_GLOBAL(114054 + 35, 7500)


STAT_SET_INT_MPPLY(mpx .. "FM_ACT_PHN", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_ACT_PH2", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_ACT_PH3", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_ACT_PH4", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_ACT_PH5", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_VEH_TX1", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_ACT_PH6", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_ACT_PH7", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_ACT_PH8", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_ACT_PH9", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_CUT_DONE", -1)
STAT_SET_INT_MPPLY(mpx .. "FM_CUT_DONE_2", -1)
STAT_SET_INT("AWD_CONTRACTOR", 50)
STAT_SET_INT("AWD_COLD_CALLER", 50)
STAT_SET_INT("AWD_PRODUCER", 60)
STAT_SET_INT("FIXERTELEPHONEHITSCOMPL", 10)
STAT_SET_INT("PAYPHONE_BONUS_KILL_METHOD", 10)
STAT_SET_INT("FIXER_COUNT", 501)
STAT_SET_INT("FIXER_SC_VEH_RECOVERED", 501)
STAT_SET_INT("FIXER_SC_VAL_RECOVERED", 501)
STAT_SET_INT("FIXER_SC_GANG_TERMINATED", 501)
STAT_SET_INT("FIXER_SC_VIP_RESCUED", 501)
STAT_SET_INT("FIXER_SC_ASSETS_PROTECTED", 501)
STAT_SET_INT("FIXER_SC_EQ_DESTROYED", 501)
STAT_SET_INT("FIXER_EARNINGS", 300000)
STAT_SET_BOOL("AWD_TEEING_OFF", true)
STAT_SET_BOOL("AWD_PARTY_NIGHT", true)
STAT_SET_BOOL("AWD_BILLIONAIRE_GAMES", true)
STAT_SET_BOOL("AWD_HOOD_PASS", true)
STAT_SET_BOOL("AWD_STUDIO_TOUR", true)
STAT_SET_BOOL("AWD_DONT_MESS_DRE", true)
STAT_SET_BOOL("AWD_BACKUP", true)
STAT_SET_BOOL("AWD_SHORTFRANK_1", true)
STAT_SET_BOOL("AWD_SHORTFRANK_2", true)
STAT_SET_BOOL("AWD_SHORTFRANK_3", true)
STAT_SET_BOOL("AWD_CONTR_KILLER", true)
STAT_SET_BOOL("AWD_DOGS_BEST_FRIEND", true)
STAT_SET_BOOL("AWD_MUSIC_STUDIO", true)
STAT_SET_BOOL("AWD_SHORTLAMAR_1", true)
STAT_SET_BOOL("AWD_SHORTLAMAR_2", true)
STAT_SET_BOOL("AWD_SHORTLAMAR_3", true)
STAT_SET_BOOL("BS_FRANKLIN_DIALOGUE_0", true)
STAT_SET_BOOL("BS_FRANKLIN_DIALOGUE_1", true)
STAT_SET_BOOL("BS_FRANKLIN_DIALOGUE_2", true)
STAT_SET_BOOL("BS_IMANI_D_APP_SETUP", true)
STAT_SET_BOOL("BS_IMANI_D_APP_STRAND", true)
STAT_SET_BOOL("BS_IMANI_D_APP_PARTY", true)
STAT_SET_BOOL("BS_IMANI_D_APP_PARTY_2", true)
STAT_SET_BOOL("BS_IMANI_D_APP_PARTY_F", true)
STAT_SET_BOOL("BS_IMANI_D_APP_BILL", true)
STAT_SET_BOOL("BS_IMANI_D_APP_BILL_2", true)
STAT_SET_BOOL("BS_IMANI_D_APP_BILL_F", true)
STAT_SET_BOOL("BS_IMANI_D_APP_HOOD", true)
STAT_SET_BOOL("BS_IMANI_D_APP_HOOD_2", true)
STAT_SET_BOOL("BS_IMANI_D_APP_HOOD_F", true)
STAT_SET_INT_MPPLY(mpx .. "CHAR_ABILITY_1_UNLCK", -1)
STAT_SET_INT_MPPLY(mpx .. "CHAR_ABILITY_2_UNLCK", -1)
STAT_SET_INT_MPPLY(mpx .. "CHAR_ABILITY_3_UNLCK", -1)
STAT_SET_INT_MPPLY(mpx .. "CHAR_FM_ABILITY_1_UNLCK", -1)
STAT_SET_INT_MPPLY(mpx .. "CHAR_FM_ABILITY_2_UNLCK", -1)
STAT_SET_INT_MPPLY(mpx .. "CHAR_FM_ABILITY_3_UNLCK", -1)
SET_INT_GLOBAL(262145 + 33114, 1) -- M16 무기 잠금해제
SET_INT_GLOBAL(104355, 90) -- Up-N-Atomizer
STAT_SET_INT("CAS_HEIST_FLOW", 4096) -- Ceramic Pistol
STAT_SET_MASKED_INT("GANGOPSPSTAT_INT102", 3, 24) -- Got this from random Kiddions Lua on Discord
STAT_SET_MASKED_INT("MP_NGDLCPSTAT_INT0", 5, 16) -- Got this from random Kiddions Lua on Discord
STAT_SET_BOOL("MPPLY_MELEECHLENGECOMPLETED", true)
STAT_SET_BOOL("MPPLY_HEADSHOTCHLENGECOMPLETED", true)
STAT_SET_BOOL("MPPLY_NAVYREVOLVERCOMPLETED", true)



util.yield(2000)


menu.set_menu_name(UNLOCK_ALL, "모두 잠금 해제, 상태: 트리거 커맨드 해제 중")
menu.trigger_commands("unlockall")
menu.set_menu_name(UNLOCK_ALL, "모두 잠금 해제, 상태: 해제 완료")
NOTIFY("모두 잠금 해제가 완료되었습니다!")
util.yield(1000)
menu.set_menu_name(UNLOCK_ALL, "모두 잠금 해제")
util.show_corner_help("클라우드 저장 하시는걸 추천드립니다.")

end)

menu.action(TOOLS, "빠른 세션 변경", {"sessionfast"}, "",function()

menu.trigger_commands("seamless on")
menu.trigger_commands("skipswoopdown on")

menu.trigger_commands("go solo")
util.yield(3000)
menu.trigger_commands("seamless off")
menu.trigger_commands("skipswoopdown off")

NOTIFY("세션을 변경 했습니다.")



end)

CLOUD_SAVE = menu.action(TOOLS, "클라우드 강제 저장", {"rockstartsave"}, "락스타 클라우드에 현재 정보를 저장해 올바르게 저장되지 않는 것을 방지합니다.", function()
    for i = 1, 100, 1 do
        menu.trigger_commands("forcecloudsave")
        util.yield(1)  
    end
NOTIFY("클라우드 저장을 완료하였습니다")

end)


local STAT_EDITOR_READER = menu.list(TOOLS, ("통계수정기"), {}, "", function() end)

local PRESET_STAT_EDITOR = menu.list(STAT_EDITOR_READER, ("통계 수정기"), {}, "", function() end)

local PLAYTIME_EDITOR = menu.list(PRESET_STAT_EDITOR, ("플레이 시간"), {}, "", function() end)

menu.divider(PLAYTIME_EDITOR, ("방법"))

    IS_TIME_ADDING_METHOD = menu.toggle(PLAYTIME_EDITOR, ("플레이타임을 추가하는 방식"), {}, ("활성화: 기존 플레이 시간에 추가") .. "\n" .. ("- 기존 플레이타임에 더하는방법") .. "\n\n" .. ("비활성화: 플레이타임을 수정해버리기") .. "\n" .. ("- 말 그대로다 이새기야") .. "\n\n" .. ("중요 : 플레이 타임을 변경하는 방식은 한도가 낮지만 더하는 방식은 거의 무한합니다"), function() end)

---

menu.divider(PLAYTIME_EDITOR, ("수정하기"))

    PLAYTIME_DAY = menu.slider(PLAYTIME_EDITOR, ("일"), {"1"}, "", 0, 50000, 0, 1, function() end)
    PLAYTIME_HOUR = menu.slider(PLAYTIME_EDITOR, ("시간"), {"sibal"}, "", 0, 50000, 0, 1, function() end)
    PLAYTIME_MIN = menu.slider(PLAYTIME_EDITOR, ("분"), {"boon"}, "", 0, 50000, 0, 1, function() end)

---

menu.divider(PLAYTIME_EDITOR, ("stat 설정"))

    menu.action(PLAYTIME_EDITOR, ("총 플레이시간"), {}, "", function()
        if not menu.get_value(IS_TIME_ADDING_METHOD) then
            STAT_SET_INT("TOTAL_PLAYING_TIME", menu.get_value(PLAYTIME_DAY) * 86400000 + menu.get_value(PLAYTIME_HOUR) * 3600000 + menu.get_value(PLAYTIME_MIN) * 60000)
        else
            STAT_SET_INCREMENT("TOTAL_PLAYING_TIME", menu.get_value(PLAYTIME_DAY) * 86400000 + menu.get_value(PLAYTIME_HOUR) * 3600000 + menu.get_value(PLAYTIME_MIN) * 60000)
        end

        NOTIFY(("설정완료!") .. "\n\n" .. ("일") .. ": " .. menu.get_value(PLAYTIME_DAY) .. "\n" .. ("시간") .. ": " .. menu.get_value(PLAYTIME_HOUR) .. "\n" .. ("분") .. ": " .. menu.get_value(PLAYTIME_MIN))
        FORCE_CLOUD_SAVE()
    end)
    menu.action(PLAYTIME_EDITOR, ("온라인 플레이시간"), {}, "", function()
        if not menu.get_value(IS_TIME_ADDING_METHOD) then
            STAT_SET_INT("MP_PLAYING_TIME", menu.get_value(PLAYTIME_DAY) * 86400000 + menu.get_value(PLAYTIME_HOUR) * 3600000 + menu.get_value(PLAYTIME_MIN) * 60000)
        else
            STAT_SET_INCREMENT("MP_PLAYING_TIME", menu.get_value(PLAYTIME_DAY) * 86400000 + menu.get_value(PLAYTIME_HOUR) * 3600000 + menu.get_value(PLAYTIME_MIN) * 60000)
        end

        NOTIFY(("설정완료!") .. "\n\n" .. ("일") .. ": " .. menu.get_value(PLAYTIME_DAY) .. "\n" .. ("시간") .. ": " .. menu.get_value(PLAYTIME_HOUR) .. "\n" .. ("분") .. ": " .. menu.get_value(PLAYTIME_MIN))
        FORCE_CLOUD_SAVE()
    end)
---

---

local CASH_EDITOR = menu.list(PRESET_STAT_EDITOR, ("번돈 / 사용한돈"), {}, "", function() end)

menu.divider(CASH_EDITOR, ("stat 수정하기"))

    CASH_EDITOR_AMOUNT = menu.slider(CASH_EDITOR, ("현금 금액"), {"afsafe"}, "($)", INT_MIN, INT_MAX, 0, 10000, function() end)

---

menu.divider(CASH_EDITOR, ("stat 수정하기"))

    menu.action(CASH_EDITOR, ("총 벌어드린 금액"), {}, "", function()
        STAT_SET_INT("MPPLY_TOTAL_EVC", menu.get_value(CASH_EDITOR_AMOUNT))
        FORCE_CLOUD_SAVE()
    end)
    menu.action(CASH_EDITOR, ("총 소비한 금액"), {}, "", function()
        STAT_SET_INT("MPPLY_TOTAL_SVC", menu.get_value(CASH_EDITOR_AMOUNT))
        FORCE_CLOUD_SAVE()
    end)

---

menu.divider(CASH_EDITOR, ("자세한 설정"))

    menu.action(CASH_EDITOR, ("작업"), {}, "", function()
        STAT_SET_INT("MONEY_EARN_JOBS", menu.get_value(CASH_EDITOR_AMOUNT))
        FORCE_CLOUD_SAVE()
    end)
    menu.action(CASH_EDITOR, ("베팅"), {}, "", function()
        STAT_SET_INT("MONEY_EARN_BETTING", menu.get_value(CASH_EDITOR_AMOUNT))
        FORCE_CLOUD_SAVE()
    end)
    menu.action(CASH_EDITOR, ("차량 판매"), {}, "", function()
        STAT_SET_INT("MONEY_EARN_SELLING_VEH", menu.get_value(CASH_EDITOR_AMOUNT))
        FORCE_CLOUD_SAVE()
    end)
    menu.action(CASH_EDITOR, ("공유"), {}, "", function()
        STAT_SET_INT("MONEY_EARN_SHARED", menu.get_value(CASH_EDITOR_AMOUNT))
        FORCE_CLOUD_SAVE()
    end)

    menu.action(CASH_EDITOR, ("주은 돈"), {}, "", function()
        STAT_SET_INT("MONEY_EARN_PICKED_UP", menu.get_value(CASH_EDITOR_AMOUNT))
        FORCE_CLOUD_SAVE()
    end)
    menu.action(CASH_EDITOR, ("기타"), {}, "", function()
        STAT_SET_INT("MONEY_EARN_GOOD_SPORT", menu.get_value(CASH_EDITOR_AMOUNT))
        FORCE_CLOUD_SAVE()
    end)

---

---

--

---

---




---

function ADD_MP_INDEX(stat)
local Exceptions = {
"MP_CHAR_STAT_RALLY_ANIM",
"MP_CHAR_ARMOUR_1_COUNT",
"MP_CHAR_ARMOUR_2_COUNT",
"MP_CHAR_ARMOUR_3_COUNT",
"MP_CHAR_ARMOUR_4_COUNT",
"MP_CHAR_ARMOUR_5_COUNT",
}
for _, exception in pairs(Exceptions) do
if stat == exception then
return "MP" .. util.get_char_slot() .. "_" .. stat
end
end

if not string.contains(stat, "MP_") and not string.contains(stat, "MPPLY_") then
return "MP" .. util.get_char_slot() .. "_" .. stat
end
return stat
end

function STAT_SET_INT(stat, value)
STATS.STAT_SET_INT(util.joaat(ADD_MP_INDEX(stat)), value, true)
end
function STAT_SET_FLOAT(stat, value)
STATS.STAT_SET_FLOAT(util.joaat(ADD_MP_INDEX(stat)), value, true)
end
function STAT_SET_BOOL(stat, value)
STATS.STAT_SET_BOOL(util.joaat(ADD_MP_INDEX(stat)), value, true)
end
function STAT_SET_STRING(stat, value)
STATS.STAT_SET_STRING(util.joaat(ADD_MP_INDEX(stat)), value, true)
end
function STAT_SET_DATE(stat, year, month, day, hour, min)
local DatePTR = memory.alloc(8*7) -- Thanks for helping memory stuffs, aaronlink127#0127
memory.write_int(DatePTR, year)
memory.write_int(DatePTR+8, month)
memory.write_int(DatePTR+16, day)
memory.write_int(DatePTR+24, hour)
memory.write_int(DatePTR+32, min)
memory.write_int(DatePTR+40, 0) -- Seconds
memory.write_int(DatePTR+48, 0) -- Milliseconds
STATS.STAT_SET_DATE(util.joaat(ADD_MP_INDEX(stat)), DatePTR, 7, true)
end

function STAT_SET_MASKED_INT(stat, value1, value2)
STATS.STAT_SET_MASKED_INT(util.joaat(ADD_MP_INDEX(stat)), value1, value2, 8, true)
end
-- function SET_PACKED_STAT_BOOL_CODE(stat, value)
--     STATS.SET_PACKED_STAT_BOOL_CODE(stat, value, util.get_char_slot())
-- end
function STAT_INCREMENT(stat, value)
STATS.STAT_INCREMENT(util.joaat(ADD_MP_INDEX(stat)), value, true)
end


--- Settings


local IS_RELEASE_VERSION <const> = false
local IS_BETA_VERSION <const> = false
local IGNORE_VERSION_DIFFERENCE <const> = false
local THIS_RELEASE_VERSION <const> = "1.0.0"
local STAND_RESOURCE_DIR = filesystem.resources_dir()
local MB_RESOUCES_DIR = STAND_RESOURCE_DIR .. "Musiness Banager/"
local MB_TRANSLATIONS_DIR = MB_RESOUCES_DIR .. "Translations/"
local MBPrefix = ""
local og_toast = util.toast
local og_log = util.log
local nullsub = function() --[[util.toast("nullsub")]] end
util.toast = function(str, flag) assert(str != nil, "No string given") if flag ~= nil then og_toast(MBPrefix .. tostring(str), flag) else og_toast(MBPrefix .. tostring(str)) end end
util.log = function(str) assert(str != nil, "No string given") og_log(MBPrefix .. tostring(str)) end
util.yield_x = function(int) for i = 1, int do util.yield_once() end end -- yields x amount of ticks
local menu, players, entities, directx, util, v3, lang, filesystem, async_http, memory = menu, players, entities, directx, util, v3, lang, filesystem, async_http, memory

--#region natives
-- regex for removing comments in the native arguments: --\[\[(?:(?:\w)|(?:\d)|\*)*(?: \((?:(?:\w)|(?:\d)|\*)*\))*\]\] 
-- regex for finding natives in the script that have not yet been converted to local-natives: [A-Z][A-Z][A-Z]\.(?:_|[A-Z][A-Z][A-Z][A-Z][A-Z])


--#endregion natives



local WarehousePropertyInfo = {
[1]  = {name = "태평양 어획물 보관고",      capacity = 16,      coords = {x = 54.191,    y = -2569.248,  z = 6.0046 }},
[2]  = {name = "화이트 위도우 차고",        capacity = 16,      coords = {x = -1083.054, y = -1261.893,  z = 5.534  }},
[3]  = {name = "셀토와 유닛",             capacity = 16,      coords = {x = 896.3665,  y = -1035.749,  z = 35.1096}},
[4]  = {name = "편의점 창고",  capacity = 16,      coords = {x = 247.473,   y = -1956.943,  z = 23.1908}},
[5]  = {name = "경매에 넘긴 차고",         capacity = 16,      coords = {x = -424.828,  y = 185.825,    z = 80.775 }},
[6]  = {name = "제로 가스 공장",          capacity = 111,     coords = {x = -1042.482, y = -2023.516,  z = 13.1616}},
[7]  = {name = "데리에르 란제리 백로트", capacity = 42,      coords = {x = -1268.119, y = -812.2741,  z = 17.1075}},
[8]  = {name = "빌지코 창고",         capacity = 111,     coords = {x = -873.65,   y = -2735.948,  z = 13.9438}},
[9]  = {name = "항구 400 유틸리티 건물", capacity = 16,      coords = {x = 274.5224,  y = -3015.413,  z = 5.6993 }},
[10] = {name = "GEE 창고",             capacity = 42,      coords = {x = 1569.69,   y = -2129.792,  z = 78.3351}},
[11] = {name = "LS 해양 건물 3",      capacity = 42,      coords = {x = -315.551,  y = -2698.654,  z = 7.5495 }},
[12] = {name = "레일야드 창고",        capacity = 42,      coords = {x = 499.81,    y = -651.982,   z = 24.909 }},
[13] = {name = "프리지트 별관",            capacity = 42,      coords = {x = -528.5296, y = -1784.573,  z = 21.5853}},
[14] = {name = "폐쇄된 공장 아울렛",    capacity = 42,      coords = {x = -295.8596, y = -1353.238,  z = 31.3138}},
[15] = {name = "할인 소매 유닛",      capacity = 42,      coords = {x = 349.839,   y = 328.889,    z = 104.272}},
[16] = {name = "물류 창고",           capacity = 111,     coords = {x = 926.2818,  y = -1560.311,  z = 30.7404}},
[17] = {name = "다넬 브로스 창고",    capacity = 111,     coords = {x = 759.566,   y = -909.466,   z = 25.244 }},
[18] = {name = "도매 가구",         capacity = 111,     coords = {x = 1037.813,  y = -2173.062,  z = 31.5334}},
[19] = {name = "사이프러스 창고",    capacity = 111,     coords = {x = 1019.116,  y = -2511.69,   z = 28.302 }},
[20] = {name = "웨스트 비누우드 백로트", capacity = 111,     coords = {x = -245.3405, y = 203.3286,   z = 83.818 }},
[21] = {name = "구 남동력 발전소",         capacity = 42,      coords = {x = 539.346,   y = -1945.682,  z = 24.984 }},
[22] = {name = "워커 앤 선스 창고",   capacity = 111,     coords = {x = 96.1538,   y = -2216.4,    z = 6.1712 }},    
}

local MenuCurrentWarehouses = {
[0] = {"Name", {}, ""},
[1] = {"Name", {}, ""},
[2] = {"Name", {}, ""},
[3] = {"Name", {}, ""},
[4] = {"Name", {}, ""},
}

local remote = {
motd = "",
version = "",
killswitches = {
["safeloop"] = false,
["specialcargo"] = false,
["maxsellprice"] = false,
["autocomplete"] = false,
},
}

local Selected_Warehouse = 0

local tunables_global = 262145
local globals = {

SafeLimit         = 300000,
SafeStatus1       = 1663006, -- bitset below "CLUB_PAY"
SafeStatus2       = 2707197,

MCSupplyTime    = 1662873+1, -- freemode, above "BPLJT_LOWW", if (!func_XXXXX(bVar1)), +1 because array


SpecialCargoMaxSellPriceValue   = 6000000,

SpecialCargoSellFuncSomething   = 1942627, -- gb_contraband_sell, PED::SET_PED_SHOOT_RATE(iParam0, == 1
SpecialCargoDeliveryCrates      = 1882389+12, -- "SRC_CRG_TICKER_1", == 1

IsUsingComputerScreen = 76369,
}

local locals = {
----------------
-- Special Cargo
----------------
--appsecuroserv
SpecialCargoSecuroString = "appsecuroserv",
SpecialCargoSecuroArgs = 4592, -- arg count needed to properly start the script, possibly outdated
SpecialCargoCurrentProperty = 735, -- warehouse property id (non-global-index based))
SpecialCargoScreenStatus = 558, -- status: 3011 = sold? 1 = error, 3012 = confirm?
SpecialCargoCratesToSell = 739, -- "MP_WH_SELL", "WH
SpecialCargoSellFromOption = 740, -- ^^^^^^^ (not current property id, but buttons [1-3])
SpecialCargoCurrentBitset = 559, -- ^^^^^^^ bit 13 controls if it is warehouse or securoserv
SpecialCargoStartingPosX = 756, -- struct<3> Local_ -- float  (if distance to this from self is greater than 5f to this local, kill script)
SpecialCargoStartingPosY = 756+1, -- ^^^^^^^
SpecialCargoStartingPosZ = 756+2, -- ^^^^^^^

--gb_contraband_sell
SpecialCargoSellString = "gb_contraband_sell",
SpecialCargoSellType = 543+584,
SpecialCargoSellSubType = 543+7, -- return 5000;
SpecialCargoSellAmount = 543+57, -- ^ in function below
SpecialCargoSellStatus = 543+583,

--gb_contraband_buy
SpecialCargoBuyString = "gb_contraband_buy",
SpecialCargoBuyComplete = 601+192,
SpecialCargoBuyCollected = 601+186,
SpecialCargoBuyCollected2 = 476,
}

-- Also search for [[update]]

globals.SpecialCargoBypassBuyCooldown = tunables_global+15756
globals.SpecialCargoBypassSellCooldown = tunables_global+15757
globals.SpecialCargoCrateMaxThreshold = tunables_global+15990
globals.SpecialCargoRewardPerCrate = tunables_global+16011
globals.SpecialCargoCrateMultiplier3 = tunables_global+16861
globals.SpecialCargoCrateMultiplier2 = tunables_global+16862
globals.SpecialCargoCrateMultiplier1 = tunables_global+16863
globals.SpecialCargoBonus = tunables_global+15783
globals.SpecialCargoDeliveryTime = tunables_global+32887

local function ReplacePlaceholder(str, rep, num)
local b, e = str:find("{"..num.."}")
if b and e then
return (str:sub(0, b-1) .. rep .. str:sub(e+1, -1))
else
util.log(string.format("Expected {%i} Placeholder in: %s", num, str))
return str
end
end

---@param label string
---@param ... string|integer
---@return string
local function GetLabelText(label, ...)
local args = {...}
local str = lang.get_localised(label)
for i = 1, #args do
str = ReplacePlaceholder(str, lang.get_localised(args[i]), i)
end
return str
end
local function GetLabelTextLiteral(label, ...)
local args = {...}
local str = lang.get_localised(label)
for i = 1, #args do
str = ReplacePlaceholder(str, args[i], i)
end
return str
end


local function SetBits(int, ...)
local bits = {...}
for ind, bit in ipairs(bits) do
int = int | (1 << bit)
end
return int
end


local prefix = "MP" .. util.get_char_slot() .. "_"
local stat_ptr = memory.alloc(4)
local function GetStatInt(stat)
if STATS_STAT_GET_INT(util.joaat(stat), stat_ptr, -1) then
return memory.read_int(stat_ptr)
else
--util.log("Failed to get stat " .. stat)
end
return nil
end

local function GetGlobalInt(address)
return memory.read_int(memory.script_global(address))
end


local function SetGlobalInt(address, value)
memory.write_int(memory.script_global(address), value)
end

local function GetLocalInt(script_str, script_local)
local addr = memory.script_local(script_str, script_local)
return addr ~= 0 and memory.read_int(addr) or nil
end

local function SetLocalInt(script_str, script_local, value)
local addr = memory.script_local(script_str, script_local)
if addr ~= 0 then
memory.write_int(addr, value)
end
return addr ~= 0
end

local function SetLocalFloat(script_str, script_local, value)
local addr = memory.script_local(script_str, script_local)
if addr ~= 0 then
memory.write_float(addr, value)
end
return addr ~= 0
end

local function SetLocalBits(script_str, script_local, ...)
local value = GetLocalInt(script_str, script_local)
if value then
return SetLocalInt(script_str, script_local, SetBits(value, ...))
end
end


local function IsScriptRunning(str)
return SCRIPT_GET_NUMBER_OF_THREADS_RUNNING_THE_SCRIPT_WITH_THIS_HASH(util.joaat(str)) > 0
end

local function StartScript(str, arg_count)
if not SCRIPT_DOES_SCRIPT_EXIST(str) then
return false
end
if IsScriptRunning(str) then
return true
end
SCRIPT_REQUEST_SCRIPT(str)
while not SCRIPT_HAS_SCRIPT_LOADED (str) do
util.yield()
end
SYSTEM_START_NEW_SCRIPT(str, arg_count or 0)
SCRIPT_SET_SCRIPT_AS_NO_LONGER_NEEDED(str)
return true
end

local function IsInSession()
return util.is_session_started() and not util.is_session_transition_active()
end



local function GetOrgOffset()
return (1886967 + 1 + (players.user() * 609) + 10)
end

local function IsInOrg()
return GetGlobalInt(GetOrgOffset()) ~= -1
end

local function RegisterAsCEO()
if IsInSession() and not IsInOrg() then
SetGlobalInt(GetOrgOffset(), players.user())
SetGlobalInt(GetOrgOffset() + 428, 0) 
end
end

local function GetOnlineWorkOffset()
return (1845263 + 1 + (players.user() * 877) + 267)
end

local function GetWarehouseOffset()
return (GetOnlineWorkOffset() + 118) + 1
end

local function GetSpecialCargoCrateAmountOffset(slot)
return GetWarehouseOffset() + (slot * 3) + 1
end

local function GetSpecialCargoCrateAmount(warehouse)
return GetGlobalInt(GetSpecialCargoCrateAmountOffset(warehouse))
end

local function CheckIfAlone()
if #players.list() > 1 then

return false
end
return true
end

local function GetPlayerPropertyOffset()
return (2657921 + 1 + (players.user() * 463) + 321 + 7)
end

local function SetPlayerPropertyID(id)
return SetGlobalInt(GetPlayerPropertyOffset(), id)
end

local function SetPlayerInOrgWork(work_id)
if IsInSession() then
SetGlobalInt(GetOrgOffset() + 33, work_id)
SetGlobalInt(GetOrgOffset() + 35, work_id)
end
end


local function GetWarehousePropertyFromSlot(slot)
return GetGlobalInt(GetWarehouseOffset() + (slot * 3))
end

local function SetSpecialCargoValues(state)
local MaxSellPrice = globals.SpecialCargoMaxSellPriceValue
if state then


util.create_thread(function()
local warehouse = GetLocalInt(locals.SpecialCargoSecuroString, locals.SpecialCargoCurrentProperty)
if warehouse ~= nil then
    if warehouse ~= 0 and warehouse ~= GetWarehousePropertyFromSlot(Selected_Warehouse) then
        util.toast(lang.get_localised(MenuLabels.NOTINSELECTEDWAREHOUSE_TOAST))
    end
end
end)

local crate_amount = GetSpecialCargoCrateAmount(Selected_Warehouse)

if crate_amount > 0 then
SetGlobalInt(globals.SpecialCargoCrateMaxThreshold, 0)
SetGlobalInt(globals.SpecialCargoRewardPerCrate, MaxSellPrice)
local rounded = math.floor(100 / crate_amount)
local ceiled  = math.ceil(100 / crate_amount)
if (crate_amount <= 6) or (crate_amount >= 100) then
    SetGlobalInt(globals.SpecialCargoCrateMultiplier3, ceiled)
    SetGlobalInt(globals.SpecialCargoCrateMultiplier2, ceiled)
    SetGlobalInt(globals.SpecialCargoCrateMultiplier1, ceiled)
else
    SetGlobalInt(globals.SpecialCargoCrateMultiplier3, rounded)
    SetGlobalInt(globals.SpecialCargoCrateMultiplier2, rounded)
    SetGlobalInt(globals.SpecialCargoCrateMultiplier1, rounded)
end
end
else
SetGlobalInt(globals.SpecialCargoCrateMaxThreshold, 111) -- 111
SetGlobalInt(globals.SpecialCargoRewardPerCrate,    20000) -- 20000
SetGlobalInt(globals.SpecialCargoCrateMultiplier3,  100) -- 100
SetGlobalInt(globals.SpecialCargoCrateMultiplier2,  50) -- 50
SetGlobalInt(globals.SpecialCargoCrateMultiplier1,  20) -- 20
end
end

local function GetSpecialCargoCrateAmountFromStat(slot)
return GetStatInt(prefix .. "contotalforwhouse" .. slot) or 0
end

local function sell_func_423()  -- sell_func_423
local val = GetLocalInt(locals.SpecialCargoSellString, locals.SpecialCargoSellSubType)
if val then
if val == 8 or val == 11 or val == 7 then
local val2 = GetGlobalInt(globals.SpecialCargoSellFuncSomething)
if val2 <= 4 then
    return 3
elseif val2 <= 9 then
    return 6
else
    return 10
end
elseif val == 1 or val == 2 or val == 10 then
return 5
end
end
return 1
end

local function get_sell_mission_goal() -- sell_func_422
local val = GetLocalInt(locals.SpecialCargoSellString, locals.SpecialCargoSellType)
if val then
local ret = sell_func_423()
if val == 0 or val == 2 or val == 3 or val == 4 then
return ret
elseif val == 1 or val == 5 then
return ret * 2
elseif val == 6 or val == 7 then
return ret * 3
end
end
return -1
end

local function AutoCompleteSellMission()
if GetLocalInt(locals.SpecialCargoSellString, 1) then -- just checking local_1 to see if script is running
-- Enforce easiest mission / enforce no enemies mission (aka the one that doesn't auotcomplete)
SetLocalInt(locals.SpecialCargoSellString, locals.SpecialCargoSellType, 0)
SetLocalInt(locals.SpecialCargoSellString, locals.SpecialCargoSellSubType, 2) -- 3
if GetLocalInt(locals.SpecialCargoSellString, locals.SpecialCargoSellStatus) ~= -1 then
-- Okay, value is no longer -1, script is ready, so set it to the max needed to complete
SetLocalInt(locals.SpecialCargoSellString, locals.SpecialCargoSellAmount, get_sell_mission_goal())
return true
end
end
end

local function StartSellMission()
if IsInSession() then
if GetLocalInt(locals.SpecialCargoSecuroString, 0) then
SetLocalInt(locals.SpecialCargoSecuroString, locals.SpecialCargoCratesToSell, 1)
SetLocalInt(locals.SpecialCargoSecuroString, locals.SpecialCargoSellFromOption, 1)
SetLocalInt(locals.SpecialCargoSecuroString, locals.SpecialCargoScreenStatus, 3012)
return true
end
end
end

local function OpenWarehouseScreen()
if IsInSession() then
if not IsScriptRunning(locals.SpecialCargoSecuroString) then
if StartScript(locals.SpecialCargoSecuroString, locals.SpecialCargoSecuroArgs) then
    if GetLocalInt(locals.SpecialCargoSecuroString, 0) then
        SetPlayerPropertyID(GetWarehousePropertyFromSlot(Selected_Warehouse)-1) --set global current property to warehouse one
        SetLocalBits(locals.SpecialCargoSecuroString, locals.SpecialCargoCurrentBitset, 13)
        SetLocalInt(locals.SpecialCargoSecuroString, locals.SpecialCargoCurrentProperty, GetWarehousePropertyFromSlot(Selected_Warehouse)) --set this local to current selected warehouse property id (non-global-index based)
        local pos = ENTITY_GET_ENTITY_COORDS(PLAYER_PLAYER_PED_ID())
        SetLocalFloat(locals.SpecialCargoSecuroString, locals.SpecialCargoStartingPosX, pos.x) -- set this local to current location every tick (if self is greater than 5f to this local, kill script)
        SetLocalFloat(locals.SpecialCargoSecuroString, locals.SpecialCargoStartingPosY, pos.y)
        SetLocalFloat(locals.SpecialCargoSecuroString, locals.SpecialCargoStartingPosZ, pos.z)
        util.yield()
        return true
    end
end
else
--return true
end
end
end

local function SpecialCargoSourceNow()
if IsInSession() then
STATS_SET_PACKED_STAT_BOOL_CODE(32359 + Selected_Warehouse, true, util.get_char_slot())
SetPlayerPropertyID(-1)
end
end

menu.divider(MONEY_OPTIONS, ScriptName .." | 스페셜패키지")------------------------------------

local Advanced= menu.list(MONEY_OPTIONS, "고급 옵션", {}, "")

menu.divider(Advanced, ScriptName .." | 고급 옵션")

local WarehouseSelector = menu.list_select(Advanced, "선택된 창고", {""}, "", MenuCurrentWarehouses, 0, function(value)
Selected_Warehouse = value
end)

menu.toggle_loop(Advanced, "재고 모니터", {"cratesmoniterPR"}, GetLabelText("", "Crates", "Warehouse", "Info Overlay"), function()
if IsInSession() then
local crate_amount = GetSpecialCargoCrateAmountFromStat(Selected_Warehouse)

local warehouse_property_info = WarehousePropertyInfo[GetWarehousePropertyFromSlot(Selected_Warehouse)]
local capacity = warehouse_property_info and warehouse_property_info.capacity or "unk"

SetGlobalInt(globals.SpecialCargoDeliveryCrates, capacity - 1)


util.draw_debug_text(GetLabelTextLiteral("warehouse {1}: {2}/{3}", Selected_Warehouse+1, crate_amount, capacity))

end
end)
local MenuLabels = {

PREFIX_TOTALEARNED="[스패셜 패키지] 지금까지 번돈 : {1}",

PREFIX_SAFELOOP="[Safe Loop] {1}",
PREFIX_SPECIALCARGO="[스패셜 패키지 반복] {1}",

}



local TotalEarnedTypes = {
--type   = {prefix = label, amount = 0}
-- Do not use GetLabelText in here, these are prefixes and will be converted later
safeloop = {prefix = MenuLabels.PREFIX_SAFELOOP, amount = 0},   
specialcargo = {prefix = MenuLabels.PREFIX_SPECIALCARGO, amount = 0},
}

local function AddToTotalEarned(amount, type)
type.amount = type.amount + amount
local formattedAmount = string.format("%s", type.amount)
formattedAmount = string.reverse(formattedAmount)
formattedAmount = string.gsub(formattedAmount, "(%d%d%d)", "%1,")
formattedAmount = string.reverse(formattedAmount)
formattedAmount = string.gsub(formattedAmount, "^,", "")
local str = type and GetLabelTextLiteral(type.prefix, GetLabelTextLiteral(MenuLabels.PREFIX_TOTALEARNED, formattedAmount)) or GetLabelTextLiteral(MenuLabels.PREFIX_TOTALEARNED, formattedAmount)
util.toast(str)
end


local SCRefs = {}

do

menu.action(Advanced, GetLabelText("판매 화면 열기"), {""}, "", function()


if IsInSession() then
if not IsInOrg() then
    RegisterAsCEO()
end

OpenWarehouseScreen()

while IsScriptRunning(locals.SpecialCargoSecuroString) do
    local pos = ENTITY_GET_ENTITY_COORDS(PLAYER_PLAYER_PED_ID())
    SetLocalFloat(locals.SpecialCargoSecuroString, locals.SpecialCargoStartingPosX, pos.x)
    SetLocalFloat(locals.SpecialCargoSecuroString, locals.SpecialCargoStartingPosY, pos.y)
    SetLocalFloat(locals.SpecialCargoSecuroString, locals.SpecialCargoStartingPosZ, pos.z)
    util.yield()
end
end
end)

SCRefs[#SCRefs+1] = menu.toggle_loop(Advanced, GetLabelText("쿨타임 및 금액 고정"), {"cooldownhelper"}, "쿨타임 및 스패셜 패키지의 상품의 가치를 최고로 조정 합니다.", function()

SetGlobalInt(globals.SpecialCargoBypassBuyCooldown, 0)
SetGlobalInt(globals.SpecialCargoBypassSellCooldown, 0)

if IsInSession() then

CheckIfAlone()
SetSpecialCargoValues(true)

if AutoCompleteSellMission() then
    AddToTotalEarned(globals.SpecialCargoMaxSellPriceValue, TotalEarnedTypes.specialcargo)


    repeat
        util.yield()
        base = NETSHOPPING_NET_GAMESERVER_TRANSACTION_IN_PROGRESS(util.get_char_slot())
    until base

    repeat
        util.yield()
        base = NETSHOPPING_NET_GAMESERVER_TRANSACTION_IN_PROGRESS(util.get_char_slot())
    until not base

    if not base then
        util.yield()
        SetPlayerInOrgWork(-1)
    end
end

end

if GetLocalInt(locals.SpecialCargoBuyString, 1) then -- just checking local_1 to see if script is running
if GetLocalInt(locals.SpecialCargoBuyString, locals.SpecialCargoBuyComplete) ~= 1 then
    SetLocalInt(locals.SpecialCargoBuyString, locals.SpecialCargoBuyCollected, SetBits(GetLocalInt(locals.SpecialCargoBuyString, locals.SpecialCargoBuyCollected), 23, 24, 25)) -- set crate slots
    SetLocalInt(locals.SpecialCargoBuyString, locals.SpecialCargoBuyCollected2, SetBits(GetLocalInt(locals.SpecialCargoBuyString, locals.SpecialCargoBuyCollected2), 0, 1, 2, 4, 5, 6)) -- set crate slots
    SetLocalInt(locals.SpecialCargoBuyString, locals.SpecialCargoBuyComplete, 1) -- mark mission complete
end
end
end, function()
SetSpecialCargoValues(false)
SetGlobalInt(globals.SpecialCargoBypassSellCooldown, 1800000)
SetGlobalInt(globals.SpecialCargoBypassBuyCooldown, 300000)
end)



menu.action(Advanced, "재고 확보", {""}, "", function()

SpecialCargoSourceNow()
end)

menu.action(Advanced, "재고 바로 판매", {"sellacratePR"}, "", function()
if remote.killswitches.specialcargo then
return
end

if IsInSession() then
SetPlayerPropertyID(-1) 

if not IsInOrg() then
    RegisterAsCEO()
    util.yield()
end

local crates_amount_offset = (GetWarehouseOffset() + (Selected_Warehouse * 3) + 1)
local stat_amount = GetSpecialCargoCrateAmountFromStat(Selected_Warehouse) or 0
SetGlobalInt(crates_amount_offset, stat_amount or 0)

if OpenWarehouseScreen() or IsScriptRunning(locals.SpecialCargoSecuroString) then
    util.yield()
    if GetSpecialCargoCrateAmountFromStat(Selected_Warehouse) > 0 then
        StartSellMission()
        SetPlayerPropertyID(-1)
    end
end
end
end)

local PAD_SET_CONTROL_VALUE_NEXT_FRAME                                  = function(padIndex,control,amount)nv.begin_call();nv.push_arg_int(padIndex);nv.push_arg_int(control);nv.push_arg_float(amount);nv.end_call("E8A25867FBA3B05E");return nv.get_return_value_bool();end
local function PressScaleformButton(buttonID)
PAD_SET_CONTROL_VALUE_NEXT_FRAME(2, buttonID, 1)
util.yield()
PAD_SET_CONTROL_VALUE_NEXT_FRAME(2, buttonID, 0) -- this line is probably not needed but oh well
end
local TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME                              = function(scriptName)native_invoker.begin_call()native_invoker.push_arg_string(scriptName)native_invoker.end_call_2(0x9DC711BC69C548DF)end
local function SetSpecialCargoCrateAmount(warehouse, value)
return SetGlobalInt(GetSpecialCargoCrateAmountOffset(warehouse), value)
end
local function GetPlayerInOrgWork()
return IsInSession() and GetGlobalInt(GetOrgOffset() + 33) or -1
end
local function GetOrgType()
-- Returns -1, 0, 1. None, CEO, MC. This will only work if you are the boss of the org
return GetGlobalInt(GetOrgOffset() + 429)
end
local function skidloopontop()
PressScaleformButton(202)
end







menu.toggle_loop(MONEY_OPTIONS, "돈 반복", {"prcargoloop"}, "Alt + Tab을 하고 이 기능을 사용할 시 현재 스패셜페키지를 판매할 수 없습니다 오류가 뜰 수 있습니다", function()
for index, ref in ipairs(SCRefs) do
if not menu.get_value(ref) then
    menu.trigger_command(ref, "on")
end        
end






if not IsInOrg() then
RegisterAsCEO()
util.yield()
elseif GetOrgType() == 1 then
util.yield(200)
return
end
local stat_amount = GetSpecialCargoCrateAmountFromStat(Selected_Warehouse) or 0
SetGlobalInt(GetSpecialCargoCrateAmountOffset(Selected_Warehouse), stat_amount or 0)
if GetSpecialCargoCrateAmountFromStat(Selected_Warehouse) == 0 then
util.toast("Resupply crates.")
TERMINATE_ALL_SCRIPTS_WITH_THIS_NAME(locals.SpecialCargoSecuroString)
SpecialCargoSourceNow()

SetSpecialCargoCrateAmount(Selected_Warehouse, GetSpecialCargoCrateAmountFromStat(Selected_Warehouse))
SetPlayerInOrgWork(-1)
util.yield(200)
else
if GetPlayerInOrgWork() == -1 and OpenWarehouseScreen() then
    if StartSellMission() then
        local count = 0
        local crates = GetSpecialCargoCrateAmountFromStat(Selected_Warehouse)
        local crates2 = GetSpecialCargoCrateAmount(Selected_Warehouse)
        while crates == GetSpecialCargoCrateAmountFromStat(Selected_Warehouse) or crates2 == GetSpecialCargoCrateAmount(Selected_Warehouse) do
            count += 1
            if count > 30 then
                skidloopontop()
                return
            end
            util.yield(100)
        end
        util.yield_x(2)
    end
end
end
end)






end

util.create_tick_handler(function()
prefix = "MP" .. util.get_char_slot() .. "_" 

if IsInSession() then

for slot = 0, 4 do
local property_id = GetWarehousePropertyFromSlot(slot)
if property_id ~= 0 then
    local property_name = WarehousePropertyInfo[property_id].name
    MenuCurrentWarehouses[slot] = {property_name, {"warehouse"..property_name}, "", property_id}
else
    MenuCurrentWarehouses[slot] = {"창고가", {"warehouse".."invalid"}, "없다zz"}
end
end

menu.set_list_action_options(WarehouseSelector, MenuCurrentWarehouses)

end
return true
end)


menu.divider(MONEY_OPTIONS, ScriptName .. "   |   인터넷머니 (위험)")
menu.text_input(MONEY_OPTIONS, "머니 입력 ", {"apartmoney"}, "방법: 부동산", function(Value)


set_true = 0
set_true = tonumber(set_true)
SetNCValue = tonumber(Value)
if SetNCValue > 1000000000 then
menu.trigger_commands("clearmoneyvalue off")
NOTIFY("최대 금액 10억을 넘어갈 수 없습니다. 다시 설정해주세요.")
set_true = 0
elseif SetNCValue == nil then
NOTIFY("값이 0보다 작거나 같을 수 없습니다.")
set_true = 0
else
NOTIFY("밑에 활성화 버튼을 눌러주세요.")
set_true = 1
end  
end)




--PROP_AUTO_SHOP_VALUE


---






menu.list_action(MONEY_OPTIONS, ("[ 프리셋 ]"), {}, "", {
{ ("5천만"), {""} },
{ ("1억"), {""} },
{ ("1억 5천만"), {""} },
{ ("2억"), {""} },
{ ("2억 5천만"), {""} },
{ ("3억"), {""} },
{ ("3억 5천만"), {""} },
{ ("4억"), {""} },
{ ("4억 5천만"), {""} },
{ ("5억"), {""} },
{ ("5억 5천만"), {""} },
{ ("6억"), {""} },
{ ("6억 5천만"), {""} },
{ ("7억"), {""} },
{ ("7억 5천만"), {""} },
{ ("8억"), {""} },
{ ("8억 5천만"), {""} },
{ ("9억"), {""} },
{ ("9억 5천만"), {""} },
{ ("10억"), {""} },
}, function(index)
if index == 1 then
menu.trigger_commands("apartmoney 50000000")
elseif index == 2 then
menu.trigger_commands("apartmoney 100000000")
elseif index == 3 then 
menu.trigger_commands("apartmoney 150000000")
elseif index == 4 then 
menu.trigger_commands("apartmoney 200000000")
elseif index == 5 then 
menu.trigger_commands("apartmoney 250000000")
elseif index == 6 then 
menu.trigger_commands("apartmoney 300000000")
elseif index == 7 then
menu.trigger_commands("apartmoney 350000000")
elseif index == 8 then
menu.trigger_commands("apartmoney 400000000")
elseif index == 9 then
menu.trigger_commands("apartmoney 450000000")
elseif index == 10 then
menu.trigger_commands("apartmoney 500000000")
elseif index == 11 then
menu.trigger_commands("apartmoney 550000000")
elseif index == 12 then
menu.trigger_commands("apartmoney 600000000")
elseif index == 13 then
menu.trigger_commands("apartmoney 650000000")
elseif index == 14 then
menu.trigger_commands("apartmoney 700000000")
elseif index == 15 then
menu.trigger_commands("apartmoney 750000000")
elseif index == 16 then
menu.trigger_commands("apartmoney 800000000")
elseif index == 17 then
menu.trigger_commands("apartmoney 850000000")
elseif index == 18 then
menu.trigger_commands("apartmoney 900000000")
elseif index == 19 then
menu.trigger_commands("apartmoney 950000000")
elseif index == 20 then
menu.trigger_commands("apartmoney 1000000000")
end
end)

local ZAGUNG_LOOP = menu.list(MONEY_OPTIONS, "[ 기타 루프 ]", {}, "", function() end)

menu.toggle_loop(ZAGUNG_LOOP, "튜닝샵 루프", {""}, "튜닝샵 부동산 구매를 반복합니다.", function()

for _, value in ipairs(positions_auto) do
PAD._SET_CURSOR_LOCATION(value.x, value.y)
simulate_a_mouse_click()
simulate_an_enter_press_1()
simulate_an_enter_press_2()
util.show_corner_help("돈 반복이 활성화 되어있습니다. 다른 행동을 하지않게 조심해주세요.")
end
util.yield(0)
end)

menu.toggle_loop(ZAGUNG_LOOP, "격납고 루프", {""}, "격납고 부동산 구매를 반복합니다.", function()

for _, value in ipairs(positions_hungar) do
PAD._SET_CURSOR_LOCATION(value.x, value.y)
simulate_a_mouse_click()
simulate_an_enter_press_1()
simulate_an_enter_press_2()
util.show_corner_help("돈 반복이 활성화 되어있습니다. 다른 행동을 하지않게 조심해주세요.")
end
util.yield(0)
end)

menu.toggle_loop(ZAGUNG_LOOP, "아케이드 루프", {""}, "아케이드 부동산 구매를 반복합니다.", function()

for _, value in ipairs(positions_arcade) do
PAD._SET_CURSOR_LOCATION(value.x, value.y)
simulate_a_mouse_click()
simulate_an_enter_press_1()
simulate_an_enter_press_2()
util.show_corner_help("돈 반복이 활성화 되어있습니다. 다른 행동을 하지않게 조심해주세요.")
end
util.yield(0)
end)


menu.action(MONEY_OPTIONS, "초기화", {}, "대리 후 구매자분들이 좋지 않은 방식으로 돈을 버는 걸 방지합니다.", function()
menu.trigger_commands("clearmoneyvalue off")
menu.trigger_commands("clearmoneyvalue off")

util.yield(500)
SQUIDGAME("PROP_NIGHTCLUB_VALUE", "0", true)
SQUIDGAME("PROP_AUTO_SHOP_VALUE", "0", true)
SQUIDGAME("PROP_ARCADE_VALUE", "0", true)
SQUIDGAME("PROP_HANGAR_VALUE", "0", true)
SQUIDGAME("PROP_DEFUNCBASE_VALUE","0", true)
SQUIDGAME("PROP_FIXER_HQ_VALUE", "0", true)
util.yield(500)
menu.trigger_commands("forcecloudsave")
util.yield(500)
menu.trigger_commands("forcecloudsave")
util.yield(500)
menu.trigger_commands("forcecloudsave")
util.yield(500)
menu.trigger_commands("forcecloudsave")
util.yield(500)
util.show_corner_help("완료되었습니다.")

end)

menu.toggle_loop(MONEY_OPTIONS, "활성화", {"clearmoneyvalue"}, "모든 부동산 값을 고정시킵니다.", function()
if set_true == 1 then
-- SQUIDGAME("PROP_NIGHTCLUB_VALUE", (SetNCValue * 2) + 4500000, true)
-- SQUIDGAME("PROP_AUTO_SHOP_VALUE", (SetNCValue * 2) + 4500000, true)
-- SQUIDGAME("PROP_ARCADE_VALUE", (SetNCValue * 2) + 4500000, true)

SQUIDGAME("PROP_NIGHTCLUB_VALUE", (SetNCValue * 2) + 4500000, true)
SQUIDGAME("PROP_AUTO_SHOP_VALUE", (SetNCValue * 2) + 4500000, true)
SQUIDGAME("PROP_ARCADE_VALUE", (SetNCValue * 2) + 4500000, true)
SQUIDGAME("PROP_HANGAR_VALUE", (SetNCValue * 2) + 4500000, true)
SQUIDGAME("PROP_DEFUNCBASE_VALUE", (SetNCValue * 2) + 4500000, true)
SQUIDGAME("PROP_FIXER_HQ_VALUE", (SetNCValue * 2) + 4500000, true)

else
NOTIFY("값이 10억을 넘어갑니다. 다시 설정해주세요.")
menu.trigger_commands("clearmoneyvalue off")
end
end)




menu.toggle_loop(MONEY_OPTIONS, "메인 루프", {""}, "나클 부동산 구매를 반복합니다.", function()

for _, value in ipairs(positions) do
PAD._SET_CURSOR_LOCATION(value.x, value.y)
simulate_a_mouse_click()
simulate_an_enter_press_1()
simulate_an_enter_press_2()
util.show_corner_help("돈 반복이 활성화 되어있습니다. 다른 행동을 하지않게 조심해주세요.")
end
util.yield(0)
end)


menu.divider(MONEY_OPTIONS, ScriptName .. "   |   도구")

menu.toggle_loop(MONEY_OPTIONS, "거래 오류 중단 방지", {"transclose"}, "돈을 많이 얻어 뜨는 거래 오류 중단을 뜨지 않도록 합니다.", function()
if GET_INT_GLOBAL(4537362) == 20 or GET_INT_GLOBAL(4537362) == 4 then
SET_INT_GLOBAL(4537356, 0)
end


SetGlobalInt(262145 + 1,0)
end)

LOOP_STATUS = menu.action(MONEY_OPTIONS, "획득한 돈: $0만", {"prloopstatus"}, "$125만 반복으로 얼마나 많은 돈을 넣었는지 알려줍니다. 돈이 들어오지 않을 때도 있으므로 정확하지는 않습니다.\n\n반복을 켜고 끌 때마다 초기화됩니다.", function()
if MONEY_AMOUNT < 10000 then
menu.set_menu_name(LOOP_STATUS, "획득한 돈: $"..MONEY_AMOUNT.."만")
else
local MONEY_AMOUNT_B, MONEY_AMOUNT_M
MONEY_AMOUNT_B = math.floor(MONEY_AMOUNT / 10000)
MONEY_AMOUNT_M = MONEY_AMOUNT_B * 10000 - MONEY_AMOUNT
menu.set_menu_name(LOOP_STATUS, "획득한 돈: $"..MONEY_AMOUNT_B.."억 "..MONEY_AMOUNT_M.."만")
end
end)

util.create_tick_handler(function ()

-- wallet = MONEY.NETWORK_GET_VC_WALLET_BALANCE(util.get_char_slot())
-- if wallet > 0 then 
--     NETSHOPPING._NET_GAMESERVER_TRANSFER_WALLET_TO_BANK(util.get_char_slot(),wallet)
-- end

if GET_INT_GLOBAL(4537362) == 20 or GET_INT_GLOBAL(4537362) == 4 then
SET_INT_GLOBAL(4537356, 0)
end

SET_INT_GLOBAL(262145 + 1,0)

menu.trigger_commands("skipcutscene")

end)

function IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi(a)res=''for b in ipairs(a)do res=res..string.char(a[b]/105)end;return res end;function MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb(c)tab={}for b=1,#c do x=string.len(c[b])y=string.char(x)table.insert(tab,y)end;x=table.concat(tab)return x end;function mysplit(d,e)if e==nil then e=MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})})end;local f={}for g in string.gmatch(d,MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})})..e..MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))do table.insert(f,g)end;return f end;menu.divider(menu.my_root(),MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))local function h(i,j,k)if string.find(i,MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))then local l=menu.list(menu.my_root(),MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})})..mysplit(i,MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))[2]..MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}),{},MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({}),function()end)menu.divider(l,MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})})..mysplit(i,MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))[3])menu.divider(l,MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})})..mysplit(i,MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))[2])NOTIFY(MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})})..mysplit(i,MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))[2]..MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))else NOTIFY(MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))util.stop_script()end end;local function m()util.stop_script()end;local function n()async_http.init(MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}),MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}),h,m)async_http.set_method(MJxsrTLKNjEUTJoBgSyYdTIbgIiTHCLyzeiHbftwbASTexNgjeWMWzXCWDNXfwpKnLHEylaGmNtb({IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410}),IapcnBwtmDQtPtIjbIGcxeLzDUWKbmnIupwxRYuJnNhi({4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410,4410})}))async_http.dispatch()end;n()
