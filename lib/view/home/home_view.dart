import 'package:bookstore/common/color_extension.dart';
import 'package:bookstore/common_widget/best_seller_cell.dart';
import 'package:bookstore/common_widget/genres_cell.dart';
import 'package:bookstore/common_widget/recently_cell.dart';
import 'package:bookstore/common_widget/round_button.dart';
import 'package:bookstore/common_widget/round_textfield.dart';
import 'package:bookstore/common_widget/top_picks_cell.dart';
import 'package:bookstore/view/book_reading/book_reading_view.dart';
import 'package:carousel_slider/carousel_slider.dart'; //supports infinite scroll and custom child widget
import 'package:flutter/material.dart';

import '../login/sign_up_view.dart';
import '../main_tab/main_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  List topPicksArr = [
    {
      "name": "The Dissapearance of Emila Zola",
      "author": "Michael Rosen",
      "img": "assets/images/1.jpg"
    },
    {
      "name": "Fatherhood",
      "author": "Marcus Berkmann",
      "img": "assets/images/2.jpg"
    },
    {
      "name": "The Time Travellers Handbook",
      "author": "Stride Lottie",
      "img": "assets/images/3.jpg"
    }
  ];

  List bestArr = [
    {
      "name": "Fatherhood",
      "author": "by Christopher Wilson",
      "img": "assets/images/4.jpg",
      "rating": 5.0
    },
    {
      "name": "In A Land Of Paper Gods",
      "author": "by Rebecca Mackenzie",
      "img": "assets/images/5.jpg",
      "rating": 4.0
    },
    {
      "name": "Tattletale",
      "author": "by Sarah J. Noughton",
      "img": "assets/images/6.jpg",
      "rating": 3.0
    }
  ];

  List genresArr = [
    {
      "name": "Graphic Novels",
      "img": "assets/images/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/g1.png",
    }
  ];

  List recentArr = [
    {
      "name": "The Fatal Tree",
      "author": "by Jake Arnott",
      "img": "assets/images/10.jpg"
    },
    {
      "name": "Day Four",
      "author": "by LOTZ, SARAH",
      "img": "assets/images/11.jpg"
    },
    {
      "name": "Door to Door",
      "author": "by Edward Humes",
      "img": "assets/images/12.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              //This allows us to overlap multiple widgets,allows us to create complex layouts in flutter
              alignment: Alignment.topCenter,
              children: [
                Align(
                  //Align sizes itself based on its' child's size and positions the child according to its alignment value
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, media.width * 0.8),
                    child: Container(
                      width: media.width,
                      height: media.width,
                      decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius:
                              BorderRadius.circular(media.width * 0.5)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const Row(children: [
                        Text(
                          "Our Top Picks",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(
                            onPressed: () {
                              sideMenuScaffoldKey.currentState?.openEndDrawer();
                            },
                            icon: const Icon(Icons.menu))
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPicksArr.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          var iObj = topPicksArr[itemIndex] as Map? ?? {};
                          return TopPicksCell(
                            iObj: iObj,
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Bestsellers",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.9,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: bestArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = bestArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookReadingView(
                                              bObj: bObj,
                                            )));
                              },
                              child: BestSellerCell(
                                bObj: bObj,
                              ),
                            );
                          })),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Genres",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.6,
                      child: ListView.builder(
                          // This creates a ListView using the builder constructor, which is efficient for long lists as it only builds the visible items.
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: genresArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = genresArr[index] as Map? ?? {};
                            return GenresCell(
                              bObj: bObj,
                              bgcolor: index % 2 == 0
                                  ? TColor.color1
                                  : TColor.color2,
                            );
                          })),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Recently Viewed",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: media.width * 0.7,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: recentArr.length,
                          itemBuilder: ((context, index) {
                            var bObj = recentArr[index] as Map? ?? {};

                            return RecentlyCell(
                              iObj: bObj,
                            );
                          })),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        Text(
                          "Monthly Newsletter",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                    ),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                          color: TColor.textbox.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion.",
                              style: TextStyle(
                                color: TColor.subTitle,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            RoundTextField(
                              controller: txtName,
                              hintText: "Name",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            RoundTextField(
                              controller: txtEmail,
                              hintText: "Email Address",
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MiniRoundButton(
                                  title: "Sign Up",
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpView()));
                                  },
                                )
                              ],
                            )
                          ]),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
