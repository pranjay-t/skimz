import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skimz/core/widgets/carousel_news_widget.dart';
import 'package:skimz/core/widgets/latest_news_widget.dart';
import 'package:skimz/features/bookmark/pages/bookmark_screen.dart';
import 'package:skimz/features/home_page/pages/category.dart';
import 'package:skimz/models/news_query_model.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  TextEditingController searchController = TextEditingController();
  List<String> navBarItem = ["India", "Finance", "Anime", "World", "Sports"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Skimz",
          style: TextStyle(
            fontFamily: "Erode",
            fontWeight: FontWeight.w500,
            decorationColor: Colors.black,
            decoration: TextDecoration.underline,
            fontSize: 60,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>BookmarkScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) {
                          if ((searchController.text).replaceAll(" ", "") ==
                              "") {
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Category(query1: value),
                              ),
                            );
                          }
                        },
                        controller: searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "What are you looking for?",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if ((searchController.text).replaceAll(" ", "") == "") {
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      Category(query1: searchController.text),
                            ),
                          );
                        }
                      },
                      child: const Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: navBarItem.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    Category(query1: navBarItem[index]),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 38),
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: colorsItems[index],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Text(
                              navBarItem[index],
                              style: const TextStyle(
                                fontSize: 40,
                                fontFamily: "Erode",
                                fontWeight: FontWeight.w500,
                                decorationColor: Colors.white,
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 17),
              Container(child: CarouselNewsWidget()),
              const SizedBox(height: 10),
              Column(
                children: [
                  Container(
                    child: const Text(
                      "LATEST NEWS",
                      style: TextStyle(
                        fontSize: 70,
                        fontFamily: "Erode",
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  LatestNewsWidget(),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Category(query1: "Latest News"),
                      ),
                    );
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey),
                  ),
                  child: const Text(
                    "Show More",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List colorsItems = [
    Colors.deepOrangeAccent,
    Colors.blueAccent,
    Colors.green,
    Colors.purpleAccent,
    Colors.amber,
    Colors.redAccent,
  ];
}
