-- @Author: baidwwy
-- @Date:   2024-08-21 11:47:40
-- @Last Modified by:   tangguo
-- @Last Modified time: 2025-10-13 19:43:02
local 辅助内挂类 = class()
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

function 辅助内挂类:初始化()
    -- self.对话单位= require("Script/对话处理类/对话内容")()
    self.活动NPC对话内容= require("Script/对话处理类/对话内容")()
    -- self.活动NPC对话 = require("Script/对话处理类/对话处理")()
    self.活动NPC对话处理 = require("Script/对话处理类/对话处理")()
    self.活动内容 = require("Script/对话处理类/活动内容")()
    self.活动处理 = require("Script/对话处理类/活动处理")()
    self.time明雷 = {
      ["01"]=true, ["06"]=true, ["11"]=true,
      ["16"]=true, ["21"]=true, ["26"]=true,
      ["31"]=true, ["36"]=true, ["41"]=true,
      ["46"]=true, ["51"]=true, ["56"]=true
    }


    self.time活动 = {
      ["03"]=true, ["08"]=true, ["13"]=true,
      ["18"]=true, ["23"]=true, ["28"]=true,
      ["33"]=true, ["38"]=true, ["43"]=true,
      ["48"]=true, ["53"]=true, ["58"]=true
    }


    self.time抓鬼 = {
      ["00"]=true, ["05"]=true, ["10"]=true,
      ["15"]=true, ["20"]=true, ["25"]=true,
      ["30"]=true, ["35"]=true, ["40"]=true,
      ["45"]=true, ["50"]=true, ["55"]=true
    }


    self.明雷表={}
    self.活动表={}
    self.抓鬼表={}
    self.挂明雷={}
    self.挂活动={}
    self.挂抓鬼={}
    self:初始化明雷表()
    self:初始化活动表()
    self:初始化抓鬼表()

    -- 新增门派闯关次数记录表
    self.门派闯关次数 = {}
end

function 辅助内挂类:初始化明雷表() --最多24个
    self.明雷表={
        [1]={名称 ="经验宝宝", 类型组 ={360}},
        [2]={名称 ="财神爷", 类型组 ={373}},
        [3]={名称 ="天降灵猴", 类型组 ={359}},
        [4]={名称 ="糖果派对", 类型组 ={129}},
[5]={名称 ="四墓灵鼠", 类型组 ={318}},
[6]={名称 ="妖魔鬼怪", 类型组 ={105}},
[7]={名称="知了先锋",类型组={305}},
[8]={名称 ="捣乱的年兽", 类型组 ={356}},
[9]={名称 ="新冠病毒", 类型组 ={355}},
[10]={名称 ="倔强青铜", 类型组 ={361}},
[11]={名称 ="秩序白银", 类型组 ={362}},
[12]={名称 ="星宿", 类型组 ={104}},
[13]={名称 ="天庭叛逆", 类型组 ={128}},
[14]={名称 ="十二生肖", 类型组 ={385}},
[15]={名称 ="新春快乐", 类型组 ={399}},
[16]={名称 ="门派入侵", 类型组 ={315}},
[17]={名称 ="知了王", 类型组 ={210}},
[18]={名称 ="邪恶年兽", 类型组 ={358}},
[19]={名称 ="荣耀黄金", 类型组 ={363}},
[20]={名称 ="永恒钻石", 类型组 ={364}},
[21]={名称 ="至尊星耀", 类型组 ={365}},
[22]={名称 ="年兽王", 类型组 ={387}},
[23]={名称 ="最强王者", 类型组 ={366}},
[24]={名称 ="五圣兽 (60-89)", 类型组 ={368,369,370,371,372}},
[25]={名称 ="星官", 类型组 ={367}},
[26]={名称 ="桐人", 类型组 ={386}},
[27]={名称 ="魔化桐人", 类型组 ={387}},
[28]={名称 ="混世魔王", 类型组 ={388}},
[29]={名称 ="万象福", 类型组 ={389}},
[30]={名称 ="小小盲僧", 类型组 ={336}},
[31]={名称 ="创世佛屠", 类型组 ={306}},
[32]={名称 ="善恶如来", 类型组 ={310}}


    }
end

function 辅助内挂类:初始化活动表() --最多10个
    self.活动表={
        [1]={名称="门派闯关",类型组={0}},
        [2]={名称="游泳比赛",类型组={0}},
        [3]={名称="仙缘活动",类型组={0}},
    }
end

function 辅助内挂类:初始化抓鬼表()
    self.抓鬼表={
        [1]={名称="自动抓鬼",类型组={0}},
        [2]={名称="自动鬼王",类型组={0}},
        [3]={名称="镇妖塔",类型组={0}},
    }
