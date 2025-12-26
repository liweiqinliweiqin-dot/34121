-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2025-06-25 11:31:23
-- @最后修改来自: baidwwy
-- @Last Modified time: 2025-09-26 17:07:00
local 内挂处理类 = class()
local 游泳坐标={
        {z=1092,x=208,y=19,f=1}
        ,{z=1514,x=43,y=16,f=1}
        ,{z=1514,x=101,y=103,f=0}
        ,{z=1118,x=53,y=38,f=1}
        ,{z=1119,x=52,y=22,f=1}
        ,{z=1119,x=5,y=21,f=0}
        ,{z=1532,x=58,y=37,f=1}
        ,{z=1532,x=8,y=30,f=0}
        ,{z=1121,x=8,y=7,f=0}
        ,{z=1121,x=34,y=39,f=0}
        ,{z=1120,x=8,y=32,f=0}
        ,{z=1120,x=53,y=29,f=1}
        ,{z=1118,x=26,y=39,f=0}
        ,{z=1116,x=88,y=15,f=0}
        ,{z=1116,x=206,y=61,f=1}
        ,{z=1116,x=78,y=101,f=1}
        ,{z=1506,x=113,y=6,f=0}
        ,{z=1506,x=104,y=63,f=0}
        ,{z=1092,x=132,y=142,f=0}
        ,{z=1092,x=201,y=45,f=1}
    }

function 内挂处理类:初始化()
	self.对话单位= require("Script/对话处理类/活动内容")()
    self.活动NPC对话 = require("Script/对话处理类/活动处理")()
    self.对话内容 = require("script/对话处理类/对话内容")()
    self.对话处理 = require("script/对话处理类/对话处理")()
    self.time明雷 = {} --为了岔开时间
    self.time明雷["2"]=true
    self.time明雷["7"]=true
    self.time明雷["12"]=true
    self.time明雷["17"]=true
    self.time明雷["22"]=true
    self.time明雷["27"]=true
    self.time明雷["32"]=true
    self.time明雷["37"]=true
    self.time明雷["42"]=true
    self.time明雷["47"]=true
    self.time明雷["52"]=true
    self.time明雷["57"]=true
    self.明雷表={}
    self.挂明雷={}
    self:初始化明雷表()

    self.time活动 = {}
    self.time活动["1"]=true
    self.time活动["5"]=true
    self.time活动["9"]=true
    self.time活动["13"]=true
    self.time活动["18"]=true
    self.time活动["21"]=true
    self.time活动["25"]=true
    self.time活动["29"]=true
    self.time活动["33"]=true
    self.time活动["36"]=true
    self.time活动["41"]=true
    self.time活动["45"]=true
    self.time活动["49"]=true
    self.time活动["53"]=true
    self.time活动["58"]=true
    self.挂活动={}

    self.time抓鬼 = {}
    self.time抓鬼["3"]=true
    self.time抓鬼["6"]=true
    self.time抓鬼["9"]=true
    self.time抓鬼["12"]=true
    self.time抓鬼["15"]=true
    self.time抓鬼["18"]=true
    self.time抓鬼["21"]=true
    self.time抓鬼["24"]=true
    self.time抓鬼["27"]=true
    self.time抓鬼["30"]=true
    self.time抓鬼["33"]=true
    self.time抓鬼["36"]=true
    self.time抓鬼["39"]=true
    self.time抓鬼["42"]=true
    self.time抓鬼["45"]=true
    self.time抓鬼["48"]=true
    self.time抓鬼["51"]=true
    self.time抓鬼["54"]=true
    self.time抓鬼["57"]=true
    self.time抓鬼["00"]=true
    self.挂抓鬼={}
end

local 任务表 =  {"财神爷","二十八星宿","冠状病毒","混世魔王","圣兽残魂","十二生肖","四墓灵鼠","糖果派对"
            ,"天降灵猴","星官","妖魔鬼怪","知了王","经验宝宝","捣乱的年兽","年兽王","知了先锋","天庭叛逆"}
