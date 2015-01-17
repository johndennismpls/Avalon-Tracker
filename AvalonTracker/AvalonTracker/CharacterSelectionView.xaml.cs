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
    /// Interaction logic for CharacterSelectionView.xaml
    /// </summary>
    public partial class CharacterSelectionView : UserControl
    {
        private CharacterSelectionViewModel _viewModel;

        public CharacterSelectionView()
        {
            InitializeComponent();
            _viewModel = new CharacterSelectionViewModel();
        }
    }
}
