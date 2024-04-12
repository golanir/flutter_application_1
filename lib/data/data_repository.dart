import 'dart:async';

import 'package:flutter_application_1/data/constants.dart';
import 'package:flutter_application_1/data/polling_service.dart';
import 'package:flutter_application_1/data/service_locator.dart';
import 'package:flutter_application_1/models/rss_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DataRepository {
  List<PollingService> pollingList = [];

  int getLatsArticleId() {
    return 1;
  }

  Stream<(List<RssData>, bool)> getData(String url) async* {
    final poll = PollingService(url: url, duration: const Duration(seconds: 5));
    pollingList.add(poll);
    yield* startListening(poll);
  }

  void cancelFetch(List<String> url) {
    for (var pollUrl in url) {
      final isInList = pollingList.any((element) => element.url == pollUrl);
      if (isInList) {
        final poll =
            pollingList.firstWhere((element) => element.url == pollUrl);
        poll.cancel = true;
      }
    }
  }

  Stream<(List<RssData>, bool)> startListening(PollingService poll) async* {
    await for (final data in poll.init()) {
      if (data.data.isNotEmpty && !data.isLoading) {
        final list = parseRssXml(xmlString: data.data, url: poll.url);
        yield (list, false);
      } else {
        yield ([], true);
      }
    }
  }

  void setViewedItem(RssData data) async {
    (await sharedPrefs).setString(Constants.lastItemTitle, data.title);
    (await sharedPrefs).setString(Constants.lastItemUrl, data.link);
  }
}
