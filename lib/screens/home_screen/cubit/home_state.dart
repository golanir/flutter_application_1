part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeData extends HomeState {
  final DateTime dateTime;
  final String lastArticalTitle;

  HomeData({
    required this.dateTime,
    required this.lastArticalTitle,
  });
}
