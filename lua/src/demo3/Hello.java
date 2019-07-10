package demo3;

import org.keplerproject.luajava.LuaException;
import org.keplerproject.luajava.LuaObject;
import org.keplerproject.luajava.LuaState;
import org.keplerproject.luajava.LuaStateFactory;

public class Hello {

	static {
        //加载Lua5.1.dll, 因为LuaJava最后还是要调用Lua的东西
       System.loadLibrary("lua5.1");
    }
    
    public static void main(String[] argu) throws LuaException {
        
        LuaState L = LuaStateFactory.newLuaState();

        L.openLibs();

        //读入Lua脚本
       int error = L.LdoFile("test1.lua");
        if (error != 0) {
            System.out.println("Read/Parse lua file error. Exit.");
            return;
        } 
        
      //找到函数test1
        L.getField(LuaState.LUA_GLOBALSINDEX, "test1");
        //生成新的对象供测试
       Value v = new Value();
        //对象压栈
       L.pushObjectValue(v);
        //调用函数test1, 此时1个参数, 1个返回值
       L.call(1, 1);
        //结果放在b中.
        L.setField(LuaState.LUA_GLOBALSINDEX, "b");
        LuaObject l = L.getLuaObject("b");
        System.out.println("Result is " + l.getObject());

        L.close();
}
	
	
}
