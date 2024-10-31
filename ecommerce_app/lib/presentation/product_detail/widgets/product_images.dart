import 'package:flutter/cupertino.dart';

class ProductImages extends StatelessWidget {
  ProductImages(this.images);

  List<String> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Image.network(
              images[index],
              fit: BoxFit.cover,
              width: 300,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 5,
            );
          },
          itemCount: images.length),
    );
  }
}
