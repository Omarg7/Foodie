part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}
class ThemeModeChanged extends ThemeState {
  final ThemeData userTheme;

 const ThemeModeChanged({required this.userTheme});
  ThemeModeChanged copyWith({
    ThemeData? userTheme,
  }) {
    return ThemeModeChanged(
      userTheme: userTheme ?? this.userTheme,

    );
  }
  List<Object?> get props => [userTheme];
}