-- @Author: linfeng
-- @Date:   2016-11-25 18:21:47
-- @Last Modified by:   linfeng
-- @Last Modified time: 2017-01-19 15:47:29


local skynet = require "skynet"
require "skynet.manager"

skynet.start(function ()
	
	--init log

	--init timer

	--init web

	--init debug

	--init dbproxy

	--init cluster node

	--init lua server

	--init gate(begin listen)

	--exit
	skynet.exit()
end)