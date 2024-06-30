import 'package:flutter/material.dart';

class WishlistFull extends StatefulWidget {
  const WishlistFull({Key? key}) : super(key: key);

  @override
  State<WishlistFull> createState() => _WishlistState();
}

class _WishlistState extends State<WishlistFull> {
  List<Map<String, dynamic>> wishlistArr = [
    {
      "img": "assets/images/p2.jpg",
      "title": "Wishlist Book 1",
      "price": 30.0,
      "isFavorite": false
    },
    {
      "img": "assets/images/7.jpg",
      "title": "World of war",
      "price": 15.0,
      "isFavorite": false
    },
    {
      "img": "assets/images/12.jpg",
      "title": "The fatal tree",
      "price": 15.0,
      "isFavorite": false
    },
    {
      "img": "assets/images/11.jpg",
      "title": "Day four",
      "price": 45.0,
      "isFavorite": false
    },
    {
      "img": "assets/images/10.jpg",
      "title": "The door to door",
      "price": 40.0,
      "isFavorite": false
    },
    {
      "img": "assets/images/5.jpg",
      "title": "Tattle tale",
      "price": 30.0,
      "isFavorite": false
    },
    {
      "img": "assets/images/4.jpg",
      "title": "In a land of papers",
      "price": 25.0,
      "isFavorite": false
    },
    {
      "img": "assets/images/3.jpg",
      "title": "The travellers",
      "price": 30.0,
      "isFavorite": false
    },
    {
      "img": "assets/images/2.jpg",
      "title": "Fatherhood",
      "price": 20.0,
      "isFavorite": false
    },
    {
      "img": "assets/images/6.jpg",
      "title": "The zoo",
      "price": 35.0,
      "isFavorite": false
    },
    // Add more items here...
  ];

  void removeItem(int index) {
    setState(() {
      wishlistArr.removeAt(index);
    });
  }

  void toggleFavorite(int index) {
    setState(() {
      wishlistArr[index]['isFavorite'] = !wishlistArr[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wishlistArr.length,
      itemBuilder: (context, index) {
        var item = wishlistArr[index];
        return SingleChildScrollView(
            child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(right: 30.0, bottom: 10.0),
              child: Material(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(5.0),
                elevation: 3.0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: <Widget>[
                        Image.asset(item['img'], height: 80.0),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(item['title'],
                                  style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20.0),
                              Text('\$${item['price']}',
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                icon: Icon(
                                  item['isFavorite']
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: item['isFavorite']
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () => toggleFavorite(index),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 15,
              child: Container(
                height: 30.0,
                width: 30.0,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  padding: const EdgeInsets.all(0.0),
                  color: Colors.pink,
                  child: const Icon(Icons.clear),
                  onPressed: () => removeItem(index),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
