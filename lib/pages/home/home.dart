import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';
import 'package:library_app/pages/home/widgets/book.widget.dart';
import 'package:library_app/pages/auth/login_page.dart';
import 'package:library_app/utils/shared_preference_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data = [
    Book(
      "assets/images/image1.png",
      "Livre1",
      "Ceci est la description du livre 1",
    ),
    Book(
      "assets/images/image2.png",
      "Livre2",
      "Ceci est la description du livre 2",
    ),
    Book(
      "assets/images/image3.png",
      "Livre3",
      "Ceci est la description du livre 3",
    ),
    Book(
      "assets/images/image4.png",
      "Livre4",
      "Ceci est la description du livre 4",
    ),
    Book(
      "assets/images/image5.png",
      "Livre5",
      "Ceci est la description du livre 5",
    ),
  ];

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    var isConnected = await SharedPreferenceService.getValue("isConnected");
    print("isConnected = ${isConnected}");
    if ("CONNECTER" != isConnected) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Librairie", style: TextStyle(color: Colors.white)),
        elevation: 10,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: _logout,
            tooltip: 'Déconnexion',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return BookWidget(livre: data[index]);
        },
      ),
    );
  }
}
