-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2022-10-18 23:13:44
-- @最后修改来自: baidwwy
-- @Last Modified time: 2024-10-26 13:38:47
-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2022-10-18 21:27:02
-- @最后修改来自: baidwwy
-- @Last Modified time: 2022-10-18 23:13:23
local battle_100306 = class()


function battle_100306:初始化()
	self.战斗id=0
	self.战斗数据={}
end

function battle_100306:加载战斗id(战斗id)
	self.战斗id=战斗id
	return true
end

function battle_100306:战斗准备后(数据)
	for k,v in pairs(数据) do
	   self.战斗数据[k]=v
	end
	self.悲歌=2
	self.欢喜=2
end
function battle_100306:刷新数据(数据)
	   for k,v in pairs(self.战斗数据) do
	   	  if 数据[k]==nil then
	   	  	 self.战斗数据[k]=nil
	   	  end
	   end
	for k,v in pairs(数据) do
	    self.战斗数据[k]=v
	end
end

function battle_100306:单位死亡(编号)
	if self.战斗数据.参战单位[编号].名称=="悲歌" and self.战斗数据.参战单位[编号].队伍==0 then
		self.悲歌=self.悲歌-1
	end
	if self.战斗数据.参战单位[编号].名称=="欢喜" and self.战斗数据.参战单位[编号].队伍==0 then
		self.欢喜=self.欢喜-1
	end
end

function battle_100306:命令回合前(回合数)

end

function battle_100306:NPC智能施法(编号,战斗单位,回合数)
  local 返回数据 = {类型="",目标=0,参数="",下达=false}
  --如果写召唤的话，把技能改成无敌牛虱这类的,在这里施法
  if 战斗单位.名称=="沈唐真身" then
	if self.悲歌 > self.欢喜 then
		self:添加即时发言(编号,"此生悲歌多而欢喜寡")
		返回数据.类型="法术"
		返回数据.目标=self:取单个敌方目标(编号)
		返回数据.参数="翻江搅海"
	    返回数据.下达=true
	elseif self.悲歌 < self.欢喜 then
		self:添加即时发言(编号,"此生欢喜多而悲歌寡")
		返回数据.类型="法术"
		返回数据.目标=self:取单个敌方目标(编号)
		返回数据.参数="断岳势"
	    返回数据.下达=true
	elseif self.悲歌 == self.欢喜 then
		if self.悲歌==0 then
			self:添加即时发言(编号,"此生无悲无欢")
			返回数据.类型="法术"
			返回数据.目标=self:取单个敌方目标(编号)
			返回数据.参数="失心符"
		    返回数据.下达=true
		elseif self.悲歌 > 0 then
			self:添加即时发言(编号,"此生悲歌与欢喜，我也不知哪个更多一些")
			返回数据.类型="法术"
			返回数据.目标=self:取单个敌方目标(编号)
			返回数据.参数="天崩地裂"
		    返回数据.下达=true
		end
	end
  end
  return 返回数据
end

function battle_100306:添加即时发言(编号,文本)
  for n=1,#self.战斗数据.参战玩家 do
    发送数据(self.战斗数据.参战玩家[n].连接id,5512,{id=编号,文本=文本})
  end
end

