import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var pizzaName = '';
  var rating = 3;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration:
                  const InputDecoration(hintText: 'Podaj nazwę restauracji'),
              onChanged: (newValue) {
                setState(() {
                  restaurantName = newValue;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Podaj nazwę pizzy'),
              onChanged: (newValue) {
                setState(() {
                  pizzaName = newValue;
                });
              },
            ),
            Slider(
              onChanged: (newValue) {
                setState(() {
                  rating = newValue.toInt();
                });
              },
              value: rating.toDouble(),
              min: 1.0,
              max: 6.0,
              divisions: 5,
              label: rating.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('restaurants').add({
                  'name': restaurantName,
                  'pizza': pizzaName,
                  'rating': rating,
                });
              },
              child: const Text('Dodaj'),
            ),
          ],
        ),
      ),
    );
  }
}