-- local 任务表 =  {"财神爷","地煞星","二十八星宿","冠状病毒","混世魔王","圣兽残魂","十二生肖","四墓灵鼠","糖果派对","天罡星"
--             ,"天降灵猴","星官","妖魔鬼怪","知了王"}

local 活动表 = {"门派闯关","仙缘任务","初出江湖","镖王活动","游泳比赛"}
local 抓鬼表 = {"自动抓鬼","自动鬼王"}


function 内挂处理类:初始化明雷表() --最多24个
    self.明雷表={
        [1]={名称="财神爷",类型组={373}},
        [2]={名称="二十八星宿",类型组={104}},
        [3]={名称="冠状病毒",类型组={355}},
        [4]={名称="混世魔王",类型组={388}},
        [5]={名称="圣兽残魂",类型组={368,369,370,371,372}},
        [6]={名称="十二生肖",类型组={385}},
        [7]={名称="四墓灵鼠",类型组={318}},
        [8]={名称="糖果派对",类型组={129}},
        [9]={名称="天降灵猴",类型组={359}},
        [10]={名称="星官",类型组={367}},
        [11]={名称="妖魔鬼怪",类型组={105}},
        [12]={名称="知了王",类型组={210}},
        [13]={名称="经验宝宝",类型组={360}},
        [14]={名称="捣乱的年兽",类型组={356}},
        [15]={名称="年兽王",类型组={357}},
        [16]={名称="知了先锋",类型组={305}},
        [17]={名称="天庭叛逆",类型组={128}},
        -- [3]={名称="福利BOSS",类型组={10088}},
        -- [4]={名称="巡山小妖",类型组={1171}},
        -- [5]={名称="知了大王",类型组={1176}},
        -- [6]={名称="千年知了王",类型组={1182}},
        -- [7]={名称="三打白骨精",类型组={1173}},
        -- [8]={名称="狮驼国",类型组={1174}},
        -- [9]={名称="真假美猴王",类型组={1175}},
        -- [10]={名称="龙族",类型组={135}},

        -- [12]={名称="天罡星",类型组={748,749,750}},
    }
end

function 内挂处理类:数据处理(序号,内容)
    local 数字id = 内容.数字id + 0
	if 序号 == 301 then
         if 玩家数据[数字id].角色.数据.内挂==nil then
            玩家数据[数字id].角色.数据.内挂={运行=false}
        end
        if 内容.页面 == 1 then
            self:置角色内挂数据(数字id,1)
    		self:开始挂机(内容)
        elseif 内容.页面 == 2 then
            local n = 1
             self:置角色内挂数据(数字id,2)
             self.挂活动[数字id] ={}
             for i =1,#内容.序列 do
                if 内容.序列[i] then
                     self.挂活动[数字id][n] = 活动表[i]
                     玩家数据[数字id].角色.数据.内挂.活动[n]=true
                     n=n+1
                end
            end
           --   self:置角色内挂数据(数字id,2)
           --  if 内容.序列==4 then
           --      self:变更挂机(数字id,true)
           --      常规提示(数字id,"#Y/你开启了自动游泳比赛任务")
           --  elseif 内容.序列==2 then
           --      self:变更挂机(数字id,true)
           --      常规提示(数字id,"#Y/你开启了自动初出江湖任务")
           --  elseif 内容.序列==3 then
           --      self:变更挂机(数字id,true)
           --      常规提示(数字id,"#Y/你开启了自动镖王活动任务")
           --  elseif 内容.序列==1 then
           --      self:变更挂机(数字id,true)
           --      常规提示(数字id,"#Y/你开启了自动仙缘任务")
           --  else
           --      self:变更挂机(数字id,false)
           --      return 常规提示(数字id,"#Y/该功能还在开发中...")
           --  end
           常规提示(数字id,"#Y/你开启了活动挂机")
            玩家数据[数字id].角色.数据.内挂.运行 =true
           -- self.挂活动[数字id]={名称=活动表[内容.序列]}
        elseif 内容.页面 == 3 then
            self:变更挂机(数字id,true)
            常规提示(数字id,"#Y/你开启了自动抓鬼任务")
            -- 玩家数据[数字id].角色.数据.内挂.运行 =true
            -- self.挂抓鬼[数字id]={名称=抓鬼表[内容.序列]}
              玩家数据[数字id].自动抓鬼={
                        进程=1,
                        时间=os.time()+2,
                        开启=true,
                        事件=抓鬼表[内容.序列]
                    }
        end
 	elseif 序号 == 302 then
    	self:停止挂机(数字id)
    end
