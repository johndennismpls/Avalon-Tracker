using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace AvalonTracker
{
    public class PartySelectorViewModel
    {
        public ObservableCollection<Player> ActivePlayers { get { return DataService.ActivePlayers; } }
        public ObservableCollection<Player> ActiveParty { get { return DataService.ActiveParty; } }
        public ObservableCollection<bool> SelectedCell { get; private set; }

        public PartySelectorViewModel()
        {
            InitializeCommands();
        }

        private void PerformSelectSlotCommand(object player)
        {
            if (player == null)
                return;

            var tempPlayer = player as Player;
            foreach (Player activePlayer in ActiveParty)
            {
                if (tempPlayer == activePlayer)
                {
                    ActiveParty.Remove(activePlayer);
                    return;
                }
            }
            ActiveParty.Add(tempPlayer);
        }

        public void InitializeCommands()
        {
            SelectedCell = new ObservableCollection<bool>(){false, false, false, false, false, false, false, false, false, false};
            SelectSlotCommand = new RelayCommand(PerformSelectSlotCommand);
        }
        
        public ICommand SelectSlotCommand { get; set; }

    }
}
 