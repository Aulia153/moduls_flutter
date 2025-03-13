import 'package:flutter/material.dart';
import 'package:coba_flutter/screens/menu.dart'; //Impor halaman myhomepage
import 'package:coba_flutter/screens/moodentry_form.dart'; //Impor halaman moodentryformpage

class LeftDrawer extends StatelessWidget{
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader( 
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
          ),
          child: const Column(
            children: [
              Text(
                'Mental Health Tracker',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Ayo jaga kesehatan mentalmu setiap hari disini!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Halaman Utama"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Tambah Mood"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MoodEntryFormPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              //Logout Logika disini
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}