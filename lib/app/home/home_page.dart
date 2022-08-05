import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'addopinion/add_opinion_page_content.dart';
import 'myaccount/myaccount_page_content.dart';
import 'restaurants/restaurants_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Najlepsza pizza w mieście')),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return RestaurantPageContent();
        }
        if (currentIndex == 1) {
          return AddOpinionPageContent();
        }
        if (currentIndex == 2) {
          return MyAccountPageContent(email: widget.user.email);
        } else {
          return const Center(
            child: Text('Wystąpił błąd. Zresetuj aplikację'),
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.reviews), label: 'Recenzje'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Dodaj'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Moje konto')
        ],
      ),
    );
  }
}
