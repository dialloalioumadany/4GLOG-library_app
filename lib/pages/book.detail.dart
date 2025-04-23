import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';

class BookDetail extends StatefulWidget {
  Book book;
  BookDetail({super.key, required this.book});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(widget.book.title),
        elevation: 10,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.book.imageUrl),
                    fit: BoxFit.contain
                  )
                ),
              ),
            ),
            Text(widget.book.title),
            SizedBox(
              height: 20,
            ),
            Text(widget.book.description),
          ],
        ),
      )
      );
  }
}
