import 'package:flutter/material.dart';
import 'package:news_app_route/category/data/models/category_model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList(
      {super.key, required this.index, required this.categoryModel});

  final CategoryModel categoryModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadiusDirectional.only(
          topStart: const Radius.circular(25),
          topEnd: const Radius.circular(25),
          bottomStart: index.isEven
              ? const Radius.circular(25)
              : const Radius.circular(0),
          bottomEnd: index.isOdd
              ? const Radius.circular(25)
              : const Radius.circular(0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/${categoryModel.imageName}.png",
            height: screenHeight * .125,
          ),
          SizedBox(
            height: screenHeight * .01,
          ),
          Text(
            categoryModel.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
