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

        private void PerformAddPlayer(object o)
        {
            //Services.GameService.AllPlayers.Add(new Player() { Name = NewName });
            Services.GameService.AddNewPlayer(NewName);
        }

        private bool CanAddPlayer(object name)
        {
            foreach (var player in Services.GameService.AllPlayers)
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
