import 'package:flutter/material.dart';
import 'package:news_app_route/sources/view/widgets/tab_items.dart';

import '../../../news/view/widget/news_list.dart';
import '../../data/models/sources.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs({super.key, required this.sources, this.query});

  final List<Sources> sources;
  final String? query;
  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            onTap: (index) => setState(() {
              selectedIndex = index;
            }),
            tabs: widget.sources
                .map(
                  (source) => TabItems(
                    source: source.name ?? "",
                    isSelected: widget.sources.indexOf(source) == selectedIndex,
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
            child: NewsList(
          sourceId: widget.sources[selectedIndex].id ?? "",
              query: widget.query??"",
        ),),
      ],
    );
  }
}
