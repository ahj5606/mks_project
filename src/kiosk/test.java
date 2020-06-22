package kiosk;

import org.python.util.PythonInterpreter;

public class test {
private static PythonInterpreter interpreter;
	public static void main(String[] args) {
        interpreter = new PythonInterpreter();
        interpreter.execfile("test.py");
        interpreter.exec("print(ret(10))");	
	}
}
