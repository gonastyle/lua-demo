package demo5;

import org.keplerproject.luajava.LuaException;
import org.keplerproject.luajava.LuaState;
import org.keplerproject.luajava.LuaStateFactory;

public class Hello {

	 public static void main(String[] argu) throws LuaException {
	 LuaState L = LuaStateFactory.newLuaState();
     L.openLibs();    
     System.out.println("这里是Java程序调用Lua脚本");    
   
     // 加载脚本hello.lua,并执行
     //读入Lua脚本
     int error =  L.LdoFile("test2.lua");
      if (error != 0) {
          System.out.println("Read/Parse lua file error. Exit.");
          return;
      } 
	 }
}