end

function 辅助内挂类:数据处理(序号, 内容)
    local 数字id = 内容.数字id + 0
    -- 玩家数据[self.数字id].角色.数据.月卡={购买时间=0,到期时间=0,当前领取=0,开通=false}

    if 玩家数据[数字id].角色.数据.月卡 == nil then
        玩家数据[数字id].角色.数据.月卡 = {开通=false,到期时间=0}
    end

    if 玩家数据[数字id]==nil then return end
    if 序号 == 550 then --辅助内挂
        self:置角色内挂数据(数字id)
        -- local ngvip = 玩家数据[数字id].角色.数据.月卡.开通
        local ngvip = 玩家数据[数字id].角色.数据.月卡.开通
        local data = table.copy(玩家数据[数字id].角色.内挂)
        发送数据(玩家数据[数字id].连接id, 550, {vip=ngvip, mlb=self.明雷表, hdb=self.活动表, zgb=self.抓鬼表,data=data})
    elseif 序号 == 551 then --保存配置
        self:置角色内挂数据(数字id)
        玩家数据[数字id].角色.内挂.明雷 = 内容.明雷
        玩家数据[数字id].角色.内挂.活动 = 内容.活动
        玩家数据[数字id].角色.内挂.抓鬼 = 内容.抓鬼
        local data = table.copy(玩家数据[数字id].角色.内挂)
        -- print("猜测变更挂机")
        -- table.print(data)
        发送数据(玩家数据[数字id].连接id, 552, data)
    elseif 序号 == 552 then --开始、结束、挂机
        -- print("变更挂机")
        self:变更挂机(数字id,内容.界面,内容.变更)
    elseif 序号 == 553 then --关闭界面自动停止挂机
        if self.挂明雷[数字id]~=nil or self.挂活动[数字id]~=nil or self.挂抓鬼[数字id]~=nil then
            常规提示(数字id,"#Y/关闭界面自动#R/停止挂机")
        end
        self:关闭所有挂机(数字id)
    end
end


function 辅助内挂类:停止挂机(id)

    if self.挂明雷[id] then self.挂明雷[id]=nil end
    if self.挂活动[id] then self.挂活动[id]=nil end
    self:变更挂机(id,false)
--    玩家数据[id].角色.数据.内挂.运行=false
    发送数据(玩家数据[id].连接id,169,false)
    if  玩家数据[id].自动抓鬼 then 玩家数据[id].自动抓鬼=false end
end

function 辅助内挂类:变更挂机(数字id,jm,bg)
    self:关闭其它挂机(数字id,jm)
    local abc = {"挂明雷","挂活动","挂抓鬼"}
    local wjb = {"明雷","活动","抓鬼"}
    for n=1,3 do
        if n==jm then
            if bg then
                if 玩家数据[数字id].角色.数据.月卡.开通 then
                    if 玩家数据[数字id].队长 then
                        local go = false
                        local 队伍id = 玩家数据[数字id].队伍
                        for n=1,#队伍数据[队伍id].成员数据 do
                            if 玩家数据[队伍数据[队伍id].成员数据[n]].道具:取禁止飞行(队伍数据[队伍id].成员数据[n]) then
                                发送数据(玩家数据[数字id].连接id, 551, {变更=false})
                                常规提示(数字id,format("#Y/%s#R/当前不能传送,禁止挂机",玩家数据[队伍数据[队伍id].成员数据[n]].角色.名称))
                                return
                            end
                        end
                        for an=1,#玩家数据[数字id].角色.内挂[wjb[n]] do
                            if 玩家数据[数字id].角色.内挂[wjb[n]][an] then
                                go = true
                            end
                        end
                        if wjb[n] == "活动" then
                            local 提示 = ""
                            for wjbk,wjbv in pairs(self.活动表) do
                                if 玩家数据[数字id].角色.内挂.活动[wjbk] then
                                    提示 = self:活动可进行(数字id,wjbv.名称)
                                    if 提示~=true then
                                        self.挂活动[数字id] = nil
                                        发送数据(玩家数据[数字id].连接id, 551, {变更=false})
                                        发送数据(玩家数据[数字id].连接id,1501,{名称=玩家数据[数字id].角色.名称,模型=玩家数据[数字id].角色.模型,对话=提示})
                                        return
                                    end
                                end
                            end
                        elseif wjb[n] == "抓鬼" then
                            local 提示 = ""
                            for wjbk,wjbv in pairs(self.抓鬼表) do
                                if 玩家数据[数字id].角色.内挂.抓鬼[wjbk] then
                                    提示 = self:抓鬼可进行(数字id,wjbv.名称)
                                    if 提示~=true then
                                        self.挂抓鬼[数字id] = nil
                                        发送数据(玩家数据[数字id].连接id, 551, {变更=false})
                                        发送数据(玩家数据[数字id].连接id,1501,{名称=玩家数据[数字id].角色.名称,模型=玩家数据[数字id].角色.模型,对话=提示})
                                        return
                                    end
                                end
                            end
                        end
                        if go then
                            self[abc[n]][数字id] = {}
                            常规提示(数字id,"#G/已开始挂机。")
                        else
                            发送数据(玩家数据[数字id].连接id, 551, {变更=false})
                            常规提示(数字id,"#Y/至少有一个选项才可挂机。")
                        end
                    else
                        发送数据(玩家数据[数字id].连接id, 551, {变更=false})
                        常规提示(数字id,"#Y/只有队长才可挂机。")
                    end
                else
                    self:关闭所有挂机(数字id)
                    发送数据(玩家数据[数字id].连接id, 551, {变更=false})
                    常规提示(数字id,"#Y/你不是会员禁止挂机。")
                end
            else
                if self.挂明雷[数字id]~=nil or self.挂活动[数字id]~=nil or self.挂抓鬼[数字id]~=nil then
                    常规提示(数字id,"#Y/你已#R/停止挂机")
                end
                self:关闭所有挂机(数字id)
            end
            break
        end
    end
