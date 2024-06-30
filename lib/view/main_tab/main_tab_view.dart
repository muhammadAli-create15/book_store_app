import 'package:bookstore/common/color_extension.dart';
import 'package:bookstore/view/cards/manage_cards.dart';
import 'package:bookstore/view/cart/cart.dart';
import 'package:bookstore/view/creditcard/credit_card.dart';
import 'package:bookstore/view/our_book/out_books_view.dart';
import 'package:bookstore/view/purchase/purchase.dart';
import 'package:bookstore/view/wishlist/wishlist.dart';
import 'package:flutter/material.dart';

import '../account/account_view.dart';
import '../home/home_view.dart';
import '../search/search_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  int selectMenu = 0;

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Add Credit Card", "icon": Icons.add},
    {"name": "Manage Cards", "icon": Icons.credit_card},
    {"name": "Purchase History", "icon": Icons.history},
    {"name": "Subscriptions", "icon": Icons.memory},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Our books", "icon": Icons.book},
    {"name": "Account", "icon": Icons.account_circle}
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller?.addListener(() {
      setState(() {
        selectMenu = controller!.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width *
            0.8, // Dynamic bottom-left border radius based on screen width.
        child: SingleChildScrollView(
            //Allows content to be scrollable vertically
            child: Container(
          decoration: BoxDecoration(
              //customize the appearance of a Container
              color: TColor.dColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(media
                        .width * //Adds a rounded border to only the bottom-left corner of the container.
                    0.8), //calculates the radius for the corner based on the width of the screen (media.width), multiplied by 0.8.
                // This makes the radius dynamically responsive to the screen size.
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10) //Adds a shadow effect to the container.
              ]),
          child: SingleChildScrollView(
            child: Column(
              //arrange the menu items and additional buttons vertically
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: menuArr.map((mObj) {
                      //Menu items mapped to the container widgets
                      var index = menuArr.indexOf(mObj);
                      return Container(
                        // margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: selectMenu ==
                                index //Variable tracking the currently selected menu item.
                            ? BoxDecoration(color: TColor.primary, boxShadow: [
                                BoxShadow(
                                    color: TColor.primary,
                                    blurRadius: 8,
                                    offset: const Offset(0, 2))
                              ])
                            : null,
                        child: GestureDetector(
                          //GestureDetector wraps each menu item to handle tap events
                          onTap: () {
                            if (index == 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeView()));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            } else if (index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CreditCard(
                                          title: 'Card Details')));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            } else if (index == 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManagaCardsScreen()));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            } else if (index == 3) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Purchases()));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            } else if (index == 4) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManagaCardsScreen()));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            } else if (index == 6) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OurBooksView()));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            } else if (index == 7) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AccountView()));
                              sideMenuScaffoldKey.currentState
                                  ?.closeEndDrawer();
                            }

                            //

                            setState(() {
                              selectMenu = index;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                mObj["name"].toString(),
                                style: TextStyle(
                                    color: selectMenu == index
                                        ? Colors.white
                                        : TColor.text,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Icon(
                                mObj["icon"] as IconData? ?? Icons.home,
                                color: selectMenu == index
                                    ? Colors.white
                                    : TColor.primary,
                                size: 25,
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList()),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: TColor.subTitle,
                            size: 25,
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terns",
                          style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy",
                          style: TextStyle(
                              color: TColor.subTitle,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
      body: TabBarView(controller: controller, children: const [
        HomeView(),
        SearchView(),
        Wishlist(),
        Cart(),
        // Container(),
        // Container(),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: TColor.primary,
        child: TabBar(
            controller: controller,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.menu),
                text: "Wishlist",
              ),
              Tab(
                icon: Icon(Icons.shopping_bag),
                text: "Cart",
              ),
            ]),
      ),
    );
  }
}
