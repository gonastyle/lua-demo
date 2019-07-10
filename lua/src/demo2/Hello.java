package demo2;

import org.keplerproject.luajava.LuaException;
import org.keplerproject.luajava.LuaObject;
import org.keplerproject.luajava.LuaState;
import org.keplerproject.luajava.LuaStateFactory;

public class Hello {

	static {
        //加载Lua5.1.dll, 因为LuaJava最后还是要调用Lua的东西
     //  System.loadLibrary("lua5.1");
    }
    
    public static void main(String[] argu) throws LuaException {
        
        LuaState L = LuaStateFactory.newLuaState();

        L.openLibs();

        //读入Lua脚本
       int error = L.LdoFile("test.lua");
        if (error != 0) {
            System.out.println("Read/Parse lua file error. Exit.");
            return;
        } 
        
        //找到函数test
        L.getField(LuaState.LUA_GLOBALSINDEX, "test");
        //参数1压栈
       L.pushInteger(1);
        //参数2压栈
       L.pushInteger(2);
        //调用!! 一共两个参数, 1个返回值
       L.call(2, 1);
        //保存返回值, 到a中
       L.setField(LuaState.LUA_GLOBALSINDEX, "a");
        //读入a
        LuaObject l = L.getLuaObject("a");
        //打印结果.
        System.out.println("Result is " + l.getString());

        L.close();
}
	
	
}
