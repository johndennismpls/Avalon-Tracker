using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
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
    /// Interaction logic for PlayerToggleControl.xaml
    /// </summary>
    public partial class PlayerToggleControl : UserControl
    {
        private PlayerToggleControlViewModel _playerToggleControlViewModel = new PlayerToggleControlViewModel();
        public PlayerToggleControl()
        {
            InitializeComponent();
            DataContext = _playerToggleControlViewModel;
        }

        public Player Player
        {
            get { return (Player)this.GetValue(PlayerProperty); }
            set { this.SetValue(PlayerProperty, value); }
        }

        public static readonly DependencyProperty PlayerProperty = DependencyProperty.Register("Player", typeof(Player), typeof(PlayerToggleControl), new FrameworkPropertyMetadata(new PropertyChangedCallback(PropChangedTarget)));

        private static void PropChangedTarget(DependencyObject dependencyObject, DependencyPropertyChangedEventArgs dependencyPropertyChangedEventArgs)
        {
            var control = (PlayerToggleControl)dependencyObject;
            control._playerToggleControlViewModel.thePlayer = control.Player;
        }
    }
}
