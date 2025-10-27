import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_user.dart';
import '../models/user_storage.dart';
import 'account_info_screen.dart';
import '../theme_provider.dart';
import 'login_screen.dart';

class TeenSettingsScreen extends StatefulWidget {
  final AppUser user;

  const TeenSettingsScreen({required this.user, Key? key}) : super(key: key);

  @override
  _TeenSettingsScreenState createState() => _TeenSettingsScreenState();
}

class _TeenSettingsScreenState extends State<TeenSettingsScreen> {
  bool _dailyReminders = true;
  bool _goalNotifications = true;

  final UserStorage _storage = UserStorage();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();

  void _changePassword() {
    if (_oldPasswordController.text != widget.user.password) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Old password is incorrect")),
      );
      return;
    }

    if (_newPasswordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password must be at least 6 characters")),
      );
      return;
    }

    setState(() {
      widget.user.password = _newPasswordController.text;
    });

    _storage.saveUser(widget.user);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Password updated successfully")),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Log Out"),
        content: const Text("Are you sure you want to log out? You can log back in anytime."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                    (route) => false,
              );
            },
            child: const Text("Log Out"),
          ),
        ],
      ),
    );
  }



  void _showTerms() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Terms & Conditions"),
        content: const SingleChildScrollView(
          child: Text("""
Welcome to YoungShoulders!

By using this app, you agree to:
• Provide accurate account information.
• Use the app responsibly and respectfully.
• Understand that this app is not a medical substitute.

Privacy Policy:
Your data remains secure. We do not share any personal details without consent.

Developer:
Harshita Pandey
Developed: September 2025
"""),
        ),
        actions: [
          TextButton(
            child: const Text("Close"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profile Section
          const Text(
            "Profile & Account",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              leading: const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(widget.user.fullName),
              subtitle: const Text("Teen User"),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AccountInfoScreen(user: widget.user),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Notification Preferences
          const Text(
            "Notification Preferences",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("Daily Wellness Reminders"),
            value: _dailyReminders,
            activeColor: Colors.deepPurple,
            onChanged: (val) => setState(() => _dailyReminders = val),
          ),
          SwitchListTile(
            title: const Text("Goal Tracking Notifications"),
            value: _goalNotifications,
            activeColor: Colors.deepPurple,
            onChanged: (val) => setState(() => _goalNotifications = val),
          ),
          const SizedBox(height: 24),

          // Theme Section
          const Text(
            "App Theme",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: themeProvider.isDarkMode,
            activeColor: Colors.deepPurple,
            onChanged: (val) => themeProvider.toggleTheme(val),
          ),
          const SizedBox(height: 24),

          // Change Password Section
          const Text(
            "Change Password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              iconColor: Colors.deepPurple,
              title: const Text("Update Password"),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    controller: _oldPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Old Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "New Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ElevatedButton(
                    onPressed: _changePassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text("Update Password", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Privacy & Security
          const Text(
            "Privacy & Security",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.info, color: Colors.deepPurple),
              title: const Text("Terms & Conditions"),
              onTap: _showTerms,
            ),
          ),
          const SizedBox(height: 24),

          // About & Support
          const Text(
            "About & Support",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.info_outline, color: Colors.deepPurple),
              title: const Text("App Version"),
              subtitle: const Text("v1.0.0"),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.contact_support, color: Colors.deepPurple),
              title: const Text("Contact Support"),
              subtitle: const Text("Need help? Reach out to us anytime."),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Contact support: 209-353-4524")),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Logout
          Center(
            child: ElevatedButton(
              onPressed: _logout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Developer Info
          const Center(
            child: Text(
              "Developed by Harshita Pandey\nSeptember 2025",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
