import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_user.dart';

class UserStorage {
  // Save (register) a new user
  Future<void> saveUser(AppUser user) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> userList = prefs.getStringList('allUsers') ?? [];

    // Remove if email already exists (update)
    userList.removeWhere((u) {
      final existing = AppUser.fromJson(jsonDecode(u));
      return existing.email == user.email;
    });

    // Add or update user
    userList.add(jsonEncode(user.toJson()));
    await prefs.setStringList('allUsers', userList);

    // Set this user as currently logged in
    await prefs.setString('currentUserEmail', user.email);
  }

  // Get currently logged-in user
  Future<AppUser?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('currentUserEmail');
    if (email == null) return null;
    return await getUserByEmail(email);
  }

  // Get a user by email
  Future<AppUser?> getUserByEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final userList = prefs.getStringList('allUsers') ?? [];
    for (final userJson in userList) {
      final user = AppUser.fromJson(jsonDecode(userJson));
      if (user.email == email) return user;
    }
    return null;
  }

  // Get all users (optional for debug)
  Future<List<AppUser>> getAllUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final userList = prefs.getStringList('allUsers') ?? [];
    return userList.map((u) => AppUser.fromJson(jsonDecode(u))).toList();
  }

  // Log in (sets current user)
  Future<void> setCurrentUser(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentUserEmail', email);
  }

  // Log out (does not delete users)
  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentUserEmail');
  }

  // Delete a specific user (optional)
  Future<void> deleteUser(String email) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> userList = prefs.getStringList('allUsers') ?? [];
    userList.removeWhere((u) {
      final existing = AppUser.fromJson(jsonDecode(u));
      return existing.email == email;
    });
    await prefs.setStringList('allUsers', userList);
  }

  // JOURNAL DATA (if your app uses it)
  Future<void> saveJournalEntry(String entry, {required AppUser user}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'journalHistory_${user.email}';
    List<String> history = prefs.getStringList(key) ?? [];
    history.add(entry);
    await prefs.setStringList(key, history);
  }

  Future<List<String>> getJournalHistory({required AppUser user}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'journalHistory_${user.email}';
    return prefs.getStringList(key) ?? [];
  }
}
