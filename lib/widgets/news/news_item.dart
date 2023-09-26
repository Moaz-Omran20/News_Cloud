import 'package:flutter/material.dart';
import 'package:news_cloud/models/article_model.dart';

class NewsItem extends StatelessWidget {
  ArticleModel? article;

  NewsItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
                  article?.image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png",
                  height: MediaQuery.sizeOf(context).height * .3,
                  width: MediaQuery.sizeOf(context).width * 1,
                  fit: BoxFit.fill,
                ),
        ),
        Text(
          article?.title ?? "No Data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          article?.subTitle ?? "No Data",
          style: TextStyle(fontSize: 16),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