end

function 辅助内挂类:挂机定时器(时间)
    if self.time明雷[时间] then
        for k,v in pairs(self.挂明雷) do
            if 玩家数据[k]==nil or 玩家数据[k].角色==nil or not 玩家数据[k].队长 or not 玩家数据[k].角色.数据.月卡.开通 then
                self.挂明雷[k] = nil
                if 玩家数据[k]~=nil and 玩家数据[k].角色~=nil then
                    发送数据(玩家数据[k].连接id, 551, {变更=false})
                    常规提示(k,"#R/场景挂机已被强制停止")
                end
            else
                self:明雷寻怪(k)
            end
        end
    elseif self.time活动[时间] then
        for k,v in pairs(self.挂活动) do
            if 玩家数据[k]==nil or 玩家数据[k].角色==nil or not 玩家数据[k].队长 or not 玩家数据[k].角色.数据.月卡.开通 then
                self.挂活动[k] = nil
                if 玩家数据[k]~=nil and 玩家数据[k].角色~=nil then
                    发送数据(玩家数据[k].连接id, 551, {变更=false})
                    常规提示(k,"#R/活动挂机已被强制停止")
                end
            else
                self:活动流程(k)
            end
        end
    elseif self.time抓鬼[时间] then
        for k,v in pairs(self.挂抓鬼) do
            if 玩家数据[k]==nil or 玩家数据[k].角色==nil or not 玩家数据[k].队长 or not 玩家数据[k].角色.数据.月卡.开通 then
                self.挂抓鬼[k] = nil
                if 玩家数据[k]~=nil and 玩家数据[k].角色~=nil then
                    发送数据(玩家数据[k].连接id, 551, {变更=false})
                    常规提示(k,"#R/抓鬼挂机已被强制停止")
                end
            else
                self:抓鬼流程(k)
            end
        end
    end
end

function 辅助内挂类:明雷寻怪(数字id)
    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local data = 玩家数据[数字id].角色.内挂.明雷
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y

    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    if self:有人不可飞行(数字id) then
        return
    end
    for k,v in pairs(self.明雷表) do
        if data[k] then
            for kn,vn in pairs(任务数据) do

                if not vn.战斗 then
                    for cn=1,#v.类型组 do
                        if vn.类型 == v.类型组[cn] then
                            -- print("当前活动次数")
                            -- table.print(vn)
                            -- print(活动次数["天降灵猴"][数字id])
                                            -- 判断活动次数
                            -- print("打印活动次数")
                            -- print(table.tostring(活动次数))
                            -- print("打印任务数据")
                            -- print(kn)
                            -- print(table.tostring(vn))

                            -- print("打印明雷表的序号")
                            -- print(k,table.tostring(v))
                            -- 判断活动次数
                            -- print(活动次数)
                            if wj地图~= vn.地图编号  or 取两点距离(比较xy,vn) > 20 then
                                self:跳转地图(数字id,vn.地图编号,vn.x,vn.y)
                                return
                            else
                                if 活动次数查询(数字id, vn.名称) then
                                    local 对话内容 = self.活动内容:地图单位对话(玩家数据[数字id].连接id,数字id,任务数据[vn.id].编号,vn.id,任务数据[vn.id].地图编号)
                                    if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then
                                        self.活动处理:活动选项解析(玩家数据[数字id].连接id,数字id,nil,对话内容.选项)
                                        玩家数据[数字id].地图单位=nil
                                        return
                                    end
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

