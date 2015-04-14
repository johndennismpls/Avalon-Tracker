using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using AvalonTracker.Annotations;

namespace AvalonTracker
{
    public class QuestCardViewModel : INotifyPropertyChanged
    {
        public QuestCardViewModel()
        {
            InitializeCommands();
        }

        public bool Pass = true;

        private string _passFail = "Pass";
        public string PassFail
        {
            get { return _passFail; }
            private set
            {
                _passFail = value;
                OnPropertyChanged();
            }
        }

        private void PerformTogglePassFail(object listview)
        {
            Pass = !Pass;
            PassFail = Pass ? "Pass" : "Fail";
        }

        public ICommand TogglePassFailCommand { get; private set; }

        private void InitializeCommands()
        {
            TogglePassFailCommand = new RelayCommand(PerformTogglePassFail);
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
