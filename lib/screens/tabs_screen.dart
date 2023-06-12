import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/screens/widgets/news_item.dart';
import 'package:news/screens/widgets/source_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../models/SourceResponse.dart';

class TabsScreen extends StatefulWidget {
  List<Sources> sources;

  TabsScreen(this.sources);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelPadding: const EdgeInsets.symmetric(horizontal: 4),
            indicatorColor: Colors.transparent,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            isScrollable: true,
            tabs: widget.sources.map((source) {
              return SourceItem(
                  source, widget.sources.indexOf(source) == selectedIndex);
            }).toList(),
          ),
        ),
        FutureBuilder<NewsResponse>(
          future:
              ApiManager.getNewsData(widget.sources[selectedIndex].id ?? ""),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: Center(
                      child:
                          CircularProgressIndicator(color: Color(0xFF39A552),),),);
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  const Text("SomeThing Went Wrong"),
                  TextButton(onPressed: () {}, child: const Text("Try Again")),
                ],
              );
            }

            if (snapshot.data?.status != "ok") {
              return Column(
                children: [
                  const Text("SomeThing Went Wrong"),
                  TextButton(onPressed: () {}, child: const Text("Try Again")),
                ],
              );
            }
            var newsData = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(newsData[index]);
                },
                itemCount: newsData.length,
              ),
            );
          },
        )
      ],
    );
  }
}
