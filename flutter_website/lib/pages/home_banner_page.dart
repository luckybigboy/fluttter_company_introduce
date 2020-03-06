import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeBannerPage extends StatelessWidget {
  List<String> banners = <String>[
    "assets/images/banners/1.webp",
    "assets/images/banners/2.webp",
    "assets/images/banners/3.png",
    "assets/images/banners/4.webp"
  ];
  @override
  Widget build(BuildContext context) {
    // 宽高按比例计算
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;
    return Container(
      width: width,
      height: height,
      child: Swiper(
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Image.asset(
                banners[index],
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            );
          },
          itemCount: banners.length,
          autoplay: true,
          scrollDirection: Axis.horizontal),
    );
  }
}
