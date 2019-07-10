package demo3;

import org.keplerproject.luajava.LuaException;
import org.keplerproject.luajava.LuaObject;
import org.keplerproject.luajava.LuaState;
import org.keplerproject.luajava.LuaStateFactory;

public class Hello {

	static {
        //����Lua5.1.dll, ��ΪLuaJava�����Ҫ����Lua�Ķ���
       System.loadLibrary("lua5.1");
    }
    
    public static void main(String[] argu) throws LuaException {
        
        LuaState L = LuaStateFactory.newLuaState();

        L.openLibs();

        //����Lua�ű�
       int error = L.LdoFile("test1.lua");
        if (error != 0) {
            System.out.println("Read/Parse lua file error. Exit.");
            return;
        } 
        
      //�ҵ�����test1
        L.getField(LuaState.LUA_GLOBALSINDEX, "test1");
        //�����µĶ��󹩲���
       Value v = new Value();
        //����ѹջ
       L.pushObjectValue(v);
        //���ú���test1, ��ʱ1������, 1������ֵ
       L.call(1, 1);
        //�������b��.
        L.setField(LuaState.LUA_GLOBALSINDEX, "b");
        LuaObject l = L.getLuaObject("b");
        System.out.println("Result is " + l.getObject());

        L.close();
}
	
	
}
