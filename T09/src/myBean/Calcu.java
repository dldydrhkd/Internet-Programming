package myBean;

public class Calcu{
	private double num1;
	private double num2;
	private char oper;
	
	public Calcu() {}
	
	public void setNum1(double num1) {
		this.num1=num1;
	}
	public void setNum2(double num2) {
		this.num2=num2;
	}
	public void setOper(char oper) {
		this.oper=oper;
	}
	public double getNum1() {
		return num1;
	}
	public double getNum2() {
		return num2;
	}
	public char getOper() {
		return oper;
	}
	
	public double getResult() {
		double result=0;
		switch(oper) {
		case '+':
			result=num1+num2;
			break;
		case '-':
			result=num1-num2;
			break;
		case '*':
			result=num1*num2;
			break;
		case '/':
			result=num1/num2;
		}
		return result;
	}
	
	
}