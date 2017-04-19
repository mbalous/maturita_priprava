namespace MyApplication
{
    public class Program
    {
        static void Main()
        {
        }

        public static int Sum(int a, int b) => a + b;

        public static int Div(int a, int b)
        {
            if (b == 0)
                throw new System.ArgumentException("Divider can not be equal to 0.", nameof(b));

            return a / b;
        }
    }
}