function 辅助内挂类:战斗失败记录(数字id,rwid)
    if 任务数据[rwid]==nil or 玩家数据[数字id]==nil or 玩家数据[数字id].角色.内挂==nil then return end
    if self.挂明雷[数字id]~=nil then
        for k,v in pairs(self.明雷表) do
            for an=1,#v.类型组 do
                if v.类型组[an]==任务数据[rwid].类型 then
                    local xbh = 任务数据[rwid].类型
                    if self.挂明雷[数字id][xbh]==nil then
                        self.挂明雷[数字id][xbh] = 0
                    end
                    self.挂明雷[数字id][xbh] = self.挂明雷[数字id][xbh] + 1
                    if self.挂明雷[数字id][xbh] >= 10 then
                        玩家数据[数字id].角色.内挂.明雷[k] = false
                        local data = table.copy(玩家数据[数字id].角色.内挂)
                        发送数据(玩家数据[数字id].连接id, 552, data)
                        常规提示(数字id,"#Y/与#R/" ..v.名称 .."#Y/的战斗死亡过多，自动剔除。")
                    end
                    return
                end
            end
        end
    end
end

function 辅助内挂类:活动流程(数字id)
    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local data = 玩家数据[数字id].角色.内挂.活动
    local 提示 = ""
    for k,v in pairs(self.活动表) do
        if data[k] then
            -- 新增门派闯关次数检查
            if v.名称 == "门派闯关" then
                if self.门派闯关次数[数字id] and self.门派闯关次数[数字id] >= 15 then
                    玩家数据[数字id].角色.内挂.活动[k] = false
                    发送数据(玩家数据[数字id].连接id, 551, {变更=false})
                    常规提示(数字id,"#Y/今日已完成1轮门派闯关活动，请明日再来")
                    return
                end
            end

            提示 = self:活动可进行(数字id,v.名称)
            if 提示 == true then
                if v.名称=="门派闯关" and 玩家数据[数字id].角色:取任务(107)~=0 then
                    self:门派闯关进程(数字id)
                elseif v.名称=="游泳比赛" and 玩家数据[数字id].角色:取任务(109)~=0 then
                    self:游泳活动进程(数字id)

                elseif v.名称=="仙缘活动" and 玩家数据[数字id].角色:取任务(374)~=0 then
                    self:仙缘活动进程(数字id)

                else
                    self:接活动任务(数字id,v.名称)
                end
            else
                self.挂活动[数字id] = nil
                发送数据(玩家数据[数字id].连接id, 551, {变更=false})
                发送数据(玩家数据[数字id].连接id,1501,{名称=玩家数据[数字id].角色.名称,模型=玩家数据[数字id].角色.模型,对话=提示})
            end
            break
        end
    end
end

function 辅助内挂类:跳转地图(数字id, 地图编号, x,y)
    local 坐标偏移 = 10
    local x = x + 坐标偏移
    local y = y + 坐标偏移
    地图处理类:跳转地图(数字id,地图编号,x,y)

end


function 辅助内挂类:接活动任务(数字id,hdmc)


    local 队伍id = 玩家数据[数字id].队伍
    for n=1,#队伍数据[队伍id].成员数据 do
        if 玩家数据[队伍数据[队伍id].成员数据[n]].道具:取禁止飞行(队伍数据[队伍id].成员数据[n]) then
            for k,v in pairs(self.活动表) do
                玩家数据[数字id].角色.内挂.活动[k]=nil
                self.活动表[数字id] = nil
            end
            发送数据(玩家数据[数字id].连接id, 551, {变更=false})
            常规提示(数字id,format("#Y/%s#R/当前不能传送,禁止挂机",玩家数据[队伍数据[队伍id].成员数据[n]].角色.名称))
            return
        end
    end

    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}

    if hdmc=="门派闯关" then
        local jr地图= {z=1001, x=132,y=91}
        if wj地图 ~= jr地图.z or 取两点距离(比较xy,jr地图) > 20 then
            self:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
        else
            任务处理类:添加闯关任务(数字id)
        end
    elseif hdmc=="游泳比赛" then
        local jr地图= {z=1092, x=141,y=60}
        if wj地图 ~= jr地图.z or 取两点距离(比较xy,jr地图) > 20 then
            self:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
        else
            任务处理类:添加游泳任务(数字id)
        end
    elseif hdmc=="仙缘活动" then
        local jr地图= {z=1001, x=249,y=112}
        if wj地图 ~= jr地图.z or 取两点距离(比较xy,jr地图) > 20 then
            self:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
        else
            任务处理类:添加仙缘任务(数字id)
        end
    end
end

