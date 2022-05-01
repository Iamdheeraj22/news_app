import 'package:flutter/material.dart';
import 'package:news_app/Views/ArticleView.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/CategoryModel.dart';
import 'package:news_app/models/article_model.dart';

import 'CategoryNews.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> model = <ArticleModel>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    model = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: 
                Column(
                  children: <Widget>[
                    //Categories
                    Container(
                      height: 100,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageurl: categories[index].imageUrl,
                              categoryname: categories[index].categoryName,
                            );
                          }),
                    ),
                    //Blogs
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: model.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imgUrl: model[index].urlToImage,
                            title: model[index].title,
                            desc: model[index].description,
                            url: model[index].url,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final  imageurl, categoryname;
  CategoryTile({this.imageurl, this.categoryname});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryNews(
                  category: categoryname.toString().toLowerCase(),
                )))
      },
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageurl,
                    width: 120, height: 60, fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(6),
              ),
              height: 60,
              child: Text(
                categoryname,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final title, imgUrl, desc, url;
  BlogTile(
      {@required this.title,
      @required this.imgUrl,
      @required this.desc,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imgUrl)),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
