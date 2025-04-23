import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';
import 'package:library_app/pages/book.detail.dart';

class BookWidget extends StatelessWidget {
  Book livre;

  BookWidget({super.key, required this.livre});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Livre ${livre.title}");
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => BookDetail(book: livre,)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black)),
          ),
          child: ListTile(
            leading: Image.asset(livre.imageUrl),
            title: Text(
              livre.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(livre.description),
          ),
        ),
      ),
    );
  }
}
