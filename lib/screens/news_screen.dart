import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/provider/provider.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

import '../models/SourceResponse.dart';
import '../shared/network/remote/api_manager.dart';

class NewsScreen extends StatelessWidget {
  CategoryModel categoryModel;

  NewsScreen(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(category:categoryModel.id,languageCode: provider.languageCode),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFF39A552),
            ),
          );
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
        var sources = snapshot.data?.sources ?? [];
        return TabsScreen(sources);
      },
    );
  }
}
