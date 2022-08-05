import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return Center(
            child: Text('Jeden'),
          );
        }
        if (currentIndex == 1) {
          return Center(
            child: Text('Dwa'),
          );
        } 
        if (currentIndex == 2) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Jesteś zalogowany jako ${widget.user.email}'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text('Wyloguj'))
              ],
            ),
          );
        }
        else {
          return Center(child: Text('Wystąpił błąd. Zresetuj aplikację'),)
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
