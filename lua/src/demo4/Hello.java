package demo4;

import org.keplerproject.luajava.LuaState;
import org.keplerproject.luajava.LuaStateFactory;

public class Hello
{
    public static void main(String[] args)
    {
      LuaState L = LuaStateFactory.newLuaState();
      L.openLibs();    
      System.out.println("������Java�������Lua�ű�");    
    
      // ���ؽű�hello.lua,��ִ��
      //����Lua�ű�
      int error =  L.LdoFile("res/hello.lua");
       if (error != 0) {
           System.out.println("Read/Parse lua file error. Exit.");
           return;
       } 
       
    }
}
