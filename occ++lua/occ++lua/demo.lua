--注释
print("hello lua")
--[[
	多行注释
]]

b=nil
print(b)

print(type("1234"))
print(type(10.4*3))
print(type(print))
print(type(true))
print(type(nil))
print(type(type(X)))
print("\n")

tab1 = {key1 = "value1",key2 = "value2", "value3"}
for i,v in ipairs(tab1) do
	print(i .. " - " .. v)
end

tab1.key1 = nil
for i,v in ipairs(tab1) do
	print(i .. " - " .. v)
end

print("\n")
