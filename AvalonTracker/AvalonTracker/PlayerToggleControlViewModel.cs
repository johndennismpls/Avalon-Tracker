using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using AvalonTracker.Annotations;

namespace AvalonTracker
{
    public class PlayerToggleControlViewModel : INotifyPropertyChanged
    {
        public PlayerToggleControlViewModel()
        {
            BorderThickness = 0;
            InitializeCommands();
        }


        private Player _thePlayer;
        public Player thePlayer
        {
            get { return _thePlayer; }
            set
            {
                if (Equals(value, _thePlayer)) return;
                _thePlayer = value;
                OnPropertyChanged();
            }
        }

        public GameState CurrentGameState { get { return Services.GameService.CurrentGameState; } }

        public int BorderThickness { get; private set; }

        private void PerformSelectPlayerCommand(object obj)
        {
            switch (CurrentGameState)
            {
                case GameState.PartySelection:
                    AddRemovePlayerFromParty(obj);
                    break;
                case GameState.PartyVoting:
                    ApproveRejectVoting(obj);
                    break;
            }
        }

        private string _voteString;
        public string VoteString { get { return _voteString; } }

        private void ApproveRejectVoting(object obj)
        {
            var key = new Tuple<Player, int,int, int>(thePlayer, Services.GameService.CurrentGameId, Services.GameService.CurrentQuest, Services.GameService.VoteTrack);
            Services.GameService.VoteTable[key] = !Services.GameService.VoteTable[key];
            _voteString = Services.GameService.VoteTable[key] ? "APPROVE!" : "REJECT!";
            OnPropertyChanged("VoteString");
        }


        private void AddRemovePlayerFromParty(object obj)
        {
            bool selectPlayer = true;
            foreach (var activePlayer in Services.GameService.ActiveParty)
            {
                if (thePlayer == activePlayer)
                {
                    selectPlayer = false;
                    break;
                }
            }
            if (selectPlayer)
            {
                Services.GameService.ActiveParty.Add(thePlayer);
                BorderThickness = 20;
            }
            else
            {
                Services.GameService.ActiveParty.Remove(thePlayer);
                BorderThickness = 0;
            }
            OnPropertyChanged("BorderThickness");
        }

        private bool CanPerformSelectPlayerCommand(object obj )
        {
            return thePlayer != null;
        }

        public ICommand SelectPlayerCommand { get; set; }

        public Visibility IsPartyChooser
        {
            get 
            {
                return (Services.GameService.PartyChooser == thePlayer) ? Visibility.Visible : Visibility.Hidden;
            }
        }

        private void InitializeCommands()
        {
            SelectPlayerCommand = new RelayCommand(PerformSelectPlayerCommand, CanPerformSelectPlayerCommand);
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
