import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skimz/core/components/news_card.dart';
import 'package:skimz/core/constants/error_text.dart';
import 'package:skimz/features/bookmark/controller/bookmark_controller.dart';
import 'package:skimz/features/home_page/pages/news_detail_page.dart';

class BookmarkScreen extends ConsumerStatefulWidget {
  const BookmarkScreen({super.key});

  @override
  ConsumerState<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends ConsumerState<BookmarkScreen> {
  String formatPublishedDate(String isoDate) {
    final dateTime = DateTime.parse(isoDate).toLocal();
    final formatter = DateFormat('d MMMM, y');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final bookmarks = ref.watch(bookmarkControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Bookmark",
          style: const TextStyle(
            fontFamily: "Erode",
            fontWeight: FontWeight.w500,
            decorationColor: Colors.black,
            decoration: TextDecoration.underline,
            fontSize: 35,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                child: Text(
                  "Your Bookmarks",
                  style: TextStyle(
                    fontSize: 70,
                    fontFamily: "Erode",
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    color: Colors.white,
                  ),
                ),
              ),
              if (bookmarks.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    "No bookmarks yet!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              else
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bookmarks.length,
                  itemBuilder: (context, index) {
                    final news = bookmarks[index];

                    return Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailPage(news.newsUrl),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(7),
                            child: NewsCard(
                              title: news.newsHead,
                              description: news.newsDes,
                              imageUrl: news.newsImg,
                              author: news.newsAuthor,
                              publishedAt: formatPublishedDate(news.newsPublishedAt),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: IconButton(
                                icon: Icon(
                                  Icons.bookmark,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onPressed: () {
                                  ref.read(bookmarkControllerProvider.notifier).toggleBookmark(news);
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
