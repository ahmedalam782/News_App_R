import 'package:flutter/material.dart';
import 'package:news_app_route/Ui/Widget/Settings/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../Shared/Components/default_drop_btn.dart';
import '../../../Shared/Themes/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * .026,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .045,
            ),
            child: Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 14,
                    color: AppTheme.black,
                  ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .03,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .09,
            ),
            child: DefaultDropBtn(
              currentValue: settingProvider.lang,
              firstValue: 'en',
              secondValue: 'ar',
              firstTitle: AppLocalizations.of(context)!.english,
              secondTitle: AppLocalizations.of(context)!.arabic,
              onChanged: (value) => settingProvider.changeLanguage(value!),
            ),
          ),
        ],
      ),
    );
  }
}
