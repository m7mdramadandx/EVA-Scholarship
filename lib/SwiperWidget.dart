import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatelessWidget {
  SwiperWidget(this.imgUrls);

  final List<String> imgUrls;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: Colors.white,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                imgUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        autoplay: true,
        itemCount: imgUrls.length,
        loop: true,
        viewportFraction: 0.75,
        scale: 0.8,

        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}
