import 'package:flutter/material.dart';
import 'package:news_cloud/models/category_model.dart';
import 'package:news_cloud/screens/category_page_news.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryItem(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryPageNews( categoryName: categoryModel.categoryName,),
            ),);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: 150,
          height: MediaQuery.sizeOf(context).height * .12,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    categoryModel.imagePath,
                  ),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20),
              color: Colors.red),
          child: Center(
              child: Text(
            categoryModel.categoryName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
        ),
      ),
    );
  }
}
