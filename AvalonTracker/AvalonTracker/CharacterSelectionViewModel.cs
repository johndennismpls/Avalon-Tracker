using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace AvalonTracker
{
    public class CharacterSelectionViewModel
    {
        IList<CharacterClass> _activeCharacterClasses = new List<CharacterClass>();

        public CharacterSelectionViewModel()
        {
            InitializeCommands();
        }

        private void PerformAddRemoveCharacterCommand(object characterName)
        {
            var characterNamelocal = characterName as string;
            for (var j = 0; j < _activeCharacterClasses.Count; j++)
            {
                if (string.Equals(characterNamelocal, _activeCharacterClasses[j].Name))
                {
                    _activeCharacterClasses.Remove(_activeCharacterClasses[j]);
                    return;
                }
            }
            for (var i = 0; i < Services.GameService.CharacterClasses.Count; i++)
            {

                if (string.Equals(characterNamelocal, Services.GameService.CharacterClasses[i].Name))
                {
                    _activeCharacterClasses.Add(Services.GameService.CharacterClasses[i]);
                    return;
                }
            }
        }

        public ICommand AddRemoveCharacterCommand { get; private set; }

        private void InitializeCommands()
        {
            AddRemoveCharacterCommand = new RelayCommand(PerformAddRemoveCharacterCommand);
        }

    }
}
