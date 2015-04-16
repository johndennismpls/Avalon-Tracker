using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AvalonTracker
{
    /// <summary>
    /// Interaction logic for QuestResultView.xaml
    /// </summary>
    public partial class QuestResultView : UserControl
    {
        private readonly QuestResultsViewModel _questResultsViewModel = new QuestResultsViewModel();

        public QuestResultView()
        {
            DataContext = _questResultsViewModel;
            InitializeComponent();
        }

        private void ListBox_MouseDown(object sender, EventArgs e)
        {
            _questResultsViewModel.SelectedCardChanged(sender, e);
        }
    }
}
