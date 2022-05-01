import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

import '../helper/news.dart';
import 'ArticleView.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({required this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  void initState() {
    super.initState();
    getCategoriesNews();
  }

  bool _loading = true;
  List<ArticleModel> model = <ArticleModel>[];

  getCategoriesNews() async {
    CategoryNewsClass news = CategoryNewsClass();
    await news.getCategoriesNews(widget.category);
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
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.save),
            ),
          ),
        ],
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
                child: Column(
                  children: <Widget>[
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
