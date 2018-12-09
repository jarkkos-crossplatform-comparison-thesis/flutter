import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListItem {
  final String description;
  final ImageProvider imageProvider;
  ListItem(this.description, this.imageProvider);
}

abstract class ListDataLoader {
  Future<List<ListItem>> getData(BuildContext context);
}

class LocalDataLoader implements ListDataLoader {
  @override
  Future<List<ListItem>> getData(BuildContext context) async {
    final String data = await DefaultAssetBundle.of(context).loadString("assets/listItems.json");
    final List jsonData = json.decode(data);
    return jsonData.map((item) {
      return ListItem(item["description"], AssetImage(item["imageSrc"]));
    }).toList();
  }
}

class NetworkDataLoader implements ListDataLoader {
  @override
  Future<List<ListItem>> getData(BuildContext context) async {
    http.Response response = await http.get("http://192.168.1.158/thesis/listItems.json");
    final List jsonData = json.decode(response.body);
    return jsonData.map((item) {
      return ListItem(item["description"], NetworkImage(item["imageSrc"], scale: 1.0));
    }).toList();
  }
}