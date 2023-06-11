import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(8),
      elevation: 0,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl: article.urlToImage??"",height: 160,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: Color(0xFF39A552),)),
                errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red,),
              )

            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              article.title ?? "",
              style: const TextStyle(color: Color(0xFF42505C), fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              article.description ?? '',
              style: const TextStyle(color: Colors.black45, fontSize: 13),
            ),
            Text(
              article.author ?? '',
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
            Text(
              article.publishedAt?.substring(0, 10) ?? '',
              style: const TextStyle(fontSize: 13, color: Colors.black),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
