import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/screens/category_screen.dart';
import 'package:store_api_flutter_course/screens/feeds_screen.dart';
import 'package:store_api_flutter_course/screens/users_screen.dart';
import 'package:store_api_flutter_course/widgets/appbar_icons.dart';
import 'package:store_api_flutter_course/widgets/feeds_widget.dart';
import 'package:store_api_flutter_course/widgets/sale_widget.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 4,
          title: const Text('Home'),
          leading: AppBarIcon(
            function: () {
              Navigator.push(
                context,
                PageTransition(
                    child: const CategoriesScreen(),
                    type: PageTransitionType.fade),
              );
            },
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcon(
                function: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: const UsersScreen(),
                        type: PageTransitionType.fade),
                  );
                },
                icon: IconlyBold.user3),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 18),
              TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Theme.of(context).cardColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  suffixIcon: Icon(
                    IconlyLight.search,
                    color: lightIconsColor,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const SaleWidget();
                          },
                          pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Text(
                              "Latest Products",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            AppBarIcon(
                                function: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const FeedsScreen(),
                                        type: PageTransitionType.fade),
                                  );
                                },
                                icon: IconlyBold.arrowRight2),
                          ],
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 0.0,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (ctx, index) {
                          return const FeedsWidget();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
