import 'package:flutter/material.dart';

void main() {
  runApp(const AstrologerApp());
}

class AstrologerApp extends StatelessWidget {
  const AstrologerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astrologer',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Astrologer"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            menuCard(
              context,
              "Daily Horoscope",
              Icons.sunny,
              const HoroscopePage(),
            ),
            menuCard(
              context,
              "Kundli",
              Icons.star,
              const KundliPage(),
            ),
            menuCard(
              context,
              "Match Making",
              Icons.favorite,
              const MatchPage(),
            ),
            menuCard(
              context,
              "Settings",
              Icons.settings,
              const SettingsPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuCard(
      BuildContext context,
      String title,
      IconData icon,
      Widget page,
      ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HoroscopePage extends StatelessWidget {
  const HoroscopePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daily Horoscope")),
      body: const Center(
        child: Text(
          "Today's Horoscope Will Appear Here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class KundliPage extends StatefulWidget {
  const KundliPage({super.key});

  @override
  State<KundliPage> createState() => _KundliPageState();
}

class _KundliPageState extends State<KundliPage> {
  final nameController = TextEditingController();
  final dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kundli Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: dobController,
              decoration: const InputDecoration(
                labelText: "Date of Birth",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Kundli"),
                    content: Text(
                      "Name: ${nameController.text}\nDOB: ${dobController.text}",
                    ),
                  ),
                );
              },
              child: const Text("Generate Kundli"),
            )
          ],
        ),
      ),
    );
  }
}

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Match Making"),
      ),
      body: const Center(
        child: Text(
          "Compatibility Feature Coming Soon",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const Center(
        child: Text(
          "Settings Page",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}