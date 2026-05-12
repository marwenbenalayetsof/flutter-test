import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marwen Ben Alayet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00D4AA),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0A0F1C),
              const Color(0xFF0F172A),
              const Color(0xFF0C1929),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // Animated Logo
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1.0 + 0.05 * _controller.value,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00D4AA), Color(0xFF0EA5E9)],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00D4AA).withOpacity(0.4),
                              blurRadius: 20 + 10 * _controller.value,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.data_object,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
                // Title
                Text(
                  'Marwen Ben Alayet',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [Color(0xFF00D4AA), Color(0xFF0EA5E9)],
                      ).createShader(const Rect.fromLTWH(0, 0, 300, 70)),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00D4AA).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF00D4AA).withOpacity(0.3)),
                  ),
                  child: const Text(
                    'Senior Data Engineer',
                    style: TextStyle(
                      color: Color(0xFF00D4AA),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Counter Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A2236),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.06)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00D4AA).withOpacity(0.1),
                        blurRadius: 30,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Flutter Cross-Platform Test',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '$_counter',
                        style: TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.w900,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: [Color(0xFF00D4AA), Color(0xFF0EA5E9)],
                            ).createShader(const Rect.fromLTWH(0, 0, 200, 100)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _incrementCounter,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00D4AA),
                          foregroundColor: const Color(0xFF0A0F1C),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Tap Me!',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Tech Skills
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tech Stack',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    'Spark', 'Kafka', 'Airflow', 'Python', 'GCP',
                    'Kubernetes', 'Docker', 'Terraform', 'Trino', 'SQL',
                  ].map((skill) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D4AA).withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFF00D4AA).withOpacity(0.15)),
                    ),
                    child: Text(
                      skill,
                      style: const TextStyle(
                        color: Color(0xFF00F0C0),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )).toList(),
                ),
                const SizedBox(height: 24),
                // Platform Info
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A2236),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.06)),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.phone_android, color: Color(0xFF00D4AA), size: 20),
                          SizedBox(width: 8),
                          Text('Android', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.phone_iphone, color: Color(0xFF00D4AA), size: 20),
                          SizedBox(width: 8),
                          Text('iOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.web, color: Color(0xFF00D4AA), size: 20),
                          SizedBox(width: 8),
                          Text('Web', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Contact
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00D4AA), Color(0xFF0EA5E9)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Get In Touch',
                        style: TextStyle(
                          color: Color(0xFF0A0F1C),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'marwen.benalayet.sof@gmail.com',
                        style: TextStyle(
                          color: Color(0xFF0A0F1C),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
