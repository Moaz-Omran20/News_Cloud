import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_cloud/services/news_services/news_services.dart';

import '../widgets/news/news_item.dart';

class CategoryPageNews extends StatelessWidget {
  String categoryName;

  CategoryPageNews({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          categoryName,
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future:
            NewsService(Dio()).getNews(category: categoryName.toLowerCase()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: NewsItem(
                    article: snapshot.data?[index],
                  ),
                );
              },
              itemCount: snapshot.data?.length,
            );
          } else if (snapshot.hasError) {
            return Text("Oops,something went wrong,try again later");
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