function 辅助内挂类:活动可进行(数字id,hdmc)


    if hdmc=="门派闯关" then
        local 活动开关 = 闯关参数.开关
        if 活动开关 and 玩家数据[数字id].角色:取任务(107)~=0 then
            local 队长任务=玩家数据[数字id].角色:取任务(107)
            if 队长任务~=0 then
                local 当前=任务数据[队长任务].当前序列
                local 队伍id=玩家数据[数字id].队伍
                for n=1,#队伍数据[队伍id].成员数据 do
                    local cyid=队伍数据[队伍id].成员数据[n]
                    local 队员任务=玩家数据[cyid].角色:取任务(107)
                    if 队员任务~=0 then
                        if 当前~= 任务数据[队员任务].当前序列 then
                            return "队友。"..玩家数据[cyid].角色.名称.."任务NPC与队长不一致"
                        end
                    else
                        return "队友。"..玩家数据[cyid].角色.名称.."没有领取任务"
                    end
                end
            end
            return true
        elseif 活动开关 then --无任务
            if 玩家数据[数字id].队伍==0 then
                return "少侠别拿我开玩笑了……你连队伍都没有？"
            elseif 玩家数据[数字id].队伍==0 or 取队伍人数(数字id)<3 or 取队伍最低等级(玩家数据[数字id].队伍,40) then
                return "门派闯关参与条件：≥40级，≥3人"
            elseif 玩家数据[数字id].队长==false then
                return "这种重要的事情还是让队长来吧！"
            else
                local 队伍id=玩家数据[数字id].队伍
                for n=1,#队伍数据[队伍id].成员数据 do
                    local cyid=队伍数据[队伍id].成员数据[n]
                    if 玩家数据[cyid].角色:取任务(107)~=0 then
                        return 玩家数据[cyid].角色.名称.."已经领取过任务了"
                    end
                end
            end
            return true
        else
            return "门派闯关未开启"
        end
    elseif hdmc=="游泳比赛" then
        local 活动开关 = 游泳开关
        if 活动开关 and 玩家数据[数字id].角色:取任务(109)~=0 then
            return true
        elseif 活动开关 then --无任务
            if 玩家数据[数字id].队伍==0 then
                return "此活动最少需要三人组队参加。"
            elseif 取队伍人数(数字id) < 3 then
                return "此活动最少需要三人组队参加。"
            elseif 取等级要求(数字id,30)==false then
                return "游泳比赛活动要求最低等级不能小于30级，队伍中有成员等级未达到此要求。"
            else
                local 队伍id=玩家数据[数字id].队伍
                for n=1,#队伍数据[队伍id].成员数据 do
                    local 队员id = 队伍数据[队伍id].成员数据[n]
                    if 玩家数据[队员id].角色:取任务(109)~=0 then
                        return "#Y/" ..玩家数据[队员id].角色.名称 .."已经领取过任务了"

                    end
                end
                return true
            end
        else
            return "游泳比赛未开启"
        end
    elseif hdmc=="仙缘活动" then
        if 玩家数据[数字id].角色:取任务(374)~=0 then
            return true
        end

        if not 任务处理类:触发条件(数字id,69,374,"仙缘活动",1) then--id,等级,任务,活动,队伍,人数
          return true
        end
    end
    return "活动未开启"
end

function 辅助内挂类:游泳活动进程(数字id)
    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local 任务id = 玩家数据[数字id].角色:取任务(109)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    local jr地图 = 游泳坐标[任务数据[任务id].序列]
    if 任务数据[任务id]~=nil then
        if wj地图 ~= 游泳坐标[任务数据[任务id].序列].z or 取两点距离(比较xy,jr地图) > 20 then
            地图处理类:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
        else
            local jrmc = 任务数据[任务id].序列 .."号裁判"
            for k,v in pairs(地图处理类.地图单位[wj地图]) do
                if 任务数据[v.id]~=nil and 任务数据[v.id].名称 == jrmc and 任务数据[v.id].序列 == 任务数据[任务id].序列 then
                    -- local 对话内容 = self.对话单位:活动对话NR(数字id,任务数据[v.id].单位编号,任务数据[v.id].id,任务数据[v.id].地图编号,任务数据[v.id].类型)
                    local 对话内容 = self.活动内容:地图单位对话(玩家数据[数字id].连接id,数字id,任务数据[v.id].编号,v.id,任务数据[v.id].地图编号)

                    if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then

                        玩家数据[数字id].地图单位={地图=任务数据[v.id].地图编号,标识=任务数据[v.id].id,编号=任务数据[v.id].序列}
                        -- self.活动NPC对话:活动对话CL(数字id,对话内容.名称,对话内容.选项[1],任务数据[v.id].类型,任务数据[v.id].id)
                        self.活动处理:活动选项解析(玩家数据[数字id].连接id,数字id,nil,对话内容.选项)

                    end
                    break
                end
            end
        end
    end
