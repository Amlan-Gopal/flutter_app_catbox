import 'package:flutter/material.dart';
import 'package:flutter_app_catbox/models/cat.dart';
import 'package:flutter_app_catbox/services/api.dart';
import 'package:flutter_app_catbox/ui/cat_details/details_page.dart';
import 'package:flutter_app_catbox/utils/routes.dart';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  List<Cat> _cats = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCats();
  }
  _loadCats() async{
    String fileData = await DefaultAssetBundle.of(context).loadString("assets/cats.json");
    setState(() {
      _cats = CatApi.allCatsFromJson(fileData);
    });
  }

  _navigateToCatDetails(Cat cat, Object avatarTag){
     Navigator.of(context).push(
       FadePageRoute(
         builder: (context) => CatDetailsPage(cat, avatarTag: avatarTag),
         settings: RouteSettings()
       )
     );
  }

  Widget _getAppTitleWidget(){
    return Text(
        'Cats',
    style: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold
    ),
    );
  }

  Future<Null> refresh(){
    _loadCats();
    return Future<Null>.value();
  }

  Widget _buildCatItem(BuildContext context, int index){
      Cat cat = _cats[index];
      return Card(
        margin: const EdgeInsets.only(top: 15.0),
          elevation: 5.0,
              child: ListTile(
                onTap: () => _navigateToCatDetails(cat, index),
                leading: Hero(
                  tag: index,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(cat.avatarURL),
                  ),
                ),
                title: Text(
                  cat.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54
                  ),
                ),
                subtitle: Text(cat.description),
                isThreeLine: true,
                dense: false,
              )
      );
  }

  Widget _getListViewWidget(){
       return Flexible(
         child: RefreshIndicator(
           onRefresh: refresh,
           child: ListView.builder(
             physics: const AlwaysScrollableScrollPhysics(),
               itemCount: _cats.length,
               itemBuilder: _buildCatItem,
           ),
         ),
       );
  }

  Widget _buildBody(){
     return Container(
       margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 1.0),
       child: Column(
         children: <Widget>[
           _getAppTitleWidget(),
           _getListViewWidget()
         ],
       ),
     );  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: _buildBody(),
    );
  }
}
