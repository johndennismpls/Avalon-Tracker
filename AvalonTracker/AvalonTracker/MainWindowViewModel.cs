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
            PlayerSelectionVisibility = Visibility.Visible;
            PartySelectionVisibility = Visibility.Hidden;

            InitializeCommands();
        }

        private void InitializeCommands()
        {
            StartMatchCommand = new RelayCommand(PerformStartMatchCommand, CanPerformStartMatchCommand);
            GoToVoteCommand = new RelayCommand(PerformGoToVoteCommand, CanGoToVote);
        }

        private Visibility _playerSelectionVisibility;
        private Visibility _partySelectionVisibility;
        private Visibility _voteButtonVisibility;
        
        public Visibility PlayerSelectionVisibility { 
            get { return _playerSelectionVisibility; } 
            private set
            {
                _playerSelectionVisibility = value;
                OnPropertyChanged("PlayerSelectionVisibility");
            } 
        }

        public Visibility PartySelectionVisibility
        {
            get { return _partySelectionVisibility; }
            private set
            {
                _partySelectionVisibility = value;
                OnPropertyChanged("PartySelectionVisibility");
            }
        }

        public Visibility VoteButtonVisibility
        {
            get { return _voteButtonVisibility; }
            set
            {
                if (value == _voteButtonVisibility) return;
                _voteButtonVisibility = value;
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
        }

        private void PerformGoToVoteCommand(object obj)
        {
            DataService.CurrentGameState = GameState.PartyVoting;
            ShowControlsForGameState(DataService.CurrentGameState);
            DataService.CurrentGameState = GameState.PartyVoting;
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



        private void ShowControlsForGameState(GameState gameState)
        {
            switch (gameState)
            {
                case GameState.PlayerSelection:
                    PlayerSelectionVisibility = Visibility.Visible;
                    PartySelectionVisibility = Visibility.Hidden;
                    break;
                case GameState.PartySelection:
                    PlayerSelectionVisibility = Visibility.Hidden;
                    PartySelectionVisibility = Visibility.Visible;
                    break;
                case GameState.PartyVoting:
                    PlayerSelectionVisibility = Visibility.Hidden;
                    PartySelectionVisibility = Visibility.Hidden;
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
