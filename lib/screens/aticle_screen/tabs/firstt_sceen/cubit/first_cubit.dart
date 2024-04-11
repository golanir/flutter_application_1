import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/polling_service.dart';
import 'package:flutter_application_1/data/service_locator.dart';
import 'package:meta/meta.dart';

part 'first_state.dart';

class FirstCubit extends Cubit<FirstState> {
  FirstCubit() : super(FirstInitial());

  Future<void> getData() async {
    dataRepository.getData(
        ["http://www.ynet.co.il/integration/StoryRss550.xml"]).listen((event) {
      print("~ ${event.data} , ${event.isLoading}");
    });
  }
}
