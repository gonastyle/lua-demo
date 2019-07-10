package demo2;

import org.keplerproject.luajava.LuaException;
import org.keplerproject.luajava.LuaObject;
import org.keplerproject.luajava.LuaState;
import org.keplerproject.luajava.LuaStateFactory;

public class Hello {

	static {
        //����Lua5.1.dll, ��ΪLuaJava�����Ҫ����Lua�Ķ���
     //  System.loadLibrary("lua5.1");
    }
    
    public static void main(String[] argu) throws LuaException {
        
        LuaState L = LuaStateFactory.newLuaState();

        L.openLibs();

        //����Lua�ű�
       int error = L.LdoFile("test.lua");
        if (error != 0) {
            System.out.println("Read/Parse lua file error. Exit.");
            return;
        } 
        
        //�ҵ�����test
        L.getField(LuaState.LUA_GLOBALSINDEX, "test");
        //����1ѹջ
       L.pushInteger(1);
        //����2ѹջ
       L.pushInteger(2);
        //����!! һ����������, 1������ֵ
       L.call(2, 1);
        //���淵��ֵ, ��a��
       L.setField(LuaState.LUA_GLOBALSINDEX, "a");
        //����a
        LuaObject l = L.getLuaObject("a");
        //��ӡ���.
        System.out.println("Result is " + l.getString());

        L.close();
}
	
	
}
