using MyApplication;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace MyTestProject
{
    [TestClass]
    public class MyUnitTest
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