using System;
using System.Collections.Generic;
using System.ComponentModel;
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
        private Visibility _playerSelectionVisibility;
        public Visibility PlayerSelectionVisibility { 
            get { return _playerSelectionVisibility; } 
            private set
            {
                _playerSelectionVisibility = value;
                OnPropertyChanged("PlayerSelectionVisibility");
            } 
        }

        private Visibility _partySelectionVisibility;
        public Visibility PartySelectionVisibility
        {
            get { return _partySelectionVisibility; }
            private set
            {
                _partySelectionVisibility = value;
                OnPropertyChanged("PartySelectionVisibility");
            }
        }

        public MainWindowViewModel()
        {
            PlayerSelectionVisibility = Visibility.Visible;
            PartySelectionVisibility = Visibility.Hidden;

            InitializeCommands();
        }

        private bool CanPerformStartMatchCommand(object obj)
        {
            return true;
            //if (DataService.ActivePlayers.Count > GlobalConstants.MinimumPlayers && DataService.ActivePlayers.Count < GlobalConstants.MaximumPlayers)
            //{
            //    return true;
            //}
            //return false;
        }

        private void PerformStartMatchCommand(object obj)
        {
            PlayerSelectionVisibility = Visibility.Hidden;
            PartySelectionVisibility = Visibility.Visible;
        }

        public ICommand StartMatchCommand { get; private set; }

        private void InitializeCommands()
        {
            StartMatchCommand = new RelayCommand(PerformStartMatchCommand, CanPerformStartMatchCommand);
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
