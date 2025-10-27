import 'package:flutter/material.dart';
import '../models/app_user.dart';

class UpcomingTasksScreen extends StatefulWidget {
  final AppUser user;
  const UpcomingTasksScreen({Key? key, required this.user}) : super(key: key);
  @override
  _UpcomingTasksScreenState createState() => _UpcomingTasksScreenState();
}

class _UpcomingTasksScreenState extends State<UpcomingTasksScreen> {
  final List<Map<String, dynamic>> tasks = [];
  final TextEditingController taskController = TextEditingController();

  void addTask() {
    if (taskController.text.trim().isNotEmpty) {
      setState(() {
        tasks.add({
          "title": taskController.text.trim(),
          "completed": false,
        });
        taskController.clear();
      });
    }
  }

  void toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]["completed"] = !tasks[index]["completed"];
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      Colors.deepPurple.shade400,
      Colors.deepPurple.shade100,
    ];

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text(
          "Upcoming Tasks 🗓️",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Motivational Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple.shade300,
                      Colors.deepPurple.shade100
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Text(
                  "“Small steps today lead to big wins tomorrow.” 💪",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Add Task Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        decoration: InputDecoration(
                          hintText: "Add a new task...",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => addTask(),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_rounded,
                          color: Colors.deepPurple, size: 30),
                      onPressed: addTask,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Task List
              Expanded(
                child: tasks.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.08),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: IconButton(
                          icon: Icon(
                            task["completed"]
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: task["completed"]
                                ? Colors.green
                                : Colors.deepPurple,
                          ),
                          onPressed: () => toggleTaskCompletion(index),
                        ),
                        title: Text(
                          task["title"],
                          style: TextStyle(
                            decoration: task["completed"]
                                ? TextDecoration.lineThrough
                                : null,
                            color: task["completed"]
                                ? Colors.grey
                                : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          task["completed"]
                              ? "Nice job! Keep the momentum going 🔥"
                              : "You got this — stay focused 💫",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.redAccent),
                          onPressed: () => removeTask(index),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Encouragement Footer
              if (tasks.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "💡 Tip: Write even small goals — completing them feels great!",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepPurple.shade700,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.self_improvement,
              size: 80, color: Colors.white70),
          const SizedBox(height: 20),
          const Text(
            "No tasks yet!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Start by writing one thing you want to get done today ✨",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
