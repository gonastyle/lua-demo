

Person = {name="这个人很懒"}
Student={name="学生"}

function Student:study(course)

  print("学生学习："..course)

end


function Person:talk(words)

    print(self.name.."说:"..words)

end

function Person:create(name)


    local p = {}
    setmetatable(p, Person)
    p.name = name
	Person.__index = Student   --子类查找元表__index上的表
    return p
end



local pa = Person:create("路人甲")
local pb = Person:create("路人乙")

pa:study("我是路人甲") --路人甲说:我是路人甲
--pb:talk("我是路人乙") --路人乙说:我是路人乙



































