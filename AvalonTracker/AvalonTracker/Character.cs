using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AvalonTracker
{
    public enum Allegiance
    {
        Good,
        Bad,
    }

    public class CharacterClass
    {
        public CharacterClass(string name, Allegiance allegiance, string description = null)
        {
            Name = name;
            Allegiance = allegiance;
            Description = description;
        }

        public string Name { get; private set ; }
        public string Description { get; private set; }
        public Allegiance Allegiance { get; private set; }
    }
}
