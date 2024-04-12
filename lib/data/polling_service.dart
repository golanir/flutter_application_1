// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter_application_1/data/service_locator.dart';
import 'package:flutter_application_1/models/poll_data.dart';

class PollingService {
  final String url;
  final Duration duration;
  bool _cancel = false;

  PollingService({
    required this.url,
    required this.duration,
  });

  set cancel(bool cancel) {
    _cancel = cancel;
  }

  Stream<PollData> init() async* {
    if (_cancel) return;

    yield PollData(data: "", isLoading: true);
    final data = await fetchData();
    yield PollData(data: data, isLoading: false);

    await Future.delayed(const Duration(seconds: 5));
    yield* init();
  }

  Future<String> fetchData() async {
    final response = await httpService.getData(
        url: url, pullDuration: const Duration(seconds: 5));
    return response;
  }
}
