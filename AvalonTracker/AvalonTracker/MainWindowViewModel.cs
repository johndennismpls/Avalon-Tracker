using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Dynamic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using AvalonTracker.Annotations;

namespace AvalonTracker
{
    public class MainWindowViewModel: INotifyPropertyChanged
    {
        public MainWindowViewModel()
        {
            ShowControlsForGameState(DataService.CurrentGameState);
            InitializeCommands();
        }

        private void InitializeCommands()
        {
            StartMatchCommand = new RelayCommand(PerformStartMatchCommand, CanPerformStartMatchCommand);
            GoToVoteCommand = new RelayCommand(PerformGoToVoteCommand, CanGoToVote);
        }

        private Visibility _playerSelectionVisibility;
        private Visibility _partySelectionVisibility;
        private Visibility _questResultsVisibility;

        public Visibility QuestResultsVisibility
        {
            get { return _questResultsVisibility; }
            private set { 
                _questResultsVisibility = value;
                OnPropertyChanged();
            }
        }
        
        public Visibility PlayerSelectionVisibility { 
            get { return _playerSelectionVisibility; } 
            private set
            {
                _playerSelectionVisibility = value;
                OnPropertyChanged();
            } 
        }

        public Visibility PartySelectionVisibility
        {
            get { return _partySelectionVisibility; }
            private set
            {
                _partySelectionVisibility = value;
                OnPropertyChanged();
            }
        }

        private bool CanPerformStartMatchCommand(object obj)
        {
            return (DataService.ActivePlayers.Count > GlobalConstants.MinimumPlayers)
                    && DataService.ActivePlayers.Count < GlobalConstants.MaximumPlayers;
        }

        private void PerformStartMatchCommand(object obj)
        {
            DataService.AdvanceToNextQuest();
            DataService.CurrentGameState = GameState.PartySelection;
            ShowControlsForGameState(DataService.CurrentGameState);
            OnPropertyChanged("RequiredPlayers");
            OnPropertyChanged("NextStateBtnText");
        }

        private void PerformGoToVoteCommand(object obj)
        {
            if (DataService.CurrentGameState == GameState.PartySelection)
            {
                PartySelectionHelper(obj);
            }
            if (DataService.CurrentGameState == GameState.PartyVoting)
            {
                PartyVotingHelper(obj);
            }
        }

        private void PartyVotingHelper(object obj)
        {
            int ApproveVotes = 0;
            foreach (var player in DataService.ActivePlayers)
            {
                if (DataService.VoteTable[new Tuple<Player, int>(player, DataService.CurrentQuest)])
                    ApproveVotes++;
            }
            if ((double)ApproveVotes / DataService.ActivePlayers.Count > .5)
            {
                DataService.CurrentGameState = GameState.QuestVoting;
                ShowControlsForGameState(DataService.CurrentGameState);
                DataService.ResetVoteTrack();
            }
            else
            {
                DataService.AdvanceVoteTrack();
                OnPropertyChanged("VoteTrackMessage");
            }
        }

        private void PartySelectionHelper(object obj)
        {
            foreach (var player in DataService.ActivePlayers)
            {
                DataService.VoteTable.Add(new Tuple<Player, int>(player, DataService.CurrentQuest), false);
            }

            DataService.CurrentGameState = GameState.PartyVoting;
            ShowControlsForGameState(DataService.CurrentGameState);
            OnPropertyChanged("NextStateBtnText");
        }

        private bool CanGoToVote(object obj)
        {
            return DataService.ActiveParty.Count == DataService.GetPartySize(DataService.CurrentQuest);
        }

        public ICommand GoToVoteCommand { get; set; }
        public ICommand StartMatchCommand { get; private set; }


        public string RequiredPlayers
        {
            get { return string.Format("Quest No. {0} requires {1} players", DataService.CurrentQuest, DataService.GetPartySize(DataService.CurrentQuest)); }
        }

        public string VoteTrackMessage
        {
            get { return string.Format("Vote Track: {0}/{1}", DataService.VoteTrack, GlobalConstants.MaxVoteTrack); }
        }

        public string NextStateBtnText
        {
            get
            {
                switch (DataService.CurrentGameState)
                {
                    case GameState.PartySelection:
                        return "Propose Party!";
                    case GameState.PartyVoting:
                        return "Confirm Votes!";
                }
                return null;
            }
        }
         

        private void ShowControlsForGameState(GameState gameState)
        {
            switch (gameState)
            {
                case GameState.PlayerSelection:
                    PlayerSelectionVisibility = Visibility.Visible;
                    PartySelectionVisibility = Visibility.Hidden;
                    QuestResultsVisibility = Visibility.Hidden;
                    break;
                case GameState.PartySelection:
                    PlayerSelectionVisibility = Visibility.Hidden;
                    PartySelectionVisibility = Visibility.Visible;
                    QuestResultsVisibility = Visibility.Hidden;
                    break;
                case GameState.PartyVoting:
                    PlayerSelectionVisibility = Visibility.Hidden;
                    PartySelectionVisibility = Visibility.Visible;
                    QuestResultsVisibility = Visibility.Hidden;
                    break;
                case GameState.QuestVoting:
                    PlayerSelectionVisibility = Visibility.Hidden;
                    PartySelectionVisibility = Visibility.Hidden;
                    QuestResultsVisibility = Visibility.Visible;
                    break;
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