end

function 内挂处理类:开始挂机(数据)
    -- local 数字id = 数据.数字id + 0
    -- local n = 1
    -- self.挂明雷[数字id] ={}
    -- 玩家数据[数字id].角色.数据.内挂.明雷={}
    -- for i =1,#数据.序列 do
    --     if 数据.序列[i] then
    --          self.挂明雷[数字id][n] = 任务表[i]
    --          玩家数据[数字id].角色.数据.内挂.明雷[n]=true
    --          n=n+1
    --     end
    -- end
     local 数字id = 数据.数字id + 0

    local n = 1
    self.挂明雷[数字id] ={}

    for i =1,#数据.序列 do
        if 数据.序列[i] then
             self.挂明雷[数字id][n] = 任务表[i]
             玩家数据[数字id].角色.数据.内挂.明雷[i]=true
             n=n+1
        end
    end

    --table.print(玩家数据[数字id].角色.数据.内挂.明雷)
    玩家数据[数字id].角色.数据.内挂.运行=true
end

function 内挂处理类:变更挂机(id,状态)
	发送数据(玩家数据[id].连接id,169,状态)
end

function 内挂处理类:检查队员月卡(队伍id)
    if not 队伍数据[队伍id] or not 队伍数据[队伍id].成员数据 then
        return false, "队伍数据异常"
    end

    for _, 成员id in ipairs(队伍数据[队伍id].成员数据) do
        if 玩家数据[成员id] and 玩家数据[成员id].角色 and 玩家数据[成员id].角色.数据 then
            local 月卡数据 = 玩家数据[成员id].角色.数据.月卡
            if not 月卡数据 or not 月卡数据.开通 or os.time() >= 月卡数据.到期时间 then
                local 角色名称 = 玩家数据[成员id].角色.名称 or "未知角色"
                return false, "成员"..角色名称.."没有月卡或月卡已过期"
            end
        else
            return false, "有队员数据异常"
        end
    end
    return true
end

