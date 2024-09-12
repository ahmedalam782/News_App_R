import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_route/Shared/Themes/app_theme.dart';
import 'package:news_app_route/news_content/view/screens/news_content.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'Settings/view_model/settings_view_model.dart';
import 'Shared/network/local/cache_helper.dart';
import 'home/view/screens/home_screen.dart';
import 'splash/view/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('en', timeago.EnMessages());
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  await CacheHelper.init();
  String lang = await CacheHelper.getData(key: 'isLanguage') ?? "en";
  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingsViewModel()..changeLanguage(lang),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsViewModel settingProvider = Provider.of<SettingsViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsContent.routeName: (_) => NewsContent(),
      },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.lang),
    );
  }
}
