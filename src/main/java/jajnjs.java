// Online Java Compiler
// Use this editor to write, compile and run your Java code online

class HelloWorld {
    public static void main(String[] args) {
        int num1=2,num2=10;
        for(int i=num1;i<=num2;i++)
        {
            if(isPrime(i))
            {
                System.out.println(i);
            }
        }
    }
    static boolean isPrime(int n)
    {
        for(int i=2;i<n;i++)
        {
            if(n%i==0)
            {
                return false;
                
            }
        }
        return true;
    }
}