import 'package:flutter/material.dart';
import 'package:news_app_route/Models/Category_model/category_model.dart';

import '../../../Shared/Themes/app_theme.dart';
import 'category_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key, required this.selectedCategory});

  final void Function(CategoryModel) selectedCategory;

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {



  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        id: 'sports',
        title: AppLocalizations.of(context)!.sports,
        imageName: "sports",
        color: AppTheme.fireRed,
      ),
      CategoryModel(
        id: 'technology',
        title: AppLocalizations.of(context)!.technology,
        imageName: "technology",
        color: AppTheme.midnightBlue,
      ),
      CategoryModel(
        id: 'health',
        title: AppLocalizations.of(context)!.health,
        imageName: "health",
        color: AppTheme.deepPink,
      ),
      CategoryModel(
        id: 'business',
        title: AppLocalizations.of(context)!.business,
        imageName: "business",
        color: AppTheme.peru,
      ),
      CategoryModel(
        id: 'entertainment',
        title: AppLocalizations.of(context)!.entertainment,
        imageName: "entertainment",
        color: AppTheme.steelBlue,
      ),
      CategoryModel(
        id: 'science',
        title: AppLocalizations.of(context)!.science,
        imageName: "science",
        color: AppTheme.sandBrown,
      ),
    ];

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: screenWidth * .054,
        end: screenWidth * .037,
        bottom: screenHeight * .01,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * .036,
            ),
            child: Text(
              AppLocalizations.of(context)!.pickCategory,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: screenHeight * .020,
                crossAxisSpacing: screenWidth * .07,
              ),
              itemBuilder: (_, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    return widget.selectedCategory(category);
                  },
                  child: CategoryList(
                    categoryModel: category,
                    index: index,
                  ),
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
