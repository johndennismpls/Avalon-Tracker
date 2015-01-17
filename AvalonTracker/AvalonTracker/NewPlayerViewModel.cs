using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace AvalonTracker
{
    public class NewPlayerViewModel
    {
        public string NewName { get; set; }

        public NewPlayerViewModel()
        {
            InitializeCommands();
        }

        private void PerformAddPlayer(object name)
        {
            DataService.AllPlayers.Add(new Player() { Name = NewName });
        }

        private bool CanAddPlayer(object name)
        {
            foreach (var player in DataService.AllPlayers)
            {
                if (player.Name == NewName)
                    return false;
            }
            return true;
        }

        public ICommand AddNewPlayerCommand { get; private set; }

        private void InitializeCommands()
        {
            AddNewPlayerCommand = new RelayCommand(PerformAddPlayer, CanAddPlayer);
        }
    }
}
