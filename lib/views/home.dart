import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/categories_model.dart';
import 'package:wallpaperapp/model/wallpaper_model.dart';
import 'package:wallpaperapp/views/category.dart';
import 'package:wallpaperapp/views/search.dart';
import 'package:wallpaperapp/widget/widget.dart';
import 'package:http/http.dart' as http;

import 'image_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categories = new List();
  List<WallpaperModel> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();

  getTrendingWallpapers() async{
    var response = await http.get("https://api.pexels.com/v1/curated?per_page=50&page=1",
      headers: {
        "Authorization":apiKey
      });
    
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      // print(element);
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
      
    });

    setState(() {
      
    });

  }

  @override
  void initState() {
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
              child: Container(child: Column(
          children:<Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(children:<Widget>[
                Expanded(
                  child:TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText:"Search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Search(
                        searchQuery: searchController.text,
                      )
                      ));
                  },
                  child: Container(
                    child: Icon(Icons.search)),
                )
              ],),
            ),

            Container(child: Row(
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 15, 0, 15),
                    child: Text(
                      "Categories",
                      style: TextStyle(color: Colors.black, fontFamily: 'Fredoka One', fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,  
                      
                    ),
                  ),
                ],
            ),),
            Container(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal:24),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context,index){
                  return CategoriesTile(
                    title: categories[index].categoryName,
                    imgUrl: categories[index].imgUrl,
                    );
                }),
            ),
              // SizedBox(height:16,),
              Container(child: Row(
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 15, 0, 15),
                    child: Text(
                      "Trending",
                      style: TextStyle(color: Colors.black, fontFamily: 'Fredoka One', fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,  
                      
                    ),
                  ),
                ],
            ),),
              wallpapersList(wallpapers: wallpapers,context: context),
              SizedBox(height:16,),
        ],),),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {

  final String imgUrl, title;
  CategoriesTile({@required this.title,@required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context)=> Category(
              categoryName: title.toLowerCase(),
            )
            ));
        },
        child: Container(
        margin: EdgeInsets.only(right:4),
        child: Stack(
          children: <Widget>[
          ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(imgUrl, height: 70,width: 100, fit: BoxFit.cover,),
              ),
          Container(
            alignment: Alignment.center,
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(10),
            ),
            child:Text(title,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 15),),)
        ],),
        
      ),
    );
  }
}
