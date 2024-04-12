import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/service_locator.dart';
import 'package:flutter_application_1/models/rss_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ListTileModel extends StatelessWidget {
  final RssData data;

  const ListTileModel({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.title),
      onTap: () async {
        dataRepository.setViewedItem(data);
        final uri = Uri.parse(data.link);
        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        }
      },
    );
  }
}
