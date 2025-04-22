import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final String title;
  final String newsImg;
  CarouselCard({super.key, required this.title, required this.newsImg});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              newsImg,
              fit: BoxFit.fitHeight,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54.withOpacity(0.2),
                    Colors.black87.withOpacity(0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                title.length > 50 ? "${title.substring(0, 50)}..." : title,
                style: const TextStyle(
                  fontFamily: "Titlin",
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
