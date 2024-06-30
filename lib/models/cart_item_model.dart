//This defines the data model of a cart item in the bookstore application,includes various properties defining a cart item
import 'package:flutter/material.dart';

class Books {
  late final String name;
  late final String author;
  late final String image;
  late final String startDate;
  late final String endDate;
  late final String location;
  late final double price;
  late int quantity;

  Books({
    required this.name,
    required this.author,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.price,
    required this.quantity,
  });
}
