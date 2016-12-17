local theentity

function init()
	script.setUpdateDelta(5)
		self.applyDamageRequest =0

end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function update(dt)
	theentity = effect.sourceEntity()
--	sb.logInfo("assf")
--	sb.logInfo("theentity id#: " .. theentity)
	thepos = world.entityPosition(theentity)
--	sb.logInfo("theposi      : " .. thepos[1].. ", " .. thepos[2])
	theitems = world.itemDropQuery(thepos,15.0,{boundMode="position"})
--	sb.logInfo("ssfdf" .. table.tostring(theitems) .. "  " .. tablelength(theitems))
	if tablelength(theitems) > 0 then
		world.spawnProjectile("greedfield",mcontroller.position(),entity.id(),{0,0},true,configBombDrop);
	end
end
