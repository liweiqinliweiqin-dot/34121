-- @作者: baidwwy
-- @邮箱:  313738139@qq.com
-- @创建时间:   2022-10-15 13:49:57
-- @最后修改来自: baidwwy
-- @Last Modified time: 2023-07-02 22:35:21
-- @Author: 作者QQ381990860
-- @Date:   2022-08-21 10:58:09
-- @Last Modified by:   作者QQ381990860
-- @Last Modified time: 2022-09-26 23:18:58
local battle_110000 = class()

function battle_110000:初始化()
	self.战斗id=0
	self.战斗数据={}
end

function battle_110000:加载战斗id(战斗id)
	self.战斗id=战斗id
	return true
end

function battle_110000:战斗准备后(数据)
	for k,v in pairs(数据) do
	    self.战斗数据[k]=v
	end
end


function battle_110000:刷新数据(数据)
	   for k,v in pairs(self.战斗数据) do
	   	  if 数据[k]==nil then
	   	  	 self.战斗数据[k]=nil
	   	  end
	   end
	for k,v in pairs(数据) do
	    self.战斗数据[k]=v
	end
end

function battle_110000:test输出()
	print("test")
end

function battle_110000:单位死亡(编号)
	if self.战斗数据.参战单位[编号].名称=="木桩2" and self.战斗数据.参战单位[编号].队伍==0 then
		if self.集火目标==nil then
			self.集火目标=self:取单个敌方目标(编号)
		end
		self.木桩2死亡事件=true
	end
	if self.战斗数据.参战单位[编号].名称=="木桩3" and self.战斗数据.参战单位[编号].队伍==0 then
		if self.集火目标==nil then
			self.集火目标=self:取单个敌方目标(编号)
		end
		self.木桩3死亡事件=true
	end
end

function battle_110000:命令回合前(回合数)
    for n=1,#self.战斗数据.参战单位 do
		--集火事件是临时存的变量，但是是挂在战斗处理类下的，注意这种临时变量不要与战斗处理类里的同名
		if self.战斗数据.参战单位[n].名称=="木桩1" then
			--self.战斗脚本:test输出()
			if self.集火目标~=nil then
				local 目标名称=self.战斗数据.参战单位[self.集火目标].名称
	    		self:添加即时发言(n,"拜拜了,"..目标名称.."\n杀了我小弟你死定了#4")
			end
			--当木桩2木桩3都死亡，恢复木桩1的血量
			if self.木桩2死亡事件 and self.木桩2死亡事件 and self.战斗数据.参战单位[n].最大气血>5000 then
				self.战斗数据.参战单位[n].最大气血=5000
				self.战斗数据.参战单位[n].气血=5000
			end
		end
    end
end

function battle_110000:取单个敌方目标(编号)
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


function battle_110000:取单个友方目标(编号,是否)
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

function battle_110000:取目标状态(攻击,挨打,类型)  --类型=1 为敌方正常 2为队友 3为复活队友
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

function battle_110000:添加即时发言(编号,文本)
  for n=1,#self.战斗数据.参战玩家 do
    发送数据(self.战斗数据.参战玩家[n].连接id,5512,{id=编号,文本=文本})
  end
end

function battle_110000:NPC智能施法(编号,战斗单位,回合数)
  local 返回数据 = {类型="",目标=0,参数="",下达=false}
  --如果写召唤的话，把技能改成无敌牛虱这类的,在这里施法
  if 战斗单位.名称=="木桩1" then
  	if self.集火目标~=nil then
	    返回数据.类型="法术"
	    返回数据.目标=self.集火目标
	    返回数据.参数="横扫千军"
	    返回数据.下达=true
	    self.集火目标=nil
	elseif 回合数==10 then
	    返回数据.类型="法术"
	    返回数据.目标=self.集火目标
	    返回数据.参数="横扫千军"
	    返回数据.下达=true
	    self.集火目标=nil
	end
  end
  return 返回数据
end

function battle_110000:战斗胜利(胜利id,失败id)
	添加最后对话(胜利id,format("少侠饶命！我再也不敢了！"))
end

function battle_110000:战斗失败(失败id,是否逃跑,胜利id)
	-- body
end

return battle_110000