class Session {
  int id = 0;
  String date = '';
  String description = '';
  int duration = 0;

  //unnamed constructor sets value
// this = fields with corresponding names sets with the values the constructore receives from caller
  Session(this.id, this.date, this.description, this.duration);
// constructor takes map creates a session
  Session.fromJson(Map<String, dynamic> sessionMap) {
    id = sessionMap['id'] ?? 0;
    date = sessionMap['date'] ?? '';
    description = sessionMap['description'] ?? '';
    duration = sessionMap['duration'] ?? 0;
  }

  //method returning map from session
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'duration': duration,
    };
  }
}