function 内挂处理类:挂机定时器()

    if self.time明雷[os.date("%S", os.time())] ~=nil then
        for k,v in pairs(self.挂明雷) do
            if 玩家数据[k]==nil or 玩家数据[k].角色.数据==nil or not 玩家数据[k].队长
                or 玩家数据[k].角色.数据.内挂.运行==false  then
                self.挂明雷[k] = nil
                if 玩家数据[k]~=nil and 玩家数据[k].角色~=nil then
                    玩家数据[k].角色.数据.内挂.运行=false
                    self:停止挂机(k)
                    if not 玩家数据[k].队长 then
                        常规提示(k,"#R/挂机必须组队进行")
                    else
                        常规提示(k,"#R/场景挂机已被强制停止")
                    end
                end

            else

                local 队伍id = 玩家数据[k].队伍
                local 月卡有效, 提示信息 = self:检查队员月卡(队伍id)
                if not 月卡有效 then
                    常规提示(k, "#R/"..提示信息..", 无法进行挂机！")
                    self.挂明雷[k] = nil
                    玩家数据[k].角色.数据.内挂.运行=false
                    self:停止挂机(k)
                else
                    self:明雷寻怪(k)
                end
            end
        end

    end

    if self.time活动[os.date("%S", os.time())] ~=nil then
        for k, v in pairs(self.挂活动) do
            if 玩家数据[k]==nil then
                return false
            end
            local 队伍id = 玩家数据[k].队伍
            local 月卡有效, 提示信息 = self:检查队员月卡(队伍id)
            if not 月卡有效 then
                常规提示(k, "#R/"..提示信息..", 无法进行活动挂机！")
                self.挂活动[k] = nil
                玩家数据[k].角色.数据.内挂.运行=false
                self:停止挂机(k)
            elseif self:活动可进行(k,v[1]) then
                if v[1] == "游泳比赛" then
                    if 玩家数据[k].角色:取任务(109) == 0 then
                        地图处理类:跳转地图(k,1092,140,60)
                        if not 任务处理类:添加游泳任务(k) then
                             table.remove(self.挂活动[k],1)
                            if #self.挂活动[k] == 0 then
                                self.挂活动[k] = nil
                                self:停止挂机(k)
                            end
                        end
                    else
                        self:执行游泳任务(k)
                    end
                elseif v[1] == "仙缘任务" then
                    if 玩家数据[k].角色:取任务(374) == 0 then

                        地图处理类:跳转地图(k,1001,245,116)
                        任务处理类:添加仙缘任务(k)
                    else
                        self:执行仙缘任务(k)
                    end
                elseif v[1] == "初出江湖"  then
                    if 玩家数据[k].角色:取任务(11) == 0 then
                        地图处理类:跳转地图(k,1001,233,110)
                        if not  任务处理类:添加江湖任务(k) then
                             table.remove(self.挂活动[k],1)
                            if #self.挂活动[k] == 0 then
                                self.挂活动[k] = nil
                                self:停止挂机(k)
                            end

                        end
                    else
                        self:执行江湖任务(k)
                    end
                elseif v[1] == "镖王活动"  then
                    if 玩家数据[k].角色:取任务(208) == 0 then
                        地图处理类:跳转地图(k,1024,26,29)
                         if not  任务处理类:添加镖王任务(k,"珍贵") then
                            table.remove(self.挂活动[k],1)
                            if #self.挂活动[k] == 0 then
                                self.挂活动[k] = nil
                                self:停止挂机(k)
                            end
                        end
                    else
                        self:执行镖王任务(k)
                    end
                elseif v[1] == "门派闯关"  then
                     if 玩家数据[k].角色:取任务(107) == 0 then
                        地图处理类:跳转地图(k,1001,133,92)
                        if not 任务处理类:添加闯关任务(k) then
                             table.remove(self.挂活动[k],1)
                            if #self.挂活动[k] == 0 then
                                self.挂活动[k] = nil
                                self:停止挂机(k)
                            end
                        end
                    else
                        self:执行闯关任务(k)
                    end
                end
            else

                table.remove(self.挂活动[k],1)
                if #self.挂活动[k] == 0 then
                    self.挂活动[k] = nil
                    self:停止挂机(k)
                end
            end
        end
    end

    if self.time抓鬼[os.date("%S", os.time())] ~=nil then
        for k,v in pairs(self.挂抓鬼) do
            if 玩家数据[k]==nil or 玩家数据[k].角色==nil or not 玩家数据[k].队长 then
                self.挂抓鬼[k] = nil
                if 玩家数据[k]~=nil and 玩家数据[k].角色~=nil then
                    玩家数据[k].角色.内挂.运行=false
                    发送数据(玩家数据[k].连接id, 169, {变更=false})
                    常规提示(k,"#R/抓鬼挂机已被强制停止")
                end
            else

                local 队伍id = 玩家数据[k].队伍
                local 月卡有效, 提示信息 = self:检查队员月卡(队伍id)
                if not 月卡有效 then
                    常规提示(k, "#R/"..提示信息..", 无法进行抓鬼挂机！")
                    self.挂抓鬼[k] = nil
                    if 玩家数据[k].角色 then
                        玩家数据[k].角色.内挂.运行=false
                    end
                    发送数据(玩家数据[k].连接id, 169, {变更=false})
                else
                    self:抓鬼流程(k)
                end
            end
        end
    end

end

