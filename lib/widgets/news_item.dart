import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  const new({super.key, required this.title, required this.image});
  final String? title;
  final String? image;

  static const String placeholderImage =
      "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80";

  @override
  Widget build(BuildContext context) {
    final imageUrl = (image == null || image!.isEmpty)
        ? placeholderImage
        : image!;
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) {
                return Image.network(placeholderImage);
              },
              imageUrl: imageUrl,
            ),
          ),
          Text(
            title ?? "No title",
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
