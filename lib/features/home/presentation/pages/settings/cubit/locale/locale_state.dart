part of 'locale_cubit.dart';

abstract class LocaleState extends Equatable {
  const LocaleState();
}

class LocaleInitial extends LocaleState {
  @override
  List<Object> get props => [];
}

class ChangeLocalState extends LocaleState {
  final Locale locale;

  const ChangeLocalState({required this.locale});

  @override
  List<Object> get props => [locale];
}
