using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AvalonTracker
{
    public static class DataService
    {
        public static ObservableCollection<Player> AllPlayers = new ObservableCollection<Player>();

        public static ObservableCollection<Player> ActivePlayers = new ObservableCollection<Player>();

        public static ObservableCollection<Player> ActiveParty = new ObservableCollection<Player>();


        private static List<CharacterClass> characterClasses = new List<CharacterClass>()
        {
            //Good guys
            new CharacterClass(SerializableStrings.LoyalServantOfArthur, Allegiance.Good),
            new CharacterClass(SerializableStrings.Percival, Allegiance.Good),
            new CharacterClass(SerializableStrings.Merlin, Allegiance.Good),

            //bad guys
            new CharacterClass(SerializableStrings.MinionOfMordred, Allegiance.Bad),
            new CharacterClass(SerializableStrings.Assassin, Allegiance.Bad),
            new CharacterClass(SerializableStrings.Mordred, Allegiance.Bad),
            new CharacterClass(SerializableStrings.Oberon, Allegiance.Bad),
            new CharacterClass(SerializableStrings.Morgana, Allegiance.Bad),
        };
        public static IList<CharacterClass> CharacterClasses {get { return characterClasses; }}

    }
}
