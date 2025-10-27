import 'package:flutter/material.dart';
import 'career_counseling_screen.dart';
import 'peer_support_screen.dart';
import 'financial_literacy_screen.dart';
import 'time_management_screen.dart';
import 'cooking_nutrition_screen.dart';
import 'healthcare_screen.dart';
import 'academic_help_screen.dart';
import 'scholarships_screen.dart';
import 'counseling_screen.dart';

class ResourcesScreen extends StatelessWidget {
  ResourcesScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _resources = [
    {
      'title': "Counseling & Mental Health",
      'icon': Icons.psychology_alt_rounded,
      'color': Colors.purpleAccent,
      'widget': () => CounselingScreen()
    },
    {
      'title': "Peer Support Groups",
      'icon': Icons.people_alt_rounded,
      'color': Colors.blueAccent,
      'widget': () => PeerSupportScreen()
    },
    {
      'title': "Financial Literacy",
      'icon': Icons.attach_money_rounded,
      'color': Colors.greenAccent,
      'widget': () => FinancialLiteracyScreen()
    },
    {
      'title': "Time Management",
      'icon': Icons.access_time_filled_rounded,
      'color': Colors.orangeAccent,
      'widget': () => TimeManagementScreen()
    },
    {
      'title': "Cooking & Nutrition",
      'icon': Icons.restaurant_rounded,
      'color': Colors.redAccent,
      'widget': () => CookingNutritionScreen()
    },
    {
      'title': "Access to Healthcare",
      'icon': Icons.local_hospital_rounded,
      'color': Colors.tealAccent,
      'widget': () => HealthcareScreen()
    },
    {
      'title': "Tutoring & Academic Help",
      'icon': Icons.menu_book_rounded,
      'color': Colors.indigoAccent,
      'widget': () => AcademicHelpScreen()
    },
    {
      'title': "Career Counseling",
      'icon': Icons.work_rounded,
      'color': Colors.amberAccent,
      'widget': () => CareerCounselingScreen()
    },
    {
      'title': "Scholarships & Aid",
      'icon': Icons.school_rounded,
      'color': Colors.pinkAccent,
      'widget': () => ScholarshipsScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text(
          'Resources 💼',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Text
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
            child: Text(
              "Explore resources designed to help you thrive 💫",
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepPurple.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Resource Grid
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: _resources.map((resource) {
                return _buildResourceCard(context, resource);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(BuildContext context, Map<String, dynamic> resource) {
    final color = resource['color'] as Color;

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => resource['widget']()),
      ),
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.85),
              Colors.deepPurple.shade100.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(resource['icon'], size: 42, color: Colors.white),
              const SizedBox(height: 14),
              Text(
                resource['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
