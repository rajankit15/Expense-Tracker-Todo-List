import 'package:expence_tracker/Screens/charts.dart';
import 'package:expence_tracker/Screens/explore.dart';
import 'package:expence_tracker/Screens/home.dart';
import 'package:flutter/material.dart';

var category_name = [
  'Shopping',
  'Food',
  'Travel',
  'Movie',
  'Health',
  'Education',
  'Subscription',
  'Other'
];

var category_icon = [
  Icons.shopping_cart,
  Icons.fastfood,
  Icons.train,
  Icons.movie,
  Icons.local_hospital,
  Icons.book,
  Icons.subscriptions,
  Icons.category
];

var navBarItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  const BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: "Stats"),
  const BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
];

var navBody = [
  const HomePage(),
  const ChartsScreen(),
  const ExploreScreen(),
];