function battle_100306:取单个友方目标(编号,是否)
  local 目标组={}
  for n=1,#self.战斗数据.参战单位 do
    if 是否 ~= nil then
       if self.战斗数据.参战单位[n].队伍==self.战斗数据.参战单位[编号].队伍 and self:取目标状态(编号,n,1) then
           目标组[#目标组+1]=n
       end
    else
       if n~=编号 and self.战斗数据.参战单位[n].队伍==self.战斗数据.参战单位[编号].队伍 and self:取目标状态(编号,n,1) then
           目标组[#目标组+1]=n
       end
    end
  end
  if #目标组==0 then
     return 0
  else
     return 目标组[取随机数(1,#目标组)]
  end
end

function battle_100306:取单个敌方目标(编号)
  local 目标组={}
  for n=1,#self.战斗数据.参战单位 do
     if  self.战斗数据.参战单位[n].队伍~=self.战斗数据.参战单位[编号].队伍 and self:取目标状态(编号,n,1) then
         目标组[#目标组+1]=n
     end
     end
  if #目标组==0 then
     return 0
    else
     return 目标组[取随机数(1,#目标组)]
  end
end


function battle_100306:取目标状态(攻击,挨打,类型)  --类型=1 为敌方正常 2为队友 3为复活队友
 --print(攻击,挨打,类型)
  if self.战斗数据.参战单位[挨打]==nil or self.战斗数据.参战单位[挨打].法术状态==nil then return false end
  if 类型==1 then
      if self.战斗数据.参战单位[挨打].气血<=0 or self.战斗数据.参战单位[挨打].捕捉 or self.战斗数据.参战单位[挨打].逃跑  then
        return false
      elseif self.战斗数据.参战单位[挨打].法术状态.修罗隐身~=nil and self.战斗数据.参战单位[攻击].法术状态.幽冥鬼眼==nil and self.战斗数据.参战单位[攻击].感知==nil and (self.战斗数据.参战单位[攻击].法术状态.牛劲==nil or self.战斗数据.参战单位[攻击].法术状态.牛劲.感知==nil) then
        return false
      elseif self.战斗数据.参战单位[挨打].法术状态.煞气诀~=nil then
        return false
    else
      if self.战斗数据.参战单位[挨打].气血<=0 or self.战斗数据.参战单位[挨打].捕捉 or self.战斗数据.参战单位[挨打].逃跑  then
        return false
      elseif self.战斗数据.参战单位[挨打].法术状态.楚楚可怜~=nil and self.战斗数据.参战单位[攻击].感知==nil then
        return false
      elseif self.战斗数据.参战单位[挨打].法术状态.修罗隐身~=nil and self.战斗数据.参战单位[攻击].法术状态.幽冥鬼眼==nil and self.战斗数据.参战单位[攻击].感知==nil  and (self.战斗数据.参战单位[攻击].法术状态.牛劲==nil or self.战斗数据.参战单位[攻击].法术状态.牛劲.感知==nil)  then
        return false
      elseif self.战斗数据.参战单位[挨打].法术状态.煞气诀~=nil then
        return false
      end
    end
  elseif 类型==2 then
    if self.战斗数据.参战单位[挨打].气血<=0 or self.战斗数据.参战单位[挨打].捕捉 or self.战斗数据.参战单位[挨打].逃跑 then
       return false
    end
      elseif 类型==3 then
    if self.战斗数据.参战单位[挨打].气血<=0 then
      return false
    end
  end
 return true
end


function battle_100306:战斗胜利(胜利id,失败id)
	local 队伍id=玩家数据[self.战斗数据.进入玩家id].队伍
	for i=1,#队伍数据[队伍id].成员数据 do
			local 临时id=队伍数据[队伍id].成员数据[i]
			local 等级=玩家数据[临时id].角色.数据.等级
            local 经验=等级*800*1.5+等级*等级*15
            local 银子=等级*250*1.5+等级*等级*6
            玩家数据[临时id].角色:添加经验(经验,"副本沈唐二")
            玩家数据[临时id].角色:添加银子(银子,"副本沈唐二",1)
            玩家数据[临时id].角色:添加活跃积分(100,"一斛珠副本",1)

          local 获得物品={}
	        for i=1,#自定义数据.一斛珠沈唐真 do
	            if 取随机数()<=自定义数据.一斛珠沈唐真[i].概率 then
	               获得物品[#获得物品+1]=自定义数据.一斛珠沈唐真[i]
	            end
	        end
	        获得物品=删除重复(获得物品)
	        if 获得物品~=nil then
	           local 取编号=取随机数(1,#获得物品)
	           if 获得物品[取编号]~=nil and 获得物品[取编号].名称~=nil and 获得物品[取编号].数量~=nil then
	              玩家数据[临时id].道具:自定义给予道具(临时id,获得物品[取编号].名称,获得物品[取编号].数量,获得物品[取编号].参数)
	              广播消息({内容=format("#S(看戏-一斛珠)#R/%s#Y在#R一斛珠#Y副本中成功击败沈唐真身，因此获得了其奖励的#G/%s#Y".."#"..取随机数(1,110),玩家数据[临时id].角色.数据.名称,获得物品[取编号].名称),频道="hd"})
	           end
	        end
            玩家数据[临时id].战斗=0
	end
	副本id=玩家数据[self.战斗数据.进入玩家id].角色:取任务(7001)
	副本处理类:播放剧情动画(self.战斗数据.进入玩家id,7003)
	副本处理类.副本盒子[副本id]:设置副本进程(13)
end

function battle_100306:战斗失败(失败id,是否逃跑,胜利id)
	-- body
end

return battle_100306