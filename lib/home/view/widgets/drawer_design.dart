import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_route/Shared/Themes/app_theme.dart';
import 'package:news_app_route/Shared/constants/drawer_items.dart';

import '../../../Shared/Components/app_background_image.dart';

class DrawerDesign extends StatelessWidget {
  const DrawerDesign({
    super.key,
    required this.onSelectedItem,
  });

  final void Function(DrawerItems) onSelectedItem;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * 0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: AppTheme.primary,
            height: screenHeight * 0.25,
            width: double.infinity,
            child: Text(
              "${AppLocalizations.of(context)!.newsApp}!",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    color: AppTheme.white,
                  ),
            ),
          ),
          Expanded(
            child: AppBackgroundImage(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .05,
                    vertical: screenHeight * .04),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        onSelectedItem(DrawerItems.categories);
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: screenWidth * .12,
                            color: AppTheme.black,
                          ),
                          SizedBox(
                            width: screenWidth * .04,
                          ),
                          Text(
                            AppLocalizations.of(context)!.categories,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: 24,
                                  color: AppTheme.black,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * .037,
                    ),
                    InkWell(
                      onTap: () {
                        onSelectedItem(DrawerItems.settings);
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            size: screenWidth * .12,
                            color: AppTheme.black,
                          ),
                          SizedBox(
                            width: screenWidth * .04,
                          ),
                          Text(
                            AppLocalizations.of(context)!.settings,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: 24,
                                  color: AppTheme.black,
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
