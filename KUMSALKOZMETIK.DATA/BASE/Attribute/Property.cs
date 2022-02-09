using System; 

namespace KUMSALKOZMETIK.DATA
{

    public class Property : Attribute
    {
        private readonly string _name;
        private readonly bool _nullable;

        public Property(string name, bool nullable)
        {
            _name = name;
            _nullable = nullable;
        }
    }

}