function 内挂处理类:执行游泳任务(数字id)
    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local 任务id = 玩家数据[数字id].角色:取任务(109)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    local jr地图


    if 任务数据[任务id]~=nil then
        jr地图 = 任务数据[任务id].序列 and 游泳坐标[任务数据[任务id].序列] or nil
        if 任务数据[任务id].序列 and wj地图 ~= 游泳坐标[任务数据[任务id].序列].z or (jr地图 and 取两点距离(比较xy,jr地图) > 20) then
            地图处理类:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
        else
            local jrmc = 任务数据[任务id].序列 and (任务数据[任务id].序列 .."号裁判") or ""

            if 地图处理类.地图单位[wj地图] then
                for k,v in pairs(地图处理类.地图单位[wj地图]) do
                    if v.id and 任务数据[v.id]~=nil and 任务数据[任务id].序列 and 任务数据[v.id].名称 == jrmc and 任务数据[v.id].序列 == 任务数据[任务id].序列 then

                         if 任务数据[任务id].已战斗 or 取随机数()<=25 then
                              任务处理类:完成游泳任务(数字id)
                          else
                              战斗准备类:创建战斗(数字id+0,100012,任务id)
                              玩家数据[数字id].地图单位=nil
                          end
                    end
                end
            end
        end
    end

end

function 内挂处理类:执行仙缘任务(数字id)
    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local 任务id = 玩家数据[数字id].角色:取任务(374)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}



    if 任务数据[任务id]~=nil then
        local jr地图 = {x=任务数据[任务id].x,y=任务数据[任务id].y}

        if wj地图 ~= 任务数据[任务id].地图编号 or 取两点距离(比较xy,jr地图) > 20 then
            地图处理类:跳转地图(数字id,任务数据[任务id].地图编号,jr地图.x,jr地图.y)
        else

                任务数据[任务id].战斗=true
                战斗准备类:创建战斗(数字id+0,110029,任务id)
                玩家数据[数字id].地图单位=nil



        end

    end
end

function 内挂处理类:执行江湖任务(数字id)

    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local 任务id = 玩家数据[数字id].角色:取任务(11)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}

    if 任务数据[任务id]~=nil then
        local jr地图 = {x=任务数据[任务id].x,y=任务数据[任务id].y}
        if wj地图 ~= 任务数据[任务id].地图编号 or 取两点距离(比较xy,jr地图) > 20 then
            地图处理类:跳转地图(数字id,任务数据[任务id].地图编号,jr地图.x,jr地图.y)
        else
             任务数据[任务id].战斗=true
             战斗准备类:创建战斗(数字id+0,100021,任务id)
             玩家数据[数字id].地图单位=nil
        end
    end

end

function 内挂处理类:执行镖王任务(数字id)
    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local 任务id = 玩家数据[数字id].角色:取任务(208)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}

    if 任务数据[任务id]~=nil then
        local jr地图 = {x=任务数据[任务id].x,y=任务数据[任务id].y}
        if wj地图 ~= 任务数据[任务id].地图编号 or 取两点距离(比较xy,jr地图) > 20 then
            地图处理类:跳转地图(数字id,任务数据[任务id].地图编号,jr地图.x,jr地图.y)
        else
            战斗准备类:创建战斗(数字id+0,100025,任务id)
            玩家数据[数字id].地图单位=nil
        end
    end
end

function 内挂处理类:执行闯关任务(数字id)
    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local 任务id = 玩家数据[数字id].角色:取任务(107)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    --任务数据[任务id].当前序列
     if 任务数据[任务id]~=nil then
         --table.print(任务数据[任务id].闯关序列)
        local n = 任务数据[任务id].当前序列
        local data = 任务数据[任务id].闯关序列[n]
        local qmpdt = 取门派地图(data)
        --table.print(qmpdt)
        local jr地图 = {z=qmpdt[1],x=qmpdt[2],y=qmpdt[3]}

        if wj地图 ~= jr地图.z or 取两点距离(比较xy,jr地图) > 20 then
            地图处理类:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
        else
            战斗准备类:创建战斗(数字id+0,100011,任务id)
        end
    end
end

