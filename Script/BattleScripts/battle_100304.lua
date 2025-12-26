-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2022-10-20 16:53:33
-- @最后修改来自: baidwwy
-- @Last Modified time: 2024-10-26 13:38:25
-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2022-10-18 23:13:44
-- @最后修改来自: baidwwy
-- @Last Modified time: 2022-10-20 16:54:09
-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2022-10-18 21:27:02
-- @最后修改来自: baidwwy
-- @Last Modified time: 2022-10-18 23:13:23
local battle_100304 = class()

function battle_100304:初始化()
	self.战斗id=0
	self.战斗数据={}
end

function battle_100304:加载战斗id(战斗id)
	self.战斗id=战斗id
	return true
end

function battle_100304:战斗准备后(数据)
	for k,v in pairs(数据) do
	    self.战斗数据[k]=v
	end
end
function battle_100304:刷新数据(数据)
	   for k,v in pairs(self.战斗数据) do
	   	  if 数据[k]==nil then
	   	  	 self.战斗数据[k]=nil
	   	  end
	   end
	for k,v in pairs(数据) do
	    self.战斗数据[k]=v
	end
end


function battle_100304:单位死亡(编号)

end

function battle_100304:命令回合前(回合数)

end

function battle_100304:NPC智能施法(编号,战斗单位,回合数)
  local 返回数据 = {类型="",目标=0,参数="",下达=false}
  --如果写召唤的话，把技能改成无敌牛虱这类的,在这里施法
  return 返回数据
end

function battle_100304:战斗胜利(胜利id,失败id)
	local 队伍id=玩家数据[self.战斗数据.进入玩家id].队伍
	for i=1,#队伍数据[队伍id].成员数据 do
			local 临时id=队伍数据[队伍id].成员数据[i]
			local 等级=玩家数据[临时id].角色.数据.等级
            local 经验=等级*800*1.3+等级*等级*15
            local 银子=等级*250*1.3+等级*等级*6
            玩家数据[临时id].角色:添加经验(经验,"副本沈唐1")
            玩家数据[临时id].角色:添加银子(银子,"副本沈唐1",1)
            local 获得物品={}
	        for i=1,#自定义数据.一斛珠沈唐 do
	            if 取随机数()<=自定义数据.一斛珠沈唐[i].概率 then
	               获得物品[#获得物品+1]=自定义数据.一斛珠沈唐[i]
	            end
	        end
	        获得物品=删除重复(获得物品)
	        if 获得物品~=nil then
	           local 取编号=取随机数(1,#获得物品)
	           if 获得物品[取编号]~=nil and 获得物品[取编号].名称~=nil and 获得物品[取编号].数量~=nil then
	              玩家数据[临时id].道具:自定义给予道具(临时id,获得物品[取编号].名称,获得物品[取编号].数量,获得物品[取编号].参数)
	              广播消息({内容=format("#S(看戏-一斛珠)#R/%s#Y在#R一斛珠#Y副本中成功阻止了沈唐，因此获得了其奖励的#G/%s#Y".."#"..取随机数(1,110),玩家数据[临时id].角色.数据.名称,获得物品[取编号].名称),频道="hd"})
	           end
	        end
            玩家数据[临时id].战斗=0
	end
	副本id=玩家数据[self.战斗数据.进入玩家id].角色:取任务(7001)
	--对话加载
	local 对话数据={}
	对话数据.模型=玩家数据[self.战斗数据.进入玩家id].角色.数据.造型
	对话数据.名称=玩家数据[self.战斗数据.进入玩家id].角色.数据.名称
	对话数据.对话="你到底是什么人！这身手好生奇怪！"
	副本处理类:发送全队对话信息(self.战斗数据.进入玩家id,对话数据)
	对话数据.模型="逍遥生"
	对话数据.名称="沈唐"
	对话数据.对话="你想知道我是什么人么？若是有本事！便跟上来！让你看看，我是什么人！"
	副本处理类:发送全队对话信息(self.战斗数据.进入玩家id,对话数据)
	副本处理类.副本盒子[副本id]:设置副本进程(11)
end




function battle_100304:战斗失败(失败id,是否逃跑,胜利id)
	-- body
end

return battle_100304