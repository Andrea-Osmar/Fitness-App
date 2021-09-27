import 'package:shared_preferences/shared_preferences.dart';
import 'session.dart';
import 'dart:convert';

//serve as an interface between code and shared preferences
class SPHelper {
  static late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

// method to write new session to shared preferences - async
  Future writeSessions(Session session) async {
    prefs.setString(session.id.toString(), json.encode(session.toJson()));
  }

  // method to retrieve old sessions
  List<Session> getSessions() {
    List<Session> sessions = []; //ordered list
    Set<String> keys = prefs.getKeys(); // unordered list
    keys.forEach((String key) {
      if (key != 'counter') {
        Session session =
            Session.fromJson(json.decode(prefs.getString(key) ?? ''));
        sessions.add(session);
      }
    });
    return sessions;
  }

  Future setCounter() async {
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    await prefs.setInt('counter', counter);
  }

  int getCounter() {
    return prefs.getInt('counter') ?? 0;
  }

  Future deleteSession(int id) async {
    prefs.remove(id.toString());
  }
}
