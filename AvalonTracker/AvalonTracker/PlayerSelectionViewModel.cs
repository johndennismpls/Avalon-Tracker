using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace AvalonTracker
{
    public class PlayerSelectionViewModel
    {
        public PlayerSelectionViewModel()
        {
            InitializeCommands();
        }

        //private void PerformAddPlayer(object thing)
        //{
            

        //}

        private void PerformAddSelectedPlayers(object listview)
        {
            var listviewInternal = listview as ListView;
            foreach (Player t in listviewInternal.SelectedItems)
            {
                if (!ActivePlayerNames.Contains(t))
                {
                    _ActivePlayerNames.Add(t);
                }
            }
        }

        private void PerformRemoveSelectedActivePlayers(object listview)
        {
            var listviewInternal = listview as ListView;
            while(listviewInternal.SelectedItems.Count != 0)
            {
                var p = listviewInternal.SelectedItems[0] as Player;
                ActivePlayerNames.Remove(p);
            }
        }

        public ICommand AddNewPlayerCommand { get; private set; }

        public ICommand AddSelectedPlayers { get; private set; }

        public ICommand RemoveSelectedActivePlayers { get; private set; }

        private void InitializeCommands()
        {
            //AddNewPlayerCommand = new RelayCommand(PerformAddPlayer);
            AddSelectedPlayers = new RelayCommand(PerformAddSelectedPlayers);
            RemoveSelectedActivePlayers = new RelayCommand(PerformRemoveSelectedActivePlayers);
        }

        public ObservableCollection<Player> AllPlayerNames { get { return DataService.AllPlayers; } }

        ObservableCollection<Player> _ActivePlayerNames = new ObservableCollection<Player>();
        public ObservableCollection<Player> ActivePlayerNames { get { return _ActivePlayerNames; } }
    }
}