function 内挂处理类:活动可进行(数字id,活动)

    local 队伍id = 玩家数据[数字id].队伍
    local 月卡有效, 提示信息 = self:检查队员月卡(队伍id)
    if not 月卡有效 then
        常规提示(数字id, "#R/"..提示信息)
        return false
    end

    if 活动 == "游泳比赛" then
        if  玩家数据[数字id].队伍 == 0 then
            常规提示(数字id,"#Y/该活动必须组队进行")
            return false
        elseif 活动次数查询(数字id,"游泳比赛")==false then
            return false
        elseif 任务处理类:触发条件(数字id,30,109,"游泳比赛",1,3,true) then--id,等级,任务,活动,队伍,人数
              return false
        end
    elseif 活动 == "仙缘任务" then
        if  玩家数据[数字id].队伍 == 0 then
            常规提示(数字id,"#Y/该活动必须组队进行")
            return false
        elseif 活动次数查询(数字id,"仙缘任务")==false then
            return false
        elseif 任务处理类:触发条件(数字id,69,374,"仙缘活动",1,nil,true) then--id,等级,任务,活动,队伍,人数
              return false
        end
    elseif 活动 == "初出江湖" then
        if  玩家数据[数字id].队伍 == 0 then
            常规提示(数字id,"#Y/该活动必须组队进行")
            return false
        elseif 活动次数查询(数字id,"初出江湖")==false then
            return false
        elseif 任务处理类:触发条件(数字id,30,11,"初出江湖",1,3,true) then--id,等级,任务,活动,队伍,人数
              return false
        end
    elseif 活动 == "镖王活动" then
        if  玩家数据[数字id].队伍 == 0 then
            常规提示(数字id,"#Y/该活动必须组队进行")
            return false
        elseif 活动次数查询(数字id,"镖王活动")==false then
            return false
        elseif 任务处理类:触发条件(数字id,69,208,"镖王活动",1,3,true) then--id,等级,任务,活动,队伍,人数
              return false
        end
    elseif 活动 == "门派闯关" then
         if  玩家数据[数字id].队伍 == 0 then
            常规提示(数字id,"#Y/该活动必须组队进行")
            return false
        elseif 活动次数查询(数字id,"门派闯关")==false then
            return false
        elseif 任务处理类:触发条件(数字id,30,107,"门派闯关",1,3,true) then--id,等级,任务,活动,队伍,人数
            return false
        end
    end
    return true
end

