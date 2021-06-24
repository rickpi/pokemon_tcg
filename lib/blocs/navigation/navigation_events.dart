abstract class NavigationEvent {}

class NavigationEventNavigate extends NavigationEvent {
  final int index;

  NavigationEventNavigate(this.index);
}