end


function 辅助内挂类:仙缘活动进程(数字id)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    local 任务id = 玩家数据[数字id].角色:取任务(374)
    local jr地图= {z=1001,x=249,y=112}
    if 任务id==0 then
        if wj地图 ~= 1001 or 取两点距离(比较xy,jr地图) > 20 then
            self:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
        else
            任务处理类:添加仙缘任务(数字id)
        end
    else
        local jg地图 = {z=任务数据[任务id].地图编号,x=任务数据[任务id].x,y=任务数据[任务id].y}
        if wj地图 ~= jg地图.z or 取两点距离(比较xy,jg地图) > 20 then
            地图处理类:跳转地图(数字id,jg地图.z,jg地图.x,jg地图.y)
        else
            for k,v in pairs(地图处理类.地图单位[jg地图.z]) do
                if v.id == 任务id then
                    -- print("地图单位：")
                    -- print(k)
                    -- print(table.tostring(v))
                    local 对话内容 = self.活动内容:地图单位对话(玩家数据[数字id].连接id,数字id,任务数据[v.id].编号,v.id,任务数据[v.id].地图编号)
                    if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then
                        self.活动处理:活动选项解析(玩家数据[数字id].连接id,数字id,nil,对话内容.选项)
                        玩家数据[数字id].地图单位=nil
                    end
                    break
                end
            end
        end
    end
end

function 辅助内挂类:门派闯关进程(数字id)
    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    local 任务id = 玩家数据[数字id].角色:取任务(107)

    if self.门派闯关次数[数字id] == nil then
        self.门派闯关次数[数字id] = 0
    end

    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    local 提示 = self:活动可进行(数字id,"门派闯关")
    if 提示~=true then
        self.挂活动[数字id] = nil
        发送数据(玩家数据[数字id].连接id, 551, {变更=false})
        发送数据(玩家数据[数字id].连接id,1501,{名称=玩家数据[数字id].角色.名称,模型=玩家数据[数字id].角色.模型,对话=提示})
        return
    end
    if 任务数据[任务id]~=nil then

        local n = 任务数据[任务id].当前序列
        local data = Q_闯关数据[任务数据[任务id].闯关序列[n]]
        local qmpdt = 取门派地图(任务数据[任务id].闯关序列[n])
        local jr地图 = {z=qmpdt[1],x=data.x,y=data.y}
        if data then
            if wj地图 ~= jr地图.z or 取两点距离(比较xy,jr地图) > 20 then
                self:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
            else
                for k,v in pairs(地图处理类:取NPC数据(wj地图)) do

                    local npcmc = 任务数据[任务id].闯关序列[n] .."护法"
                    if v.名称 == npcmc then

                        local 对话内容 = self.活动NPC对话内容:取对话内容(wj地图,k,数字id) --地图编号，npc编号，数字id

                        if 对话内容~=nil and 对话内容[4]~=nil and 对话内容[4][1]~=nil then

                            self.活动NPC对话处理:地图任务其他预处理(玩家数据[数字id].连接id,数字id,npcmc,对话内容[4][1], wj地图)
                            self.门派闯关次数[数字id] = self.门派闯关次数[数字id] + 1
                        end
                        break
                    end
                end
            end
        end
    end
end

function 辅助内挂类:抓鬼流程(数字id)
    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end
    if self:有人不可飞行(数字id) then
        return
    end
    local data = 玩家数据[数字id].角色.内挂.抓鬼
    for k,v in pairs(self.抓鬼表) do
        if data[k] then
            if v.名称=="自动抓鬼" then
                self:普通抓鬼流程(数字id)
            elseif v.名称=="自动鬼王" then
                self:自动鬼王流程(数字id)
            elseif v.名称=="镇妖塔" then
                self:镇妖塔流程(数字id)


            end
            break
        end
    end
end

function 辅助内挂类:普通抓鬼流程(数字id)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    local 任务id = 玩家数据[数字id].角色:取任务(8)
    local 钟馗xy={X=65,Y=70}
    local jr地图= {z=1122,x=钟馗xy.X,y=钟馗xy.Y}
    if 任务id==0 then
        if wj地图 ~= 1122 or 取两点距离(比较xy,jr地图) > 20 then
            地图处理类:跳转地图(数字id,jr地图.z,jr地图.x,jr地图.y)
        else
            任务处理类:添加抓鬼任务(数字id)
        end
    else
        local jg地图 = {z=任务数据[任务id].地图编号,x=任务数据[任务id].x,y=任务数据[任务id].y}
        if wj地图 ~= jg地图.z or 取两点距离(比较xy,jg地图) > 20 then
            地图处理类:跳转地图(数字id,jg地图.z,jg地图.x,jg地图.y)
        else
            for k,v in pairs(地图处理类.地图单位[jg地图.z]) do
                if v.id == 任务id then

                    local 对话内容 = self.活动内容:地图单位对话(玩家数据[数字id].连接id,数字id,任务数据[v.id].编号,v.id,任务数据[v.id].地图编号)
                    if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then
                        self.活动处理:活动选项解析(玩家数据[数字id].连接id,数字id,nil,对话内容.选项)
                        玩家数据[数字id].地图单位=nil
                    end
                    break
                end
            end
        end
    end
