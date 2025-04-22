import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skimz/core/components/news_card.dart';
import 'package:skimz/core/constants/error_text.dart';
import 'package:skimz/features/bookmark/controller/bookmark_controller.dart';
import 'package:skimz/features/home_page/controller/news_controller.dart';
import 'package:skimz/features/home_page/pages/news_detail_page.dart';

class LatestNewsWidget extends ConsumerStatefulWidget {
  const LatestNewsWidget({super.key});

  @override
  ConsumerState<LatestNewsWidget> createState() => _LatestNewsWidgetState();
}

class _LatestNewsWidgetState extends ConsumerState<LatestNewsWidget> {
  String formatPublishedDate(String isoDate) {
    final dateTime = DateTime.parse(isoDate).toLocal();
    final formatter = DateFormat('d MMMM, y');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkList = ref.watch(bookmarkControllerProvider);
    final newsList = ref.watch(newsProvider);
    return newsList.when(
      data: (modelList) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: modelList.length,
          itemBuilder: (context, index) {
            final newsItem = modelList[index];
            
            final isBookmarked = bookmarkList.any(
                            (item) => item.newsUrl == newsItem.newsUrl,
                          );

            return Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(newsItem.newsUrl),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(7),
                    child: NewsCard(
                      title: newsItem.newsHead,
                      description: newsItem.newsDes,
                      imageUrl: newsItem.newsImg,
                      author: newsItem.newsAuthor,
                      publishedAt: formatPublishedDate(
                        newsItem.newsPublishedAt,
                      ),
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
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        onPressed:
                            () => ref
                                .read(bookmarkControllerProvider.notifier)
                                .toggleBookmark(newsItem),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      error: (error, stackTrace) {
        return ErrorText(error: error.toString());
      },
      loading: () {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 450,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
