import 'package:flutter/material.dart';
import 'package:news_app/models/cat_model.dart';
import 'package:news_app/service/api_service.dart';
import 'package:news_app/widgets/appbar_text.dart';
import 'package:news_app/widgets/cat_card.dart';
import 'package:news_app/widgets/news_item.dart';

class MainScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String error = "";
  String catSearch = "general";

  Future<List<NewsTopic>> getNews(String cat) async {
    try {
      return await NewsTopic().fetchNews(cat, "us");
    } on Exception catch (err) {
      error = err.toString();
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBarText(text: "News", color: Colors.white),
            AppBarText(text: "Hub", color: Colors.orange),
          ],
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Category.categories.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () async {
                    setState(() {
                      catSearch = Category.categories[index].name!;
                    });
                    await getNews(catSearch);
                    setState(() {});
                  },
                  child: CatCard(
                    name: Category.categories[index].name,
                    imagePath: Category.categories[index].image!,
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: getNews(catSearch),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Text(error, style: TextStyle(color: Colors.white)),
                );
              } else if (snapshot.hasData) {
                return SliverList.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return NewsItem(
                      title: snapshot.data![index].newsTitle,
                      image: snapshot.data![index].newsImage,
                    );
                  },
                );
              } else {
                return SliverToBoxAdapter(child: CircularProgressIndicator());
              }
            },
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate([
          //     NewsItem(
          //       title: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: Platforms that do not support the flag character may show the letters  instead. If the code points are swapped, it inste",
          //       image: "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80",
          //     ),
          //     NewsItem(
          //       title: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: Platforms that do not support the flag character may show the letters  instead. If the code points are swapped, it inste",
          //       image: "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80",
          //     ),
          //     NewsItem(
          //       title: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: Platforms that do not support the flag character may show the letters  instead. If the code points are swapped, it inste",
          //       image: "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80",
          //     ),
          //     NewsItem(
          //       title: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: Platforms that do not support the flag character may show the letters  instead. If the code points are swapped, it inste",
          //       image: "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80",
          //     ),
          //     NewsItem(
          //       title: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: Platforms that do not support the flag character may show the letters  instead. If the code points are swapped, it inste",
          //       image: "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80",
          //     ),
          //     NewsItem(
          //       title: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: Platforms that do not support the flag character may show the letters  instead. If the code points are swapped, it inste",
          //       image: "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80",
          //     ),
          //     NewsItem(
          //       title: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: Platforms that do not support the flag character may show the letters  instead. If the code points are swapped, it inste",
          //       image: "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80",
          //     ),
          //     NewsItem(
          //       title: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: Platforms that do not support the flag character may show the letters  instead. If the code points are swapped, it inste",
          //       image: "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80",
          //     ),
          //     NewsItem(
          //       title: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units. For example, the Papua New Guinea flag character requires four code units to represent two code points, but should be treated like a single character: Platforms that do not support the flag character may show the letters  instead. If the code points are swapped, it inste",
          //       image: "https://img.magnific.com/free-vector/global-breaking-news-alert-graphic_1308-180362.jpg?semt=ais_hybrid&w=740&q=80",
          //     ),
          //   ]),
          // ),
        ],
      ),
    );
  }
}