end

function 辅助内挂类:自动鬼王流程(数字id)
    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}
    local 任务id=玩家数据[数字id].角色:取任务(211)
    if 任务id==0 then
        if wj地图 ~= 1125 then
            地图处理类:跳转地图(数字id,1125,35,27)

        else

            任务处理类:设置鬼王任务(数字id)
        end
    else
        local jg地图 = {z=任务数据[任务id].地图编号,x=任务数据[任务id].x,y=任务数据[任务id].y}
        if wj地图 ~= jg地图.z or 取两点距离(比较xy,jg地图) > 20 then
            地图处理类:跳转地图(数字id,jg地图.z,jg地图.x,jg地图.y)
        else
            for k,v in pairs(地图处理类.地图单位[jg地图.z]) do
                if v.id == 任务id then
                    local 对话内容 = self.活动内容:地图单位对话(玩家数据[数字id].连接id,数字id,任务数据[v.id].编号,v.id,任务数据[v.id].地图编号)

                    -- local 对话内容 = __GWdh111[任务数据[v.id].类型](玩家数据[数字id].连接id,数字id,任务数据[v.id].序列,任务数据[v.id].id,jg地图.z)
                    if 对话内容~=nil and 对话内容.选项~=nil and 对话内容.选项[1]~=nil then
                        -- 玩家数据[数字id].地图单位={地图=任务数据[v.id].地图编号,标识=任务数据[v.id].id,编号=任务数据[v.id].编号}
                        -- __GWdh222[任务数据[v.id].类型](玩家数据[数字id].连接id,数字id,nil,对话内容.选项)
                        self.活动处理:活动选项解析(玩家数据[数字id].连接id,数字id,nil,对话内容.选项)
                        玩家数据[数字id].地图单位=nil
                    end
                    break
                end
            end
        end
    end
end

function 辅助内挂类:镇妖塔流程(数字id)

    if 玩家数据[数字id].战斗 ~= 0 or not 玩家数据[数字id].队长 then return end


    local 队伍id = 玩家数据[数字id].队伍
    if 队伍id and 队伍id > 0 and 队伍数据 and 队伍数据[队伍id] and 队伍数据[队伍id].成员数据 then
        local 队长层数 = 1
        if 镇妖塔数据 and 镇妖塔数据[数字id] then
            队长层数 = 镇妖塔数据[数字id].层数 or 1
        end


        for i=1, #队伍数据[队伍id].成员数据 do
            local 队员id = 队伍数据[队伍id].成员数据[i]
            if 队员id ~= 数字id and 玩家数据[队员id] then
                local 队员层数 = 1
                if 镇妖塔数据 and 镇妖塔数据[队员id] then
                    队员层数 = 镇妖塔数据[队员id].层数 or 1
                end


                if 队员层数 ~= 队长层数 then
                    常规提示(数字id, "#R/队伍成员层数不一致，无法自动挑战镇妖塔")
                    return
                end
            end
        end
    end

    local wj地图 = 玩家数据[数字id].角色.数据.地图数据.编号
    local wj地图x = 玩家数据[数字id].角色.数据.地图数据.x
    local wj地图y = 玩家数据[数字id].角色.数据.地图数据.y
    local 比较xy = {x=wj地图x/20,y=wj地图y/20}

    local 镇塔童子_地图 = 1001
    local 镇塔童子_XY = {X=441, Y=31}
    local jr地图 = {z=镇塔童子_地图, x=镇塔童子_XY.X, y=镇塔童子_XY.Y}



    if wj地图 ~= 镇塔童子_地图 or 取两点距离(比较xy, jr地图) > 20 then
        地图处理类:跳转地图(数字id, 镇塔童子_地图, 镇塔童子_XY.X, 镇塔童子_XY.Y)
        return
    end
    for k, v in pairs(地图处理类:取NPC数据(镇塔童子_地图)) do
        if v.名称 == "镇塔童子" then
            local 对话内容 = self.活动NPC对话内容:取对话内容(镇塔童子_地图, k, 数字id)

            if 对话内容 and 对话内容[4] and 对话内容[4][1] then
                -- 常规提示(数字id, "#Y/正在挑战镇妖塔第#R" .. 镇妖塔层数 .. "#Y层！")

                local 任务id = 玩家数据[数字id].角色:取任务(100108)
                if 任务id == 0 then
                    任务id = 数字id * 1000 + 1
                    任务数据[任务id] = {类型=100108, 名称="镇塔童子", 地图编号=镇塔童子_地图}
                end

                玩家数据[数字id].地图单位 = {地图=镇塔童子_地图, 标识=任务id, 编号=k}

                self.活动处理:活动选项解析(玩家数据[数字id].连接id,数字id,nil,{"开启挑战", nil, "镇塔童子"})
                玩家数据[数字id].地图单位 = nil
            end
            break
        end
    end
