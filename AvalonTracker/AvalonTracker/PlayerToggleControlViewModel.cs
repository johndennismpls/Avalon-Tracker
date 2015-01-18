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


        //private Visibility _partySelectionVisibility;
        //public Visibility PartySelectionVisibility
        //{
        //    get { return _partySelectionVisibility; }
        //    private set
        //    {
        //        _partySelectionVisibility = value;
        //        OnPropertyChanged("PartySelectionVisibility");
        //    }
        //}


        public Player thePlayer { get; set; }

        public PlayerToggleControlViewModel()
        {
            BorderThickness = 0;
            InitializeCommands();
        }

        public int BorderThickness { get; private set; }

        private void PerformSelectPlayerCommand(object obj)
        {
            bool selectPlayer = true;
            foreach (var activePlayer in DataService.ActiveParty)
            {
                if (thePlayer == activePlayer)
                {
                    selectPlayer = false;
                    break;
                }
            }
            if (selectPlayer)
            {
                DataService.ActiveParty.Add(thePlayer);
                BorderThickness = 20;
            }
            else
            {
                DataService.ActiveParty.Remove(thePlayer);
                BorderThickness = 0;
            }
            OnPropertyChanged("BorderThickness");
        }

        private bool CanPerformSelectPlayerCommand(object obj )
        {
           // return (thePlayer != null);
            return true;
        }

        public ICommand SelectPlayerCommand { get; set; }


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
