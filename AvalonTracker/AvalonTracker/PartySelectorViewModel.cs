using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    public class PartySelectorViewModel : INotifyPropertyChanged
    {
        public ObservableCollection<Player> ActivePlayers { get { return Services.GameService.ActivePlayers; } }
        public ObservableCollection<Player> ActiveParty { get { return Services.GameService.ActiveParty; } }


        public PartySelectorViewModel()
        {
            InitializeCommands();
        }

        public void InitializeCommands()
        {
        }
        
        public ICommand GoToVoteCommand { get; set; }

        public event PropertyChangedEventHandler PropertyChanged;

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
 