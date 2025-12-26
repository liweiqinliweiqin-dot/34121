-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2022-10-18 23:13:44
-- @最后修改来自: baidwwy
-- @Last Modified time: 2024-10-26 13:38:12
-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2022-10-18 21:27:02
-- @最后修改来自: baidwwy
-- @Last Modified time: 2022-10-18 23:13:23
local battle_100303 = class()

function battle_100303:初始化()
	self.战斗id=0
	self.战斗数据={}
end

function battle_100303:加载战斗id(战斗id)
	self.战斗id=战斗id
	return true
end

function battle_100303:战斗准备后(数据)
	for k,v in pairs(数据) do
	    self.战斗数据[k]=v
	end
end

function battle_100303:刷新数据(数据)
	   for k,v in pairs(self.战斗数据) do
	   	  if 数据[k]==nil then
	   	  	 self.战斗数据[k]=nil
	   	  end
	   end
	for k,v in pairs(数据) do
	    self.战斗数据[k]=v
	end

end

function battle_100303:单位死亡(编号)

end

function battle_100303:命令回合前(回合数)

end

function battle_100303:NPC智能施法(编号,战斗单位,回合数)
  local 返回数据 = {类型="",目标=0,参数="",下达=false}
  --如果写召唤的话，把技能改成无敌牛虱这类的,在这里施法
  return 返回数据
end

function battle_100303:战斗胜利(胜利id,失败id)
	local 队伍id=玩家数据[self.战斗数据.进入玩家id].队伍
	for i=1,#队伍数据[队伍id].成员数据 do
			local 临时id=队伍数据[队伍id].成员数据[i]
			local 等级=玩家数据[临时id].角色.数据.等级
            local 经验=等级*800*1.2+等级*等级*15
            local 银子=等级*250*1.2+等级*等级*6
            玩家数据[临时id].角色:添加经验(经验,"副本官差")
            玩家数据[临时id].角色:添加银子(银子,"副本官差",1)
            local 获得物品={}
	        for i=1,#自定义数据.一斛珠官差 do
	            if 取随机数()<=自定义数据.一斛珠官差[i].概率 then
	               获得物品[#获得物品+1]=自定义数据.一斛珠官差[i]
	            end
	        end
	        获得物品=删除重复(获得物品)
	        if 获得物品~=nil then
	           local 取编号=取随机数(1,#获得物品)
	           if 获得物品[取编号]~=nil and 获得物品[取编号].名称~=nil and 获得物品[取编号].数量~=nil then
	              玩家数据[临时id].道具:自定义给予道具(临时id,获得物品[取编号].名称,获得物品[取编号].数量,获得物品[取编号].参数)
	              广播消息({内容=format("#S(看戏-一斛珠)#R/%s#Y在#R一斛珠#Y副本中成功挡住了官差，因此获得了其奖励的#G/%s#Y".."#"..取随机数(1,110),玩家数据[临时id].角色.数据.名称,获得物品[取编号].名称),频道="hd"})
	           end
	        end
            玩家数据[临时id].战斗=0
	end
	地图处理类:跳转地图(self.战斗数据.进入玩家id,7002,27,26)
	副本id=玩家数据[self.战斗数据.进入玩家id].角色:取任务(7001)
	添加最后对话(胜利id,format("快跑……一会追上来可就惨了#24"))
	副本处理类.副本盒子[副本id]:设置副本进程(8)
end


function battle_100303:战斗失败(失败id,是否逃跑,胜利id)
	-- body
end

return battle_100303