

Person = {name="����˺���"}
Student={name="ѧ��"}

function Student:study(course)

  print("ѧ��ѧϰ��"..course)

end


function Person:talk(words)

    print(self.name.."˵:"..words)

end

function Person:create(name)


    local p = {}
    setmetatable(p, Person)
    p.name = name
	Person.__index = Student   --�������Ԫ��__index�ϵı�
    return p
end



local pa = Person:create("·�˼�")
local pb = Person:create("·����")

pa:study("����·�˼�") --·�˼�˵:����·�˼�
--pb:talk("����·����") --·����˵:����·����



































