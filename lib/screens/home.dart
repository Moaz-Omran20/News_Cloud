import 'package:flutter/material.dart';
import 'package:news_cloud/widgets/category/category_item_list.dart';
import '../widgets/news/news_items_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              "Cloud",
              style: TextStyle(fontSize: 20, color: Colors.amber),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: CustomScrollView(
          slivers: [
            CategoriesListView(),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            NewsItemsListView(),
          ],
        ),
      ),
    );
  }
}
