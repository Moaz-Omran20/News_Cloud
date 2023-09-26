import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_cloud/services/news_services/news_services.dart';
import '../../models/article_model.dart';
import 'news_item.dart';

class NewsItemsListView extends StatefulWidget {
  @override
  State<NewsItemsListView> createState() => _NewsItemsListViewState();
}

class _NewsItemsListViewState extends State<NewsItemsListView> {
  // ignore: prefer_typing_uninitialized_variables
  var future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = NewsService(Dio()).getNews(category: "general");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: snapshot.data?.length, (context, index) {
              return NewsItem(
                article: snapshot.data?[index],
              );
            }),
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
              child: Text("Oops,something went wrong,try again later"));
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
