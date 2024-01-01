import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          color: Colors.red,
          IconlyBold.danger,
          size: 28,
        ),
        imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
        boxFit: BoxFit.fill,
      ),
      title: const Text('UserName'),
      subtitle: const Text('Email@email.com'),
      trailing: Text(
        'User Role ',
        style: TextStyle(color: lightIconsColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
