import 'package:flutter/material.dart';
import 'package:flutter_app_catbox/models/cat.dart';
import 'package:flutter_app_catbox/ui/cat_details/footer/showCase_cattribute.dart';
import 'package:flutter_app_catbox/ui/cat_details/footer/showCase_details.dart';
import 'package:flutter_app_catbox/ui/cat_details/footer/showCase_pictures.dart';

class CatShowCase extends StatefulWidget {
final Cat cat;

CatShowCase(this.cat);
  @override
  _CatShowCaseState createState() => _CatShowCaseState();
}

class _CatShowCaseState extends State<CatShowCase> with TickerProviderStateMixin{

  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(child: Text('Pictures')),
      Tab(child: Text('Details')),
      Tab(child: Text('cattributes'))
    ];

    _pages = [
      PicturesShowCase(cat: widget.cat),
      DetailsShowCase(cat: widget.cat),
      CattributesShowCase(cat: widget.cat)
    ];

    _controller = TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white70,
          ),
          SizedBox.fromSize(
            size: Size.fromHeight(300.0),
            child: TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
