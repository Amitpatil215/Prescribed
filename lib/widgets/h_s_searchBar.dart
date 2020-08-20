import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';

class HSSearchBar extends StatefulWidget {
  @override
  _HSSearchBarState createState() => _HSSearchBarState();
}

class _HSSearchBarState extends State<HSSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: FloatingSearchBar(
        children: [],
        pinned: true,
        trailing: IconButton(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {},
        ),
        // drawer: Drawer(
        //   child: Container(),
        // ),
        onChanged: (String value) {
          print(value);
        },
        onTap: () {},
        decoration: InputDecoration.collapsed(
          hintText: "Search for doctors...",
        ),
      ),
    );
  }
}
