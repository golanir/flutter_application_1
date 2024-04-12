part of 'first_cubit.dart';

@immutable
class FirstState extends Equatable {
  final bool isLoading;
  final List<RssData> data;

  const FirstState({
    required this.isLoading,
    required this.data,
  });

  FirstState copyWith({
    bool? isLoading,
    List<RssData>? data,
  }) {
    return FirstState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [isLoading, data];
}