function 内挂处理类:明雷寻怪(数字id)

    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local data = 玩家数据[数字id].角色.数据.内挂.明雷
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}


    local 还有可用明怪 = false
    for k,v in pairs(self.明雷表) do
        if data[k] then
            if 活动次数查询(数字id, v.名称) == false then
                data[k] = nil
                常规提示(数字id, "#Y/"..v.名称.."次数已用完，已自动取消该明怪的挂机")
            else
                还有可用明怪 = true
            end
        end
    end


    if not 还有可用明怪 then
        常规提示(数字id, "#R/所有选中的明怪次数已用完，自动关闭挂机系统")
        self:停止挂机(数字id)
        return
    end

    self.挂明雷[数字id] = {}
    local n = 1
    for k,v in pairs(self.明雷表) do
        if data[k] then
            self.挂明雷[数字id][n] = v.名称
            n = n + 1
        end
    end

   if 玩家数据[数字id].角色.数据.内挂.临时怪物 then

        local tmp = 玩家数据[数字id].角色.数据.内挂.临时怪物
        local 对话内容 = self.对话单位:地图单位对话(玩家数据[数字id].连接id,数字id, tmp.编号,tmp.id,tmp.地图编号)

        if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then
            self.活动NPC对话:活动选项解析(玩家数据[数字id].连接id,数字id,序号,对话内容.选项,true)
        end
         玩家数据[数字id].角色.数据.内挂.临时怪物=nil
        return
    end


    for k,v in pairs(self.明雷表) do
        if data[k] and 取随机数()<=50 then
            for kn,vn in pairs(任务数据) do
                if not vn.战斗 then
                    for cn=1,#v.类型组 do
                        if vn.类型 == v.类型组[cn] then
                            if wj地图~= vn.地图编号 or 取两点距离(比较xy,vn) > 20 then
                                地图处理类:跳转地图(数字id,vn.地图编号,vn.x,vn.y)
                                玩家数据[数字id].角色.数据.内挂.临时怪物={}
                                玩家数据[数字id].角色.数据.内挂.临时怪物 = vn
                                return
                            else
                                local 对话内容 = self.对话单位:地图单位对话(玩家数据[数字id].连接id,数字id, vn.编号,vn.id,vn.地图编号)
                                if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then
                                    self.活动NPC对话:活动选项解析(玩家数据[数字id].连接id,数字id,序号,对话内容.选项,true)
                                    return
                                end
                            end
                            return
                        end
                    end
                end
            end
        end
    end


    for k,v in pairs(self.明雷表) do
        if data[k] then
            for kn,vn in pairs(任务数据) do
                if not vn.战斗 then
                    for cn=1,#v.类型组 do
                        if vn.类型 == v.类型组[cn] then
                            if wj地图~= vn.地图编号 or 取两点距离(比较xy,vn) > 20 then
                                地图处理类:跳转地图(数字id,vn.地图编号,vn.x,vn.y)
                                玩家数据[数字id].角色.数据.内挂.临时怪物={}
                                玩家数据[数字id].角色.数据.内挂.临时怪物 = vn
                                return
                            else
                                local 对话内容 = self.对话单位:地图单位对话(玩家数据[数字id].连接id,数字id, vn.编号,vn.id,vn.地图编号)
                                if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then
                                    self.活动NPC对话:活动选项解析(玩家数据[数字id].连接id,数字id,序号,对话内容.选项,true)
                                    return
                                end
                            end
                            return
                        end
                    end
                end
            end
        end
    end
end



        ----------------------------------------------------抓鬼处理
function 内挂处理类:抓鬼流程(数字id) --单人处理

    if 玩家数据[数字id].zhandou ~= nil or not 玩家数据[数字id].队长 then return end

    -- if self:有人不可飞行(数字id) then
    --     return
    -- end
   --local data = 玩家数据[数字id].角色.内挂.抓鬼
    for k,v in pairs(self.挂抓鬼) do
       -- print(k,v)
        --table.print(v)
       -- if data[k] then
            if v.名称=="抓鬼任务" then
                self:普通抓鬼流程(数字id)
            elseif v.名称=="鬼王任务" then
                self:自动鬼王流程(数字id)
            end
            break
       -- end
    end
end

function 内挂处理类:普通抓鬼流程(数字id)
     print("抓鬼流程",数字id)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    local 任务id = 玩家数据[数字id].角色:取任务(8)
    local 钟馗xy = {X=56,Y=65}
    local jr地图= {z=1122,x=钟馗xy.X,y=钟馗xy.Y}
    if 任务id==0 then
        if wj地图 ~= 1122 or 取两点距离(比较xy,jr地图) > 20 then
            地图处理类:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
        else
            --设置任务8(数字id)
             任务处理类:添加抓鬼任务(数字id)
        end
    else
        local jg地图 = {z=任务数据[任务id].地图编号,x=任务数据[任务id].x,y=任务数据[任务id].y}
        if wj地图 ~= jg地图.z or 取两点距离(比较xy,jg地图) > 20 then
            地图处理类:跳转地图(数字id,jg地图.z,jg地图.x,jg地图.y)
        else
            for k,v in pairs(地图处理类.地图单位[jg地图.z]) do
                if v.id == 任务id then
                    local 对话内容 = ——GWdh111[任务数据[v.id].类型](玩家数据[数字id].连接id,数字id,任务数据[v.id].序列,任务数据[v.id].id,jg地图.z)
                    if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then
                        玩家数据[数字id].地图单位={地图=任务数据[v.id].地图编号,标识=任务数据[v.id].id,编号=任务数据[v.id].编号}
                        ——GWdh222[任务数据[v.id].类型](玩家数据[数字id].连接id,数字id,nil,对话内容.选项)
                    end
                    break
                end
            end
        end
    end
