-- @Author: linfeng
-- @Date:   2017-02-06 17:39:27
-- @Last Modified by:   linfeng
-- @Last Modified time: 2017-02-08 10:55:34

local skynet = require "skynet"
require "skynet.manager"
local snax = require "snax"
local string = string
local table = table
local math = math

require "luaext"

--获取保存SM的元表,server不存在时，会自动uniqueservice
function GetSmMetaTable()
	local t = {}
	return setmetatable(t,{ __index = function ( self, key )
		local obj = snax.uniqueservice(key)
		self[key] = obj
		return obj
	end})
end

SM = GetSmMetaTable()

require "logdef"

LOG_PATH = skynet.getenv("logpath")
EVENT_LOG_PATH = skynet.getenv("eventlogpath")