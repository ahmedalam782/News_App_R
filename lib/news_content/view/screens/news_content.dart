import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app_route/Shared/Components/app_background_image.dart';
import 'package:news_app_route/news/data/models/article.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../../../Shared/Components/loading_indicator.dart';
import '../../../Shared/Themes/app_theme.dart';

class NewsContent extends StatelessWidget {
  static const String routeName = 'NewsContent';

  const NewsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Article article = ModalRoute.of(context)!.settings.arguments as Article;
    return AppBackgroundImage(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .02,
            ),
            child: BackButton(
              onPressed: () {
                return Navigator.of(context).pop();
              },
            ),
          ),
          toolbarHeight: screenHeight * .09,
          title: Text(article.title ?? ""),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * .025,
            vertical: MediaQuery.sizeOf(context).height * .03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ??
                      "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg",
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                  height: MediaQuery.sizeOf(context).height * .234,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Text(
                "${article.source?.name ?? ""} *",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 10,
                      color: AppTheme.gray,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Text(
                article.title ?? "",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: 14,
                      color: AppTheme.navy,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  timeago.format(article.publishedAt ?? fifteenAgo,
                      allowFromNow: true,
                      locale: AppLocalizations.of(context)!.locale),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 13,
                      ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: screenHeight * .03,
                    horizontal: screenWidth * .015,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * .024,
                    horizontal: screenWidth * .05,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: AppTheme.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            Text(
                              article.description ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                      fontSize: 16, color: AppTheme.navy),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (article.url == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppTheme.primary,
                                content: Text(
                                  "not have link to show details",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontSize: 16,
                                        color: AppTheme.white,
                                      ),
                                ),
                              ),
                            );
                          } else {
                            Uri uri = Uri.parse(article.url!);
                            if (await canLaunchUrl(
                              uri,
                            )) {
                              await launchUrl(uri);
                            }
                          }
                        },
                        child: Column(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * .06,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.viewFullArticle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontSize: 14,
                                      ),
                                ),
                              ),
                            ),
                            const Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Icon(
                                Icons.arrow_right,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
