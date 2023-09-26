import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import 'category_item.dart';

class CategoriesListView extends StatelessWidget {

  List<CategoryModel> categories = [
    CategoryModel(
        imagePath: "assets/images/general.jpg", categoryName: "General"),
    CategoryModel(
        imagePath: "assets/images/sports.jpg", categoryName: "Sports"),
    CategoryModel(
        imagePath: "assets/images/technology.jpeg", categoryName: "Technology"),
    CategoryModel(
        imagePath: "assets/images/science.jpeg", categoryName: "Science"),
    CategoryModel(
        imagePath: "assets/images/business.jpg", categoryName: "Business"),
    CategoryModel(
        imagePath: "assets/images/health.jpg", categoryName: "Health"),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * .12,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem(categories[index]);
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
