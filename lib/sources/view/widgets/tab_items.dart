import 'package:flutter/material.dart';
import 'package:news_app_route/Shared/Themes/app_theme.dart';

class TabItems extends StatelessWidget {
  const TabItems({super.key, required this.source, required this.isSelected});

  final String source;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * .023,
      ),
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * .01,
        horizontal: MediaQuery.sizeOf(context).width * .02,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.all(
          color: AppTheme.primary,
          width: 2,
        ),
        color: isSelected ? AppTheme.primary : Colors.transparent,
      ),
      child: Text(
        source,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.primary,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
      ),
    );
  }
}
