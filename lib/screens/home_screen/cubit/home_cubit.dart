import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/constants.dart';
import 'package:flutter_application_1/data/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          dateTime: DateTime.now(),
          lastArticalTitle: "",
        ));

  updateData() async {
    final lastArticalTitle =
        (await sharedPrefs).getString(Constants.lastItemTitle) ?? "";

    emit(state.copyWith(
      dateTime: DateTime.now(),
      lastArticalTitle: lastArticalTitle,
    ));
  }
}
