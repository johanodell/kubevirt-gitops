hs = { status="Progressing", message="No status available"}
if obj.status ~= nil then
  if obj.status.conditions ~= nil then
    for i, condition in ipairs(obj.status.conditions) do
      if condition.type == "Available" and condition.status == "True" then
        hs.status = "Healthy"
        hs.message = "Status is Available"
      elseif condition.type == "Degraded" and condition.status == "True" then
        hs.status = "Degraded"
        hs.message = condition.reason
      elseif condition.type == "Progressing" and condition.status == "True" then
        hs.message = condition.reason
      end
    end
  end
  if obj.status.phase ~= nil then
    hs.message = obj.status.phase
  end
end
return hs
