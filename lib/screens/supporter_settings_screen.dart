import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SupporterSettingsScreen extends StatefulWidget {
  const SupporterSettingsScreen({Key? key}) : super(key: key);

  @override
  _SupporterSettingsScreenState createState() => _SupporterSettingsScreenState();
}

class _SupporterSettingsScreenState extends State<SupporterSettingsScreen> {
  bool resourceUpdates = true;
  bool aiAnalysisUpdates = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.deepPurple,
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
            child: ListTile(
              leading: const CircleAvatar(
                radius: 24,
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: const Text("Supporter Name"),
              subtitle: const Text("Supporter since Oct 2025"),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // TODO: Implement edit profile
                },
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Notifications Section
          const Text(
            "Notification Preferences",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("New Resource Updates"),
            value: resourceUpdates,
            activeColor: Colors.deepPurple,
            onChanged: (val) {
              setState(() => resourceUpdates = val);
            },
          ),
          SwitchListTile(
            title: const Text("AI Analysis Updates"),
            value: aiAnalysisUpdates,
            activeColor: Colors.deepPurple,
            onChanged: (val) {
              setState(() => aiAnalysisUpdates = val);
            },
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

          // Privacy & Security
          const Text(
            "Privacy & Security",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.lock, color: Colors.deepPurple),
              title: const Text("Manage Data Permissions"),
              onTap: () {
                // TODO: Implement permission management
              },
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text("Delete Account", style: TextStyle(color: Colors.red)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Delete Account?"),
                    content: const Text("This action cannot be undone."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // TODO: Implement delete logic
                        },
                        child: const Text("Delete", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // About / Support
          const Text(
            "About & Support",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: Icon(Icons.info, color: Colors.deepPurple),
              title: Text("App Version"),
              subtitle: Text("v1.1.0"), // ← your current app version
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.contact_support, color: Colors.deepPurple),
              title: const Text("Contact Us"),
              onTap: () {
                // TODO: Open mock contact form
              },
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.description, color: Colors.deepPurple),
              title: const Text("Terms of Use & Privacy Policy"),
              onTap: () {
                // TODO: Show terms/privacy info
              },
            ),
          ),
          const SizedBox(height: 24),

          // Log Out
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('currentUserEmail');

                if (context.mounted) {
                  Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
