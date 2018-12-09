import 'package:flutter/material.dart';

import 'package:flutter_app/listitems/ListDataLoader.dart';

class ListItemsScreen extends StatefulWidget {
  final String title;
  final ListDataLoader dataLoader;

  const ListItemsScreen({Key key, this.title, this.dataLoader})
      : super(key: key);

  @override
  _ListItemsScreenState createState() => new _ListItemsScreenState(dataLoader);
}

class _ListItemsScreenState extends State<ListItemsScreen> {
  final ListDataLoader _dataLoader;
  List<ListItem> _listItems = List<ListItem>();

  _ListItemsScreenState(this._dataLoader);

  @override
  void initState() {
    super.initState();
    _dataLoader.getData(context).then((items) {
      setState(() {
        _listItems = items;
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return _buildListItemWidget(_listItems[i]);
        },
        itemCount: _listItems.length,
      ),
    );
  }

  Widget _buildListItemWidget(ListItem item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: <Widget>[
          Image(
            image: item.imageProvider,
            width: 80.0,
            height: 80.0,
          ),
          Expanded(child: Text(item.description)),
        ],
      ),
    );
  }
}
