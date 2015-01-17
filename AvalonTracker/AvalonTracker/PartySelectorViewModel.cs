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
        private PartySelectorViewModel()
        {
            InitializeCommands();
        }

        private void PerformSelectSlotCommand(object name)
        {
            var tempName = name as string;
            foreach (Player player in ActiveParty)
            {
                if (string.Equals(player.Name, tempName))
                {
                    ActiveParty.Remove(player);
                    return;
                }
            }
        }

        public void InitializeCommands()
        {
            SelectSlotCommand = new RelayCommand(PerformSelectSlotCommand);
        }

        private ICommand SelectSlotCommand { get; set; }

        public ObservableCollection<Player> ActiveParty { get { return DataService.ActiveParty; }}
    }
}
 