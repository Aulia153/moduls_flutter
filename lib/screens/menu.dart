import 'package:coba_flutter/widgets/left_drawer.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage ({super.key});

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Home Page"),
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      drawer: const LeftDrawer(),
      body: const Center(
        child: Text("Selamat datang di Halaman Utama!"),
      ),
    );
  }
}