part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}
class ChangeThemeState extends ThemeState{
  final ThemeData theme;
  const ChangeThemeState({required this.theme});
  @override
  List<Object> get props =>[theme];
}
