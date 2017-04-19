# Unit testy

- testovani .NET aplikaci
- tvorba unit testu (`TestClass`, `TestMethod`)
- technika testovani vyjimek
- testovani formularu

Pridat novy projekt "Unit Test Project", zajisti to pridani korektnich referenci a spravnou strukturu .csproj, aby to VS rozpoznalo jako testovaci projekt.

## Code

Program.cs
```csharp
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
```


MyTestClass.cs
```csharp
using MyApplication;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace MyTestProject
{
    [TestClass]
    public class MyTestClass
    {
        [TestMethod]
        public void TestSum()
        {
            Assert.AreEqual(5,Program.Sum(2, 3));
        }

        [TestMethod]
        [ExpectedException(typeof(System.ArgumentException))]
        public void TestDiv()
        {
            Program.Div(3, 0);
        }
    }
}

```