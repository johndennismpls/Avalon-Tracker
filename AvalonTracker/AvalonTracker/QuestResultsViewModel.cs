using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace AvalonTracker
{
    class QuestResultsViewModel
    {
        IList<Boolean> cards;
        public ObservableCollection<string> cardStrings;

        public QuestResultsViewModel()
        {
            cards = new List<Boolean>() { true, true, true, true, true };
            cardStrings = new ObservableCollection<string>() { "Passed", "Passed", "Passed", "Passed", "Passed" };

            InitializeCommands();
        }

     
        public ICommand SuccessFailCommand { get; set; }

  
        private void ToggleSuccessFail(object CardNumber)
        {
            var cardTemp = int.Parse(CardNumber as string);
            
            cards[cardTemp] = !cards[cardTemp];
            if (cards[cardTemp])
            {
                cardStrings[cardTemp] = "Passed";
            }
            else
            {
                cardStrings[cardTemp] = "Failed";
            }


        }

        public void InitializeCommands()
        {
            SuccessFailCommand = new RelayCommand(ToggleSuccessFail);
        }
        
          
        
    }
}
