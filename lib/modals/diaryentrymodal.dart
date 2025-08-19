class DiaryEntry {
  String title;
  String content;
  String mood;
  String date;

  DiaryEntry({
    required this.title,
    required this.content,
    required this.mood,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "mood": mood,
        "date": date,
      };

  factory DiaryEntry.fromJson(Map<String, dynamic> json) => DiaryEntry(
        title: json["title"],
        content: json["content"],
        mood: json["mood"],
        date: json["date"],
      );
}
