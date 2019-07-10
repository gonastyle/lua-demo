package demo1;

import org.keplerproject.luajava.LuaState;
import org.keplerproject.luajava.LuaStateFactory;

public class Hello
{
  public static void main(String[] args)
  {
    LuaState L = LuaStateFactory.newLuaState();
    L.openLibs();
   
    L.LdoFile("hello.lua");
   
    System.out.println("Hello World from Java!");
  }
}
