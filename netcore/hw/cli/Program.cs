using System;
using utils;

namespace cli
{
    class Program
    {
        static void Main(string[] args)
        {   
            string[] displayString = StringArrayMaker.Splitify("Hello World!");

            foreach(String s in displayString) 
            {
                Console.WriteLine(s);
            }
        }
    }
}
