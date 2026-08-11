import 'package:flutter/material.dart';

void main() {
  runApp(const KidsWorldApp());
}

class KidsWorldApp extends StatelessWidget {
  const KidsWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kids World',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ================= HOME =================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      ['🔤', 'Alphabet', Colors.pink, const AlphabetScreen()],
      ['🔢', 'Numbers', Colors.orange, const NumbersScreen()],
      ['🎨', 'Colors', Colors.green, const ColorsScreen()],
      ['🔺', 'Shapes', Colors.blue, const ShapesScreen()],
      ['📖', 'Stories', Colors.purple, const StoriesScreen()],
      ['🎮', 'Games', Colors.red, const GamesScreen()],
      ['🏆', 'Rewards', Colors.amber, const RewardsScreen()],
      ['👨‍👩‍👧', 'Parent Progress', Colors.teal, const ProgressScreen()],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kids World 🌈',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6C3DF5), Color(0xFF9B72FF)],
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Kids World! 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Learn • Play • Grow 🌟',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'What do you want to learn?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: lessons.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.05,
                ),
                itemBuilder: (context, index) {
                  final item = lessons[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => item[3] as Widget,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (item[2] as Color).withOpacity(.12),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: (item[2] as Color).withOpacity(.25),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item[0] as String,
                            style: const TextStyle(fontSize: 42),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item[1] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= ALPHABET =================

class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');

    return Scaffold(
      appBar: AppBar(title: const Text('Alphabet 🔤')),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: letters.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length]
                  .withOpacity(.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                letters[index],
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ================= NUMBERS =================

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Numbers 🔢')),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 20,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ================= COLORS =================

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      ['🔴', 'Red', Colors.red],
      ['🟠', 'Orange', Colors.orange],
      ['🟡', 'Yellow', Colors.yellow],
      ['🟢', 'Green', Colors.green],
      ['🔵', 'Blue', Colors.blue],
      ['🟣', 'Purple', Colors.purple],
      ['🩷', 'Pink', Colors.pink],
      ['🟤', 'Brown', Colors.brown],
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Colors 🎨')),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colors[index][2] as Color,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Text(
              '${colors[index][0]}   ${colors[index][1]}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: index == 2 ? Colors.black : Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ================= SHAPES =================

class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shapes = [
      '🔴 Circle',
      '🟦 Square',
      '🔺 Triangle',
      '⭐ Star',
      '❤️ Heart',
      '⬛ Rectangle',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Shapes 🔺')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: shapes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Text(
                shapes[index],
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ================= STORIES =================

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      '🐰 The Little Rabbit',
      '🦁 The Brave Lion',
      '🐻 The Friendly Bear',
      '🐸 The Happy Frog',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Stories 📖')),
      body: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Text('📚', style: TextStyle(fontSize: 30)),
              title: Text(
                stories[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}

// ================= GAMES =================

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Games 🎮')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '🎯 Learning Games',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Start Game 🚀'),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= REWARDS =================

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rewards 🏆')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🏆', style: TextStyle(fontSize: 80)),
            SizedBox(height: 15),
            Text(
              'Your Rewards',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Keep learning to earn more stars! ⭐',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= PARENT PROGRESS =================

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parent Progress 👨‍👩‍👧')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Learning Progress',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            progress('Alphabet', .75),
            progress('Numbers', .60),
            progress('Colors', .85),
            progress('Shapes', .45),
          ],
        ),
      ),
    );
  }

  Widget progress(String title, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: value, minHeight: 10),
        ],
      ),
    );
  }
}
