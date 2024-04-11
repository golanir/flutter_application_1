import 'dart:async';

import 'package:flutter_application_1/data/polling_service.dart';

class DataRepository {
  int getLatsArticleId() {
    return 1;
  }

  Stream<PollData> getData(List<String> urls) async* {
    for (var url in urls) {
      final poll =
          PollingService(url: url, duration: const Duration(seconds: 5));

      final a = poll.init();
      a.listen((PollData event) async* {
        print('~~~ ${event}');
        yield event;
      });
    }
  }
}
