using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace AvalonTracker
{
    class QuestResultsViewModel
    {
        public QuestResultsViewModel()
        {
            InitializeCommands();
        }

        private void PerformSubmitResults(object obj)
        {
            //Services.GameService.SumbitQuestResults();
        }

        public ICommand SubmitResultsCommand;

        private void InitializeCommands()
        {
            SubmitResultsCommand = new RelayCommand(PerformSubmitResults);
        }

        private Visibility[] VotingCardVisibility;

    }
}