end

function 辅助内挂类:抓鬼可进行(数字id,mc)
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
        elseif 取队伍最低等级(玩家数据[数字id].队伍,100) then
            return "#Y/等级小于100级的玩家无法领取此任务"
        elseif 取队伍任务(玩家数据[数字id].队伍,14) then
            return "#Y/队伍中已有队员领取过此任务了"
        end
    elseif mc == "镇妖塔" then
        if 玩家数据[数字id].队伍==0 or 玩家数据[数字id].队长==false  then
            return "#Y/该任务必须组队完成且由队长领取"
        elseif 取队伍最低等级(玩家数据[数字id].队伍,50) then
            return "#Y/等级小于50级的玩家无法领取此任务"
        end
    end
    return true
end


function 辅助内挂类:有人不可飞行(数字id)
    if not 玩家数据[数字id].队长 then
        常规提示(数字id,"你不是队长")
        return true
    end
    local 队伍id = 玩家数据[数字id].队伍
    for n=1,#队伍数据[队伍id].成员数据 do
        if 玩家数据[队伍数据[队伍id].成员数据[n]].道具:取禁止飞行(队伍数据[队伍id].成员数据[n]) then
            常规提示(数字id,format("#Y/%s#R/当前不能传送,禁止挂机",玩家数据[队伍数据[队伍id].成员数据[n]].角色.名称))
            return true
        end
    end
    return false
end

function 辅助内挂类:是否明雷挂机中(数字id)
    if self.挂明雷[数字id]~=nil then
        return true
    end
    return false
end

function 辅助内挂类:是否挂机中(数字id)
    if self.挂明雷[数字id]~=nil or self.挂活动[数字id]~=nil or self.挂抓鬼[数字id]~=nil then
        return true
    end
    return false
end

function 辅助内挂类:关闭其它挂机(数字id,jm)
    local abc = {"挂明雷","挂活动","挂抓鬼"}
    for n=1,3 do
        if n~=jm and self[abc[n]][数字id]~=nil then
            self[abc[n]][数字id] = nil
        end
    end
end

function 辅助内挂类:关闭所有挂机(数字id)
    if self.挂明雷[数字id]~=nil then
        self.挂明雷[数字id] = nil
    end
    if self.挂活动[数字id]~=nil then
        self.挂活动[数字id] = nil
    end
    if self.挂抓鬼[数字id]~=nil then
        self.挂抓鬼[数字id] = nil
    end
end

function 辅助内挂类:置角色内挂数据(数字id)
    if 玩家数据[数字id].角色.内挂==nil then
        玩家数据[数字id].角色.内挂={}
    end
    if 玩家数据[数字id].角色.内挂.明雷==nil then
        玩家数据[数字id].角色.内挂.明雷={}
    end
    if 玩家数据[数字id].角色.内挂.活动==nil then
        玩家数据[数字id].角色.内挂.活动={}
    end
    if 玩家数据[数字id].角色.内挂.抓鬼==nil then
        玩家数据[数字id].角色.内挂.抓鬼={}
    end
    for n=1,50 do
        if self.明雷表[n]~=nil then
            if 玩家数据[数字id].角色.内挂.明雷[n]==nil then
                玩家数据[数字id].角色.内挂.明雷[n] = false
            end
        else
            玩家数据[数字id].角色.内挂.明雷[n] = nil
        end
        if self.活动表[n]~=nil then
            if 玩家数据[数字id].角色.内挂.活动[n]==nil then
                玩家数据[数字id].角色.内挂.活动[n] = false
            end
        else
            玩家数据[数字id].角色.内挂.活动[n] = nil
        end
        if self.抓鬼表[n]~=nil then
            if 玩家数据[数字id].角色.内挂.抓鬼[n]==nil then
                玩家数据[数字id].角色.内挂.抓鬼[n] = false
            end
        else
            玩家数据[数字id].角色.内挂.抓鬼[n] = nil
        end
    end
end

return 辅助内挂类
