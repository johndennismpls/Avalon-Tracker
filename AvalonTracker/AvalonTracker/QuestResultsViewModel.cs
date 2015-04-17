using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    class QuestResultsViewModel : INotifyPropertyChanged
    {
        public QuestResultsViewModel()
        {
            InitializeCommands();
            Services.GameService.GameStateChanged += GameStateChanged;
        }

        private void GameStateChanged(object sender, EventArgs e)
        {
            if (Services.GameService.CurrentGameState == GameState.QuestVoting)
            {
                QuestCards.Clear();
                int partySize = Services.GameService.GetPartySize(Services.GameService.CurrentQuestPhase);
                for (var i = 0; i < partySize; i++)
                {
                    QuestCards.Add(new QuestCard());
                }    
            }
            
        }

        public void SelectedCardChanged(object sender, EventArgs e)
        {
            var selectedIndex = ((sender as ListBox).SelectedIndex as int?).Value;
            if(selectedIndex != -1)
                QuestCards[selectedIndex].TogglePassFail();
        }


        private void PerformSubmitResults(object obj)
        {
            var results = new List<bool>();
            foreach (var questCard in QuestCards)
            {
                results.Add(questCard.PassQuest);
            }
            Services.GameService.SumbitQuestResults(results);
        }

        public ICommand SubmitResultsCommand;

        private void InitializeCommands()
        {
            SubmitResultsCommand = new RelayCommand(PerformSubmitResults);
        }



        public event PropertyChangedEventHandler PropertyChanged;

        [NotifyPropertyChangedInvocator]
        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null) handler(this, new PropertyChangedEventArgs(propertyName));
        }

        private ObservableCollection<QuestCard> _questCards = new ObservableCollection<QuestCard>();
        public ObservableCollection<QuestCard> QuestCards 
        {
            get { return _questCards; }
            set { _questCards = value; }
        }
    }

    public class QuestCard : INotifyPropertyChanged
    {
        private bool _passQuest;
        public bool PassQuest 
        {
            get { return _passQuest; }
        }

        public void TogglePassFail()
        {
            _passQuest = !_passQuest;
            OnPropertyChanged("PassFailStatus");
        }


        public string PassFailStatus
        {
            get { return (_passQuest) ? "Pass" : "Fail"; }
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
