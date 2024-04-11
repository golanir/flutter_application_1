// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';
import 'package:flutter_application_1/data/service_locator.dart';

class PollingService {
  final String url;
  final Duration duration;

  PollingService({
    required this.url,
    required this.duration,
  });

  Stream<PollData> init() async* {
    Timer.periodic(duration, (Timer t) async* {
      t.cancel();
      yield PollData(data: "", isLoading: true);
      final data = await fetchData();
      yield PollData(data: data, isLoading: false);
      init();
    });
  }

  Future<String> fetchData() async {
    final response = await httpService.getData(
        url: url, pullDuration: const Duration(seconds: 5));
    return response;
  }

  PollingService copyWith({
    String? url,
    Duration? duration,
  }) {
    return PollingService(
      url: url ?? this.url,
      duration: duration ?? this.duration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'duration': duration.inMilliseconds,
    };
  }

  factory PollingService.fromMap(Map<String, dynamic> map) {
    return PollingService(
      duration: Duration(milliseconds: map['duration']),
      url: map['urls'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PollingService.fromJson(String source) =>
      PollingService.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PollingService(urls: $url, duration: $duration)';
}

class PollData {
  final String data;
  final bool isLoading;

  PollData({
    required this.data,
    required this.isLoading,
  });
}
