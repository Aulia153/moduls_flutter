import 'package:coba_flutter/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:coba_flutter/widgets/mood_card.dart';

class MoodEntryFormPage extends StatefulWidget{
  const MoodEntryFormPage({super.key});

  @override
  State<MoodEntryFormPage> createState() => _MoodEntryFormPageState();
}

class _MoodEntryFormPageState extends State<MoodEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _mood = "";
  String _feelings = "";
  int _moodIntensity = 0;

  final List <MoodCard> _moodList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Form Tambah Mood Kamu Hari Ini")),
      ),
          drawer: const LeftDrawer(),
          body: Form(
            key: _formKey,
            child: Padding(padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Mood",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _mood = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mood tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Perasaan",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _feelings = value;
                    });
                  },
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return "Perasaan tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Mood Intensity",
                    labelText: "Mood intensity",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _moodIntensity = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Mood intensity tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Mood intensity harus berupa angka!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: (){
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      _moodList.add(
                        MoodCard(mood: _mood,
                        description: "Intensitas: $_moodIntensity - $_feelings",
                        ),
                      );
                    });

                    showDialog(context: context, 
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Mood berhasil tersimpan"),
                        content: Text("Mood: $_mood\nPerasaan: $_feelings"),
                        actions: [
                          TextButton(child: const Text("OK"),
                          onPressed: () {
                            Navigator.pop(context);
                            _formKey.currentState!.reset();
                          },
                          ),
                        ],
                      );
                    },
                    );
                  }
                }, 
                child: const Text("Simpan"),
                ),
                const SizedBox(height: 16),
                Expanded(child: ListView(children: _moodList)),
              ],
            ),
            ),
            ),
          );
  }
}