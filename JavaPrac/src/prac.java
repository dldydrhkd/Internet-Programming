import java.util.Scanner;
public class prac {

   public static void main(String[] args) {
      Scanner stdin = new Scanner(System.in);
      int total = 0;
      {
         for(int i = 0; i < 5; i++)
         { 
            int a = stdin.nextInt();
            total += Math.pow(a, 2);
         }
      }
      System.out.printf("%d",total%10);
   }
}
