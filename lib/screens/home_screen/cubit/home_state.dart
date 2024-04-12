part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  final DateTime dateTime;
  final String lastArticalTitle;

  const HomeState({
    required this.dateTime,
    required this.lastArticalTitle,
  });

  HomeState copyWith({
    DateTime? dateTime,
    String? lastArticalTitle,
  }) {
    return HomeState(
      dateTime: dateTime ?? this.dateTime,
      lastArticalTitle: lastArticalTitle ?? this.lastArticalTitle,
    );
  }

  @override
  List<Object?> get props => [dateTime];
}
