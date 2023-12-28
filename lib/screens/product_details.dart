import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              BackButton(),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Category",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            "Lorem Ipsum",
                            textAlign: TextAlign.start,
                            style: titleStyle,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: RichText(
                            text: TextSpan(
                              text: '\$',
                              style: const TextStyle(
                                fontSize: 25,
                                color: Color.fromRGBO(33, 150, 253, 1),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "168.00",
                                  style: TextStyle(
                                    color: lightTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return FancyShimmerImage(
                      imageUrl: 'https://i.ibb.co/vwB46Yq/shoes.png',
                      width: double.infinity,
                      boxFit: BoxFit.fill,
                    );
                  },
                  autoplay: true,
                  itemCount: 3,
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.white,
                        activeColor: Colors.red,
                      )),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: titleStyle,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "Lorem Ipsum blaba",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
