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
          seedColor: const Color(0xFF6C4BFF),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ------------------------------------------------------------
// HOME
// ------------------------------------------------------------

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int points = 150;
  int streak = 3;
  int completed = 4;

  void addReward() {
    setState(() {
      points += 10;
      completed++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cards = [
      {
        'title': 'Alphabet',
        'emoji': '🔤',
        'color': const Color(0xFFFFD9E8),
        'page': const AlphabetScreen(),
      },
      {
        'title': 'Numbers',
        'emoji': '🔢',
        'color': const Color(0xFFD9F4FF),
        'page': const NumbersScreen(),
      },
      {
        'title': 'Colors',
        'emoji': '🎨',
        'color': const Color(0xFFFFF0C7),
        'page': const ColorsScreen(),
      },
      {
        'title': 'Shapes',
        'emoji': '🔺',
        'color': const Color(0xFFE5DDFF),
        'page': const ShapesScreen(),
      },
      {
        'title': 'Stories',
        'emoji': '📚',
        'color': const Color(0xFFDFF7DD),
        'page': const StoriesScreen(),
      },
      {
        'title': 'Games',
        'emoji': '🎮',
        'color': const Color(0xFFFFDFCF),
        'page': const GamesScreen(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Kids World 🌈',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProgressScreen(
                    points: points,
                    completed: completed,
                    streak: streak,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _welcomeCard(),
              const SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: _statCard(
                      '⭐',
                      '$points',
                      'Points',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _statCard(
                      '🔥',
                      '$streak Days',
                      'Streak',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'What do you want to learn? 📚',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 14),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cards.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.18,
                ),
                itemBuilder: (context, index) {
                  final item = cards[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => item['page'] as Widget,
                        ),
                      ).then((_) {
                        setState(() {});
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: item['color'] as Color,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item['emoji'] as String,
                            style: const TextStyle(fontSize: 45),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['title'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              const Text(
                'Your Progress 📊',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Learning completed',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '$completed / 10',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: (completed / 10).clamp(0.0, 1.0),
                      minHeight: 12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _welcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6C4BFF),
            Color(0xFF9D6CFF),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Little Learner! 👋',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Learn • Play • Grow 🌈',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Let’s learn something new today! 🚀',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(
    String emoji,
    String value,
    String title,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------
// ALPHABET
// ------------------------------------------------------------

class AlphabetScreen extends StatelessWidget {
  const AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const letters = [
      ['A', '🍎', 'Apple'],
      ['B', '⚽', 'Ball'],
      ['C', '🐱', 'Cat'],
      ['D', '🐶', 'Dog'],
      ['E', '🐘', 'Elephant'],
      ['F', '🐟', 'Fish'],
      ['G', '🍇', 'Grapes'],
      ['H', '🏠', 'House'],
      ['I', '🍦', 'Ice Cream'],
      ['J', '🧃', 'Juice'],
      ['K', '🪁', 'Kite'],
      ['L', '🦁', 'Lion'],
    ];

    return LearningPage(
      title: 'Alphabet 🔤',
      subtitle: 'Learn letters and words',
      child: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: letters.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (_, index) {
          final item = letters[index];

          return LearningCard(
            color: const Color(0xFFFFE2EE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item[0],
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  item[1],
                  style: const TextStyle(fontSize: 35),
                ),
                const SizedBox(height: 5),
                Text(
                  item[2],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// NUMBERS
// ------------------------------------------------------------

class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LearningPage(
      title: 'Numbers 🔢',
      subtitle: 'Let’s count together!',
      child: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: 12,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          final number = index + 1;

          return LearningCard(
            color: const Color(0xFFDDF5FF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$number',
                  style: const TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  '⭐' * number.clamp(1, 5),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// COLORS
// ------------------------------------------------------------

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      ['Red', Colors.red],
      ['Blue', Colors.blue],
      ['Yellow', Colors.yellow],
      ['Green', Colors.green],
      ['Orange', Colors.orange],
      ['Purple', Colors.purple],
      ['Pink', Colors.pink],
      ['Brown', Colors.brown],
    ];

    return LearningPage(
      title: 'Colors 🎨',
      subtitle: 'Learn beautiful colors',
      child: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: colors.length,
        itemBuilder: (_, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            height: 75,
            decoration: BoxDecoration(
              color: colors[index][1] as Color,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Center(
              child: Text(
                colors[index][0] as String,
                style: TextStyle(
                  color: colors[index][0] == 'Yellow'
                      ? Colors.black
                      : Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// SHAPES
// ------------------------------------------------------------

class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shapes = [
      ['⭕', 'Circle'],
      ['⬛', 'Square'],
      ['🔺', 'Triangle'],
      ['⭐', 'Star'],
      ['💎', 'Diamond'],
      ['❤️', 'Heart'],
    ];

    return LearningPage(
      title: 'Shapes 🔺',
      subtitle: 'Can you recognize them?',
      child: GridView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: shapes.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (_, index) {
          return LearningCard(
            color: const Color(0xFFE9E2FF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  shapes[index][0],
                  style: const TextStyle(fontSize: 50),
                ),
                const SizedBox(height: 5),
                Text(
                  shapes[index][1],
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// STORIES
// ------------------------------------------------------------

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      ['🐰', 'The Little Bunny', 'A cute bunny learns to share.'],
      ['🦁', 'Brave Little Lion', 'A little lion discovers courage.'],
      ['🐻', 'The Friendly Bear', 'A bear makes a new friend.'],
      ['🐢', 'Slow and Steady', 'A turtle learns never to give up.'],
    ];

    return LearningPage(
      title: 'Stories 📚',
      subtitle: 'Fun stories for little learners',
      child: ListView.builder(
        padding: const EdgeInsets.all(18),
        itemCount: stories.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: Text(
                stories[index][0],
                style: const TextStyle(fontSize: 42),
              ),
              title: Text(
                stories[index][1],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text(stories[index][2]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(stories[index][1]),
                    content: Text(
                      '${stories[index][2]}\n\n'
                      'Once upon a time, there was a very happy little friend. '
                      'Every day they learned something new and helped others. '
                      'The end! 🌈',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Great! ⭐'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ------------------------------------------------------------
// GAMES
// ------------------------------------------------------------

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  String answer = '';
  bool correct = false;

  void choose(String value) {
    setState(() {
      answer = value;
      correct = value == 'Red';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F7FF),
      appBar: AppBar(
        title: const Text(
          'Learning Game 🎮',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Which one is RED? ❤️',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 35),

            _gameButton('🔴', 'Red'),
            _gameButton('🔵', 'Blue'),
            _gameButton('🟢', 'Green'),
            _gameButton('🟡', 'Yellow'),

            const 
