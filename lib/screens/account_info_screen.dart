import 'package:flutter/material.dart';
import '../models/app_user.dart';

class AccountInfoScreen extends StatelessWidget {
  final AppUser user;

  const AccountInfoScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Information"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _buildInfoTile("First Name", user.firstName),
            _buildInfoTile("Last Name", user.lastName),
            _buildInfoTile("Email", user.email),
            if (user.phoneNumber != null && user.phoneNumber!.isNotEmpty)
              _buildInfoTile("Phone Number", user.phoneNumber!),
            if (user.birthDate != null)
              _buildInfoTile(
                "Birthdate",
                "${user.birthDate!.day}/${user.birthDate!.month}/${user.birthDate!.year}",
              ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Edit account info coming soon!")),
                );
              },
              icon: Icon(Icons.edit),
              label: Text("Edit Information"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                iconColor: Colors.white,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
