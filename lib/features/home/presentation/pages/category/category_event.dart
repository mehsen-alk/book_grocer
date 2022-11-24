part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}
class GetRomanceBookList extends CategoryEvent{
  @override
  List<Object?> get props => [];
}class GetMysteryAndDetectiveBookList extends CategoryEvent{
  @override
  List<Object?> get props => [];
}class GetHorrorBookList extends CategoryEvent{
  @override
  List<Object?> get props => [];
}class GetActionAndAdventureBookList extends CategoryEvent{
  @override
  List<Object?> get props => [];
}class GetScienceFictionBookList extends CategoryEvent{
  @override
  List<Object?> get props => [];
}