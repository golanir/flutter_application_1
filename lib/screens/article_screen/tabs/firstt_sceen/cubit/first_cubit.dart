import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/service_locator.dart';
import 'package:flutter_application_1/models/rss_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'first_state.dart';

class FirstCubit extends Cubit<FirstState> {
  final url = ["http://www.ynet.co.il/integration/StoryRss550.xml"];
  FirstCubit()
      : super(const FirstState(
          isLoading: true,
          data: [],
        ));

  Future<void> getData() async {
    for (var element in url) {
      dataRepository.getData(element).listen((event) {
        final data = event.$1.isEmpty ? null : event.$1;
        emit(state.copyWith(isLoading: event.$2, data: data));
      });
    }
  }

  @override
  Future<void> close() {
    dataRepository.cancelFetch(url);
    return super.close();
  }
}
