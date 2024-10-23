package web;

public class Calculatrice {
	 public int somme(int a, int b) {
	        return a + b;
	    }

	    public int soustraction(int a, int b) {
	        return a - b;
	    }

	    public int multiplication(int a, int b) {
	        return a * b;
	    }

	    public int division(int a, int b) {
	        if (b == 0) {
	            throw new IllegalArgumentException("Division par zéro n'est pas permise.");
	        }
	        return a / b;
	    }
}
