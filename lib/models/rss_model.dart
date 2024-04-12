import 'dart:convert';
import 'package:xml/xml.dart';

class RssData {
  final String url;
  final String title;
  final String description;
  final String link;
  final String pubDate;
  final String guid;
  final String tags;

  RssData({
    required this.url,
    required this.title,
    required this.description,
    required this.link,
    required this.pubDate,
    required this.guid,
    required this.tags,
  });
}

List<RssData> parseRssXml({required String xmlString, required String url}) {
  final utfXml = utf8.decode(xmlString.codeUnits);
  final document = XmlDocument.parse(utfXml);

  final items = document.findAllElements('item');
  return items.map((item) {
    return RssData(
      url: url,
      title: item.findElements('title').single.innerText,
      description: item.findElements('description').single.innerText,
      link: item.findElements('link').single.innerText,
      pubDate: item.findElements('pubDate').single.innerText,
      guid: item.findElements('guid').single.innerText,
      tags: item.findElements('tags').single.innerText,
    );
  }).toList();
}
