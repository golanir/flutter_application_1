import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetchData() {
    final dateTie = DateTime.now();
    final lastArticalitle = "bla bla";

    emit(HomeData(
      dateTime: dateTie,
      lastArticalTitle: lastArticalitle,
    ));
  }
}
