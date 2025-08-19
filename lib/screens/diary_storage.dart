// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';
// import 'package:innerink_diary/modals/diaryentrymodal.dart';

// class DiaryStorage {
//   static const String key = "diary_entries";

//   static Future<List<DiaryEntry>> loadEntries() async {
//     final prefs = await SharedPreferences.getInstance();
//     final saved = prefs.getStringList(key);

//     if (saved == null) return [];

//     List<DiaryEntry> entries =
//         saved.map((e) => DiaryEntry.fromJson(json.decode(e))).toList();

//     entries.sort((a, b) => DateFormat("dd MMM yyyy")
//         .parse(b.date)
//         .compareTo(DateFormat("dd MMM yyyy").parse(a.date)));

//     return entries;
//   }

//   static Future<void> saveEntries(List<DiaryEntry> entries) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList(
//       key,
//       entries.map((e) => json.encode(e.toJson())).toList(),
//     );
//   }
// }
