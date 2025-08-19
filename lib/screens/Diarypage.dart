import 'package:flutter/material.dart';
import 'package:innerink_diary/modals/diaryentrymodal.dart';
import 'package:intl/intl.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String mood = "😊";
  String currentDate = DateFormat("dd MMM yyyy").format(DateTime.now());

  void _pickMood() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Mood"),
        content: Wrap(
          spacing: 10,
          children: ["😊", "😢", "😍", "😡", "😎", "🥳"].map((emoji) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  mood = emoji;
                });
                Navigator.pop(context);
              },
              child: Text(emoji, style: const TextStyle(fontSize: 28)),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _saveDiary() {
    if (_titleController.text.isEmpty && _contentController.text.isEmpty) return;

    final newEntry = DiaryEntry(
      title: _titleController.text,
      content: _contentController.text,
      mood: mood,
      date: currentDate,
    );
    Navigator.pop(context, newEntry); // return entry to home screen
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A0572), Color(0xFF120078)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(color: Colors.white),
                  ElevatedButton(
                    onPressed: _saveDiary,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05, vertical: 10),
                    ),
                    child: const Text("Save", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Date + Mood
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(currentDate,
                      style: const TextStyle(color: Colors.white, fontSize: 14)),
                  GestureDetector(
                    onTap: _pickMood,
                    child: Text("Mood: $mood",
                        style: const TextStyle(color: Colors.white, fontSize: 16)),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Title
              TextField(
                controller: _titleController,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.white54, fontSize: 22),
                  border: InputBorder.none,
                ),
              ),

              // Content
              Expanded(
                child: TextField(
                  controller: _contentController,
                  maxLines: null,
                  expands: true,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: const InputDecoration(
                    hintText: "dear diary ,",
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
