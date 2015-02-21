using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using AvalonTracker.Annotations;

namespace AvalonTracker
{
    public enum GameState
    {
        PlayerSelection,
        PartySelection,
        PartyVoting,
        QuestVoting,
    }


    public class GameService : INotifyPropertyChanged
    {
        public ObservableCollection<Player> AllPlayers = new ObservableCollection<Player>()
        {
            new Player(){Name = "John"},
            new Player(){Name = "Mike"},
            new Player(){Name = "Mark"},
            new Player(){Name = "James"},
            new Player(){Name = "Matt"},
            new Player(){Name = "Laura"},
            new Player(){Name = "Ben"},
        };

        public ObservableCollection<Player> ActivePlayers = new ObservableCollection<Player>();

        public ObservableCollection<Player> ActiveParty = new ObservableCollection<Player>();

        private int _partyChooserIndex = 0;

        public void AdvancePartyChooser()
        {
            _partyChooserIndex++;
            if (_partyChooserIndex > ActivePlayers.Count)
            {
                _partyChooserIndex = 0;
            }
            OnPropertyChanged("PartyChooser");
        }

        public Player PartyChooser
        {
            get
            {
                return ActivePlayers.Count > 0 ? ActivePlayers[_partyChooserIndex] : null;
            }
        }

        public int CurrentGameId { get { return 0; }}

        public int VoteTrack { get; private set; }

        public void AdvanceVoteTrack()
        {
            VoteTrack++;
        }

        public void ResetVoteTrack()
        {
            VoteTrack = 0;
        }

        public int CurrentQuest { get; private set; }
        
        public void AdvanceToNextQuest()
        {
            CurrentQuest += 1;
        }


        public GameState CurrentGameState { get; set; }

        //Player, Game, Quest, VotingRound
        public Dictionary<Tuple<Player, int, int, int>, bool> VoteTable = new Dictionary<Tuple<Player, int, int, int>, bool>();

        private List<CharacterClass> characterClasses = new List<CharacterClass>()
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

        public IList<CharacterClass> CharacterClasses {get { return characterClasses; }}

        public int GetPartySize(int questNumber)
        {
            switch (ActivePlayers.Count)
            {
                case 5:
                    switch (questNumber)
                    {
                        case 1:
                        case 3:
                            return 2;
                        case 2:
                        case 4:
                        case 5:
                            return 3;
                    }
                    break;
                case 6:
                    switch (questNumber)
                    {
                        case 1:
                            return 2;
                        case 2:
                        case 4:
                            return 3;
                        case 3:
                        case 5:
                            return 4;
                    }
                    break;
                case 7:
                    switch (questNumber)
                    {
                        case 1:
                            return 2;
                        case 2:
                        case 3:
                            return 3;
                        case 4:
                        case 5:
                            return 4;
                    }
                    break;
                case 8:
                    switch (questNumber)
                    {
                        case 1:
                            return 3;
                        case 2:
                        case 3:
                            return 4;
                        case 4:
                        case 5: 
                            return 5;
                    }
                    break;
                case 9:
                    switch (questNumber)
                    {
                        case 1:
                            return 3;
                        case 2:
                        case 3:
                            return 4;
                        case 4:
                        case 5:
                            return 5;
                    }
                    break;
                case 10:
                    switch (questNumber)
                    {
                        case 1:
                            return 3;
                        case 2:
                        case 3:
                            return 4;
                        case 4:
                        case 5:
                            return 5;
                    }
                    break;
            }
            return -1;
        }





        public event PropertyChangedEventHandler PropertyChanged;

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }  
    }


    public static class Services 
    {
        public static GameService GameService = new GameService();
    }
}
