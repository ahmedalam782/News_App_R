import 'package:flutter/material.dart';
import 'package:news_app_route/Shared/Themes/app_theme.dart';
import 'package:news_app_route/Ui/Widget/News%20Items/news_content.dart';
import 'package:provider/provider.dart';
import 'Shared/network/local/cache_helper.dart';
import 'Ui/Screens/home_screen.dart';
import 'Ui/Screens/splash_screen.dart';
import 'Ui/Widget/Settings/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('en',timeago.EnMessages()
  );
  timeago.setLocaleMessages('ar',timeago.ArMessages()
  );
  await CacheHelper.init();
  String lang = await CacheHelper.getData(key: 'isLanguage') ?? "en";
  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingProvider()..changeLanguage(lang),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);

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