end

function 内挂处理类:自动鬼王流程(数字id)
    local wj地图 = 玩家数据[数字id].角色.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    local 任务id=玩家数据[数字id].角色:取任务(14)
    if 任务id==0 then
        if wj地图 ~= 1125 then
            地图处理类:跳转地图(数字id,1125,35,27)
        else
            设置任务14(数字id)
        end
    else
        local jg地图 = {z=任务数据[任务id].地图编号,x=任务数据[任务id].x,y=任务数据[任务id].y}
        if wj地图 ~= jg地图.z or 取两点距离(比较xy,jg地图) > 20 then
            地图处理类:跳转地图(数字id,jg地图.z,jg地图.x,jg地图.y)
        else
            for k,v in pairs(地图处理类.地图单位[jg地图.z]) do
                if v.id == 任务id then
                    local 对话内容 = ——GWdh111[任务数据[v.id].类型](玩家数据[数字id].连接id,数字id,任务数据[v.id].序列,任务数据[v.id].id,jg地图.z)
                    if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then
                        玩家数据[数字id].地图单位={地图=任务数据[v.id].地图编号,标识=任务数据[v.id].id,编号=任务数据[v.id].编号}
                         ——GWdh222[任务数据[v.id].类型](玩家数据[数字id].连接id,数字id,nil,对话内容.选项)
                    end
                    break
                end
            end
        end
    end
end

function 内挂处理类:抓鬼可进行(数字id,mc)
    local 队伍id = 玩家数据[数字id].队伍
    local 月卡有效, 提示信息 = self:检查队员月卡(队伍id)
    if not 月卡有效 then
        return "#R/"..提示信息
    end

    if mc == "自动抓鬼" then
        if 玩家数据[数字id].队伍==0 or 玩家数据[数字id].队长==false  then
            return "#Y/该任务必须组队完成且由队长领取"
        elseif 取队伍最低等级(玩家数据[数字id].队伍,20) then
            return "#Y/等级小于20级的玩家无法领取此任务"
        elseif 取队伍任务(玩家数据[数字id].队伍,8) then
            return "#Y/队伍中已有队员领取过此任务了"
        end
    elseif mc == "自动鬼王" then
        if 玩家数据[数字id].队伍==0 or 玩家数据[数字id].队长==false  then
            return "#Y/该任务必须组队完成且由队长领取"
        elseif 取队伍最低等级(玩家数据[数字id].队伍,100) then --100
            return "#Y/等级小于100级的玩家无法领取此任务"
        elseif 取队伍任务(玩家数据[数字id].队伍,14) then
            return "#Y/队伍中已有队员领取过此任务了"
        end
    end
    return true
end

function 内挂处理类:停止挂机(id)

    if self.挂明雷[id] then self.挂明雷[id]=nil end
    if self.挂活动[id] then self.挂活动[id]=nil end
    self:变更挂机(id,false)
--    玩家数据[id].角色.数据.内挂.运行=false
	发送数据(玩家数据[id].连接id,169,false)
    if  玩家数据[id].自动抓鬼 then 玩家数据[id].自动抓鬼=false end
end

function 内挂处理类:置角色内挂数据(数字id,类型)
      if 玩家数据[数字id].角色.数据.内挂==nil then
        玩家数据[数字id].角色.数据.内挂={运行=false}
    end

    if 类型 == 1 then
        if 玩家数据[数字id].角色.数据.内挂.明雷==nil then
            玩家数据[数字id].角色.数据.内挂.明雷={}
        end

           for n=1,50 do
            if self.明雷表[n]~=nil then
                --if 玩家数据[数字id].角色.数据.内挂.明雷[n]==nil then
                    玩家数据[数字id].角色.数据.内挂.明雷[n] = false
                --end
            else
                玩家数据[数字id].角色.数据.内挂.明雷[n] = nil
            end
        end
    elseif 类型 == 2 then
        玩家数据[数字id].角色.数据.内挂.活动={}





    end

end

return 内挂处理类