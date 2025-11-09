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
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Upcoming Tasks 🗓️",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.blueAccent,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue.shade300,
              Colors.blue.shade50,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Column(
            children: [
              // Motivation Banner
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.shade200,
                      Colors.blue.shade400,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Text(
                  "“Small steps today lead to big wins tomorrow.” 💪",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Add Task Field
              Container(
                margin: const EdgeInsets.only(bottom: 18),
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: taskController,
                        onSubmitted: (_) => addTask(),
                        decoration: InputDecoration(
                          hintText: "Add a new task...",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          border: InputBorder.none,
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: addTask,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.add_rounded,
                            color: Colors.white, size: 28),
                      ),
                    ),
                  ],
                ),
              ),

              // Tasks List
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: tasks.isEmpty
                      ? _buildEmptyState()
                      : ListView.builder(
                    itemCount: tasks.length,
                    padding: const EdgeInsets.only(top: 4),
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          gradient: LinearGradient(
                            colors: [
                              task["completed"]
                                  ? Colors.green.shade100
                                  : Colors.white,
                              Colors.white,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.07),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          leading: IconButton(
                            icon: Icon(
                              task["completed"]
                                  ? Icons.check_circle
                                  : Icons.circle_outlined,
                              color: task["completed"]
                                  ? Colors.green
                                  : Colors.blueAccent,
                              size: 26,
                            ),
                            onPressed: () =>
                                toggleTaskCompletion(index),
                          ),
                          title: Text(
                            task["title"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: task["completed"]
                                  ? Colors.grey
                                  : Colors.black87,
                              decoration: task["completed"]
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          subtitle: Text(
                            task["completed"]
                                ? "Nice job! Keep it going 🔥"
                                : "Stay focused—you got this 💫",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13.5,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline,
                                color: Colors.redAccent, size: 22),
                            onPressed: () => removeTask(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Footer Tip
              if (tasks.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 10),
                  child: Text(
                    "💡 Tip: Even small goals count — progress is power!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue.shade700,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                    ),
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
      key: const ValueKey("empty_state"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.self_improvement,
              size: 80, color: Colors.white70),
          const SizedBox(height: 18),
          const Text(
            "No tasks yet!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Start by writing one goal you want to achieve today ✨",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

