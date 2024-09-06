import 'package:flutter/material.dart';

import '../Themes/app_theme.dart';

class DefaultDropBtn extends StatelessWidget {
  const DefaultDropBtn({
    super.key,
    required this.currentValue,
    required this.firstValue,
    required this.secondValue,
    required this.firstTitle,
    required this.secondTitle,
    this.onChanged,
  });

  final String currentValue;
  final String firstValue;
  final String secondValue;
  final String firstTitle;
  final String secondTitle;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.primary,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * .012,
            horizontal: screenWidth * .04,
          ),
          dropdownColor: AppTheme.white,
          isDense: true,
          iconSize: 30,
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppTheme.primary, // Add this
          ),
          value: currentValue,
          items: [
            DropdownMenuItem(
              value: firstValue,
              child: Text(
                firstTitle,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppTheme.primary,
                    ),
              ),
            ),
            DropdownMenuItem(
              value: secondValue,
              child: Text(
                secondTitle,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppTheme.primary,
                    ),
              ),
            )
          ],
          onChanged: onChanged,
        ),
      ),
    );
  }
}
