part of 'second_cubit.dart';

class SecondState extends Equatable {
  final bool isLoading;
  final List<RssData> data;

  const SecondState({
    required this.isLoading,
    required this.data,
  });

  SecondState copyWith({
    bool? isLoading,
    List<RssData>? data,
  }) {
    return SecondState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }

  @override
  List<Object> get props => [isLoading, data];
}
