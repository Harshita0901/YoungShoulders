import 'package:flutter/material.dart';

class SupporterDisorderLibraryScreen extends StatelessWidget {
  const SupporterDisorderLibraryScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> disorders = const [
    {
      "name": "Depression",
      "icon": Icons.sentiment_dissatisfied,
      "symptoms":
      "People with depression often experience ongoing sadness, emptiness, or hopelessness that lasts for weeks or months. They may lose interest in hobbies, withdraw from friends, struggle with sleep or appetite changes, and feel tired or worthless. Difficulty concentrating and recurring thoughts of self-harm may also occur.",
      "howToHelp":
      "Let them know you care without judgment. Encourage them to seek therapy or medical help, and offer to help with simple daily tasks when energy is low. Listen actively and validate their emotions rather than trying to fix them. Help create small goals and celebrate progress to build confidence.",
      "whatNotToDo":
      "Avoid telling them to 'cheer up' or 'think positive.' Never minimize their feelings, compare them to others, or pressure them into activities they're not ready for. Don’t give unsolicited advice or take their withdrawal personally—it’s often part of the illness, not rejection."
    },
    {
      "name": "Anxiety",
      "icon": Icons.sentiment_neutral,
      "symptoms":
      "Anxiety can feel like uncontrollable worry, restlessness, and tension even without an obvious cause. Physical symptoms include rapid heartbeat, sweating, trembling, or feeling lightheaded. People may overthink situations or avoid things that make them anxious, fearing embarrassment or failure.",
      "howToHelp":
      "Offer calm reassurance and listen without interrupting. Help them slow their breathing, ground themselves, or practice relaxation techniques. Encourage therapy and remind them that anxiety is manageable with support. Be patient when they need extra time to calm down or adjust plans.",
      "whatNotToDo":
      "Don’t mock or criticize their fears or say things like 'it’s all in your head.' Avoid forcing them into stressful situations or rushing their recovery. Never dismiss their anxiety as overreacting—it feels real and intense to them."
    },
    {
      "name": "PTSD",
      "icon": Icons.visibility,
      "symptoms":
      "Post-Traumatic Stress Disorder may develop after trauma such as abuse, assault, or accidents. Symptoms include vivid flashbacks, nightmares, avoidance of reminders, emotional numbness, or being easily startled. Many feel detached from reality or hyper-aware of their surroundings.",
      "howToHelp":
      "Provide a sense of safety and consistency. Respect their boundaries and allow them to share only when they feel ready. Encourage therapy or trauma counseling and remind them that recovery takes time. Be patient, avoid judgment, and offer grounding techniques during distressing moments.",
      "whatNotToDo":
      "Do not pressure them to talk about their trauma or question their memory. Avoid minimizing their reactions or telling them to 'move on.' Sudden loud noises, surprise touches, or pushing them into triggering environments can make symptoms worse."
    },
    {
      "name": "Bipolar Disorder",
      "icon": Icons.brightness_7,
      "symptoms":
      "Bipolar disorder causes intense mood swings that include manic episodes (high energy, impulsivity, little need for sleep) and depressive episodes (low energy, sadness, hopelessness). These shifts can affect sleep, judgment, relationships, and performance in daily life.",
      "howToHelp":
      "Encourage treatment consistency, including medication and therapy. Help them track mood patterns and maintain a stable daily routine. Offer understanding during both high and low phases, and remind them they are not defined by their disorder. Promote open and honest communication.",
      "whatNotToDo":
      "Avoid mocking mood changes or taking irritability personally. Don’t ignore early warning signs of mania or depression, and never suggest they stop medication without consulting a doctor. Avoid labeling them as 'crazy'—this reinforces stigma and guilt."
    },
    {
      "name": "ADHD",
      "icon": Icons.flash_on,
      "symptoms":
      "People with ADHD may struggle to focus, organize tasks, or sit still. They can act impulsively, forget details, or have trouble managing time. However, they are often highly creative, energetic, and capable of deep focus when interested.",
      "howToHelp":
      "Be patient and encouraging. Break tasks into smaller, structured steps and offer reminders or checklists. Celebrate small successes and create predictable routines. Help redirect energy positively through hobbies or exercise. Encourage professional evaluation or behavioral therapy if needed.",
      "whatNotToDo":
      "Avoid criticizing them for behaviors beyond their control, comparing them to 'more disciplined' peers, or labeling them as lazy. Don’t punish forgetfulness harshly or interrupt their focus unnecessarily when they are deeply engaged."
    },
    {
      "name": "OCD",
      "icon": Icons.loop,
      "symptoms":
      "Obsessive-Compulsive Disorder involves unwanted, repetitive thoughts (obsessions) and behaviors (compulsions) that aim to reduce anxiety. Examples include constant handwashing, checking locks, or seeking reassurance. These rituals are often distressing and time-consuming.",
      "howToHelp":
      "Offer empathy and avoid judgment. Encourage professional treatment like Cognitive Behavioral Therapy (CBT). Be patient if rituals take time, and help them focus on small steps toward managing anxiety. Offer distraction or grounding when compulsions feel overwhelming.",
      "whatNotToDo":
      "Don’t joke about their compulsions or call them 'crazy' or 'OCD' casually. Never force them to stop rituals abruptly—it can cause panic. Avoid participating in or reinforcing compulsions out of pity; support gradual change under professional guidance."
    },
    {
      "name": "Eating Disorders",
      "icon": Icons.restaurant,
      "symptoms":
      "Eating disorders like anorexia, bulimia, and binge-eating involve unhealthy relationships with food, weight, and body image. Symptoms include extreme dieting, bingeing, purging, overexercising, and obsession with appearance. These can lead to severe health risks.",
      "howToHelp":
      "Encourage professional help from doctors and therapists specializing in eating disorders. Focus conversations on emotions and health rather than appearance. Offer compassion, listen without judgment, and avoid discussing calories or body size. Celebrate non-appearance-based achievements.",
      "whatNotToDo":
      "Avoid commenting on weight or eating habits, even as compliments. Don’t try to control their food intake or shame their behavior. Never say 'you look healthy now'—this can trigger anxiety or relapse. Avoid discussing diets or weight loss near them."
    },
    {
      "name": "Social Anxiety",
      "icon": Icons.people,
      "symptoms":
      "Social anxiety involves intense fear of judgment or embarrassment in social settings. People may avoid conversations, public speaking, or gatherings, experiencing physical symptoms like shaking, sweating, or nausea. This fear can deeply affect self-esteem and relationships.",
      "howToHelp":
      "Be kind, patient, and nonjudgmental. Encourage small, gradual social interactions rather than sudden exposure. Practice conversations or role-playing in a safe environment. Remind them that progress is slow but achievable, and support them in seeking therapy if needed.",
      "whatNotToDo":
      "Don’t tease or pressure them to 'just talk' or 'stop being shy.' Avoid forcing them into social events without preparation. Never dismiss their fears or label them as antisocial—they often want to connect but struggle with overwhelming fear."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Disorder Library"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: disorders.length,
        itemBuilder: (context, index) {
          final disorder = disorders[index];
          return DisorderCard(
            name: disorder["name"]!,
            icon: disorder["icon"]!,
            symptoms: disorder["symptoms"]!,
            howToHelp: disorder["howToHelp"]!,
            whatNotToDo: disorder["whatNotToDo"]!,
          );
        },
      ),
    );
  }
}

class DisorderCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final String symptoms;
  final String howToHelp;
  final String whatNotToDo;

  const DisorderCard({
    Key? key,
    required this.name,
    required this.icon,
    required this.symptoms,
    required this.howToHelp,
    required this.whatNotToDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.deepPurple),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          name,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Symptoms:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal[700])),
                Text(symptoms),
                const SizedBox(height: 8),
                Text("How to Help:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal[700])),
                Text(howToHelp),
                const SizedBox(height: 8),
                Text("What Not to Do:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal[700])),
                Text(whatNotToDo),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
