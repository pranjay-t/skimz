import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skimz/core/constants/error_text.dart';
import 'package:skimz/core/components/carousel_card.dart';
import 'package:skimz/features/home_page/controller/news_controller.dart';
import 'package:skimz/features/home_page/pages/news_detail_page.dart';

class CarouselNewsWidget extends ConsumerStatefulWidget {
  const CarouselNewsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CarouselNewsWidgetState();
}

class _CarouselNewsWidgetState extends ConsumerState<CarouselNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return ref
        .watch(carouselNewsProvider)
        .when(
          data: (modelListCarousal) {
            return CarouselSlider(
              options: CarouselOptions(
                height: 220,
                autoPlay: true,
                enlargeCenterPage: true,
                animateToClosest: true,
              ),
              items:
                  modelListCarousal.map((instance) {
                    return Builder(
                      builder: (BuildContext context) {
                        try {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          NewsDetailPage(instance.newsUrl),
                                ),
                              );
                            },
                            child: CarouselCard(
                              title: instance.newsHead,
                              newsImg: instance.newsImg,
                            ),
                          );
                        } catch (e) {
                          return Container();
                        }
                      },
                    );
                  }).toList(),
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
