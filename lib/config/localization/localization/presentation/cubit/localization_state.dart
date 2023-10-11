part of 'localization_cubit.dart';

abstract class LocalizationState extends Equatable {
  final Locale locale;
  const LocalizationState(this.locale);
  @override
  List<Object> get props => [locale];
}

class LocalizationChanged extends LocalizationState {

  const LocalizationChanged(final Locale locale) : super(locale);
  @override
  List<Object> get props => [locale];
  LocalizationChanged copyWith(Locale? locale){
    return LocalizationChanged(locale??this.locale);
}
}
