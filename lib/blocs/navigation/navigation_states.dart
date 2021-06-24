abstract class NavigationState {}

class NavigationStateUninitialized extends NavigationState {}

class NavigationStateInitialized extends NavigationState {
  final int index;
  NavigationStateInitialized(this.index);
}
