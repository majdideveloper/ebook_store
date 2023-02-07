import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listImages = [
      'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      'https://images.unsplash.com/photo-1495446815901-a7297e633e8d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    ];
    return CarouselSlider.builder(
      itemCount: listImages.length,
      options: CarouselOptions(
        viewportFraction: 1,
        height: 300,
        autoPlay: true,
        aspectRatio: 1,
        enlargeCenterPage: false,
      ),
      itemBuilder: (context, index, realIdx) {
        return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              listImages[index],
              fit: BoxFit.cover,
            ));
      },
    );
  }
}
