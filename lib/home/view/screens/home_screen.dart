import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_route/Shared/Components/app_background_image.dart';
import 'package:news_app_route/Shared/constants/drawer_items.dart';
import 'package:news_app_route/category/data/models/category_model.dart';

import '../../../Settings/view/widgets/settings_tab.dart';
import '../../../Shared/Components/text_form_field_component.dart';
import '../../../Shared/Themes/app_theme.dart';
import '../../../category/view/widgets/category_details.dart';
import '../../../category/view/widgets/category_tab.dart';
import '../widgets/drawer_design.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  bool isSearch = false;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBackgroundImage(
      child: Scaffold(
        appBar: AppBar(
          leading: isSearch
              ? null
              : Builder(
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: screenWidth * .05,
                        end: screenWidth * .0001,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    );
                  },
                ),
          actions: isSearch
              ? null
              : categoryModel != null
                  ? [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * .03,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isSearch = true;
                            });
                          },
                          icon: const Icon(
                            Icons.search_outlined,
                          ),
                        ),
                      )
                    ]
                  : null,
          toolbarHeight: screenHeight * .09,
          title: isSearch
              ? Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .035,
                  ),
                  child: CustomTextFormField(
                    controller: textEditingController,
                    hintText: AppLocalizations.of(context)!.searchArticle,
                    prefixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isSearch = false;
                            textEditingController.clear();
                          });
                        },
                        icon: const Icon(
                          size: 30,
                          Icons.close,
                          color: AppTheme.primary,
                        ),
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsetsDirectional.only(end: 5.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: const Icon(
                          size: 30,
                          Icons.search,
                          color: AppTheme.primary,
                        ),
                      ),
                    ),
                  ),
                )
              : categoryModel != null
                  ? Text(categoryModel!.title)
                  : selectedItems == DrawerItems.categories
                      ? Text(AppLocalizations.of(context)!.newsApp)
                      : Text(AppLocalizations.of(context)!.settings),
        ),
        body: categoryModel != null
            ? CategoryDetails(
                categoryId: categoryModel!.id,
                query: textEditingController.text,
              )
            : selectedItems == DrawerItems.categories
                ? CategoryTab(
                    selectedCategory: onCategorySelected,
                  )
                : const SettingsTab(),
        drawer: isSearch
            ? null
            : DrawerDesign(
                onSelectedItem: onDrawerItemSelected,
              ),
      ),
    );
  }

  DrawerItems selectedItems = DrawerItems.categories;
  CategoryModel? categoryModel;

  void onDrawerItemSelected(DrawerItems drawItems) {
    selectedItems = drawItems;
    categoryModel = null;
    setState(() {});
  }

  void onCategorySelected(CategoryModel category) {
    categoryModel = category;
    setState(() {});
  }
}
