import 'package:bookstore/common_widget/round_button.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map<String, dynamic>> cartArr = [
    {
      "img": "assets/images/2.jpg",
      "title": "Fatherhood",
      "price": 20.0,
      "quantity": 1
    },
    {
      "img": "assets/images/3.jpg",
      "title": "The travellers",
      "price": 30.0,
      "quantity": 1
    },
    {
      "img": "assets/images/4.jpg",
      "title": "In a land of papers",
      "price": 25.0,
      "quantity": 1
    },
    {
      "img": "assets/images/5.jpg",
      "title": "Tattle tale",
      "price": 30.0,
      "quantity": 1
    },
    {
      "img": "assets/images/6.jpg",
      "title": "The zoo",
      "price": 35.0,
      "quantity": 1
    },
    {
      "img": "assets/images/10.jpg",
      "title": "The door to door",
      "price": 40.0,
      "quantity": 1
    },
    {
      "img": "assets/images/11.jpg",
      "title": "Day four",
      "price": 45.0,
      "quantity": 1
    },
    {
      "img": "assets/images/12.jpg",
      "title": "The fatal tree",
      "price": 15.0,
      "quantity": 1
    },
    {
      "img": "assets/images/7.jpg",
      "title": "World of war",
      "price": 15.0,
      "quantity": 1
    }
  ];

  double get totalPrice {
    return cartArr.fold(
        0, (sum, item) => sum + item['price'] * item['quantity']);
  }

  void removeItem(int index) {
    setState(() {
      cartArr.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'My cart list of books',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.black26,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: cartArr.length,
              itemBuilder: (BuildContext context, int index) {
                var item = cartArr[index];
                return Container(
                  height: 140,
                  child: Row(
                    children: [
                      Image.asset(item['img'], width: 100, height: 100),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(item['title'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('\$${item['price']}',
                              style: TextStyle(fontSize: 16)),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (item['quantity'] > 1) {
                                    setState(() {
                                      item['quantity'] -= 1;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${item['quantity']}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    item['quantity'] += 1;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.black26,
                height: 2.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Total: \$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                RoundButton(title: 'Make Payments', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//itemBuilder:A function that takes the context and the index of the item and returns a widget to display for that item. Here, it's a simple ListTile with a text label.
//separatorBuilder: A function that takes the context and the index and returns a widget to display between each item. Here, it's a simple Divider.
