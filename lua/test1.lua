function test1(v)
     v:inc();
     v:inc();
     print("In lua: " .. v:get());
     return v
 end 
