import 'package:bookstore/view/home/home_view.dart';
import 'package:bookstore/view/wishlist/wishlist_full.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  List<Map<String, dynamic>> wishlistList = [];

  void addToWishlist(Map<String, dynamic> item) {
    setState(() {
      wishlistList.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isNotEmpty
        ? const Scaffold(body: WishlistFull())
        // WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: const Text('Wishlist'),
            ),
            body: WishlistFull(),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     // Navigator.push(context,
            //     //     MaterialPageRoute(builder: (context) => const HomeView()));
            //     // addToWishlist({
            //     //   "img": "assets/images/p2.jpg",
            //     //   "title": "New Book",
            //     //   "price": 25.0
            //     // });
            //   },
            //   child: const Icon(Icons.add),
            // ),
          );
  }
}
