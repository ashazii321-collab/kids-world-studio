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
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// ================= SPLASH =================

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff61C8F5), Color(0xffBCEBFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🌈',
                style: TextStyle(fontSize: 70),
              ),
              const Text(
                'KIDS\nWORLD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: .95,
                  shadows: [
                    Shadow(
                      color: Colors.deepPurple,
                      blurRadius: 4,
                      offset: Offset(2, 3),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Learn • Play • Grow',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                '👦',
                style: TextStyle(fontSize: 100),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(240, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'I Already Have an Account',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= HOME =================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  final pages = const [
    HomeContent(),
    LearnScreen(),
    GamesScreen(),
    RewardsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selected],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (i) => setState(() => selected = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'Learn'),
          NavigationDestination(icon: Icon(Icons.games), label: 'Games'),
          NavigationDestination(icon: Icon(Icons.emoji_events), label: 'Rewards'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ================= HOME CONTENT =================

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Hello, Ali 👋',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange.shade100,
                  child: const Text('⭐'),
                )
              ],
            ),
            const Text(
              "Let's learn something new!",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff138BEA), Color(0xff54B9FF)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Text('👦', style: TextStyle(fontSize: 65)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Goal",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Learn 5 new things',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        LinearProgressIndicator(value: .6),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Explore Categories',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                CategoryCard('🔤', 'Alphabet', Colors.purple),
                CategoryCard('123', 'Numbers', Colors.green),
                CategoryCard('🎨', 'Colors', Colors.orange),
                CategoryCard('🔺', 'Shapes', Colors.blue),
                CategoryCard('📕', 'Stories', Colors.pink),
                CategoryCard('🎮', 'Games', Colors.indigo),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;

  const CategoryCard(this.icon, this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// ================= LEARN =================

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Learn 📚',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          LearnCard(
            title: 'Alphabet',
            subtitle: 'Learn A to Z',
            emoji: '🔤',
            color: Colors.deepPurple,
            page: const AlphabetScreen(),
          ),
          LearnCard(
            title: 'Numbers',
            subtitle: 'Learn 1 to 10',
            emoji: '🔢',
            color: Colors.teal,
            page: const NumbersScreen(),
          ),
          LearnCard(
            title: 'Colors',
            subtitle: 'Learn beautiful colors',
            emoji: '🎨',
            color: Colors.orange,
            page: const ColorsScreen(),
          ),
          LearnCard(
            title: 'Shapes',
            subtitle: 'Learn basic shapes',
            emoji: '🔺',
            color: Colors.blue,
            page: const ShapesScreen(),
          ),
          LearnCard(
            title: 'Stories',
            subtitle: 'Fun short stories',
            emoji: '📖',
            color: Colors.pink,
            page: const StoriesScreen(),
          ),
        ],
      ),
    );
  }
}

class LearnCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String emoji;
  final Color color;
  final Widget page;

  const LearnCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.color,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(.15),
          child: Text(emoji, style: const TextStyle(fontSize: 28)),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}

// ================= ALPHABET =================

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({super.key});

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  int index = 0;

  final letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  final words = [
    'Apple',
    'Ball',
    'Cat',
    'Dog',
    'Elephant',
    'Fish',
    'Grapes',
    'House',
    'Ice Cream',
    'Juice',
    'Kite',
    'Lion',
    'Moon',
    'Nest',
    'Orange',
    'Panda',
    'Queen',
    'Rabbit',
    'Sun',
    'Tiger',
    'Umbrella',
    'Van',
    'Watermelon',
    'Xylophone',
    'Yak',
    'Zebra'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEE5FF),
      appBar: AppBar(
        title: const Text('Alphabet'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Text(
                  letters[index],
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  words[index],
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 26,
              itemBuilder: (_, i) => GestureDetector(
                onTap: () => setState(() => index = i),
                child: CircleAvatar(
                  backgroundColor:
                      i == index ? Colors.orange : Colors.white,
                  child: Text(
                    letters[i],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
      backgroundColor: const Color(0xffD9FFF4),
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
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

// ================= SPLASH =================

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff61C8F5), Color(0xffBCEBFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🌈',
                style: TextStyle(fontSize: 70),
              ),
              const Text(
                'KIDS\nWORLD',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: .95,
                  shadows: [
                    Shadow(
                      color: Colors.deepPurple,
                      blurRadius: 4,
                      offset: Offset(2, 3),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Learn • Play • Grow',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 45),
              const Text(
                '👦',
                style: TextStyle(fontSize: 100),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(240, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'I Already Have an Account',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= HOME =================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  final pages = const [
    HomeContent(),
    LearnScreen(),
    GamesScreen(),
    RewardsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selected],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (i) => setState(() => selected = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'Learn'),
          NavigationDestination(icon: Icon(Icons.games), label: 'Games'),
          NavigationDestination(icon: Icon(Icons.emoji_events), label: 'Rewards'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ================= HOME CONTENT =================

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Hello, Ali 👋',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange.shade100,
                  child: const Text('⭐'),
                )
              ],
            ),
            const Text(
              "Let's learn something new!",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff138BEA), Color(0xff54B9FF)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Text('👦', style: TextStyle(fontSize: 65)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Goal",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Learn 5 new things',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        LinearProgressIndicator(value: .6),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Explore Categories',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                CategoryCard('🔤', 'Alphabet', Colors.purple),
                CategoryCard('123', 'Numbers', Colors.green),
                CategoryCard('🎨', 'Colors', Colors.orange),
                CategoryCard('🔺', 'Shapes', Colors.blue),
                CategoryCard('📕', 'Stories', Colors.pink),
                CategoryCard('🎮', 'Games', Colors.indigo),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;

  const CategoryCard(this.icon, this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// ================= LEARN =================

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const Text(
            'Learn 📚',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          LearnCard(
            title: 'Alphabet',
            subtitle: 'Learn A to Z',
            emoji: '🔤',
            color: Colors.deepPurple,
            page: const AlphabetScreen(),
          ),
          LearnCard(
            title: 'Numbers',
            subtitle: 'Learn 1 to 10',
            emoji: '🔢',
            color: Colors.teal,
            page: const NumbersScreen(),
          ),
          LearnCard(
            title: 'Colors',
            subtitle: 'Learn beautiful colors',
            emoji: '🎨',
            color: Colors.orange,
            page: const ColorsScreen(),
          ),
          LearnCard(
            title: 'Shapes',
            subtitle: 'Learn basic shapes',
            emoji: '🔺',
            color: Colors.blue,
            page: const ShapesScreen(),
          ),
          LearnCard(
            title: 'Stories',
            subtitle: 'Fun short stories',
            emoji: '📖',
            color: Colors.pink,
            page: const StoriesScreen(),
          ),
        ],
      ),
    );
  }
}

class LearnCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String emoji;
  final Color color;
  final Widget page;

  const LearnCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.emoji,
    required this.color,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(.15),
          child: Text(emoji, style: const TextStyle(fontSize: 28)),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}

// ================= ALPHABET =================

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({super.key});

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  int index = 0;

  final letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  final words = [
    'Apple',
    'Ball',
    'Cat',
    'Dog',
    'Elephant',
    'Fish',
    'Grapes',
    'House',
    'Ice Cream',
    'Juice',
    'Kite',
    'Lion',
    'Moon',
    'Nest',
    'Orange',
    'Panda',
    'Queen',
    'Rabbit',
    'Sun',
    'Tiger',
    'Umbrella',
    'Van',
    'Watermelon',
    'Xylophone',
    'Yak',
    'Zebra'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEE5FF),
      appBar: AppBar(
        title: const Text('Alphabet'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Text(
                  letters[index],
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  words[index],
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 26,
              itemBuilder: (_, i) => GestureDetector(
                onTap: () => setState(() => index = i),
                child: CircleAvatar(
                  backgroundColor:
                      i == index ? Colors.orange : Colors.white,
                  child: Text(
                    letters[i],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
      backgroundColor: const Color(0xffD9FFF4),
      appBar: AppBar(
        title: const Text('Numbers'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: 10,
        itemBuilder: (_, i) {
          final n = i + 1;
          return Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$n',
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    _numberName(n),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _numberName(int n) {
    const names = [
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten'
    ];
    return names[n - 1];
  }
}

// ================= COLORS =================

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      ['Red', Colors.red],
      ['Orange', Colors.orange],
      ['Yellow', Colors.yellow],
      ['Green', Colors.green],
      ['Blue', Colors.blue],
      ['Purple', Colors.purple],
      ['Pink', Colors.pink],
      ['Brown', Colors.brown],
      ['Grey', Colors.grey],
      ['Black', Colors.black],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: colors.length,
        itemBuilder: (_, i) {
          return Container(
            decoration: BoxDecoration(
              color: colors[i][1] as Color,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                colors[i][0] as String,
                style: TextStyle(
                  color: i == 2 || i == 8
                      ? Colors.black
                      : Colors.white,
                  fontSize: 22,
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

// ================= SHAPES =================

class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE2F3FF),
      appBar: AppBar(
        title: const Text('Shapes'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: const [
          ShapeCard('●', 'Circle', Colors.green),
          ShapeCard('▲', 'Triangle', Colors.blue),
          ShapeCard('■', 'Square', Colors.red),
          ShapeCard('▬', 'Rectangle', Colors.purple),
          ShapeCard('★', 'Star', Colors.orange),
          ShapeCard('♥', 'Heart', Colors.pink),
        ],
      ),
    );
  }
}

class ShapeCard extends StatelessWidget {
  final String shape;
  final String name;
  final Color color;

  const ShapeCard(this.shape, this.name, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            shape,
            style: TextStyle(
              fontSize: 75,
              color: color,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
      ['🦁', 'The Lion and the Mouse'],
      ['🐢', 'The Tortoise and the Hare'],
      ['🐜', 'The Ant and the Grasshopper'],
      ['🐑', 'The Boy and the Wolf'],
    ];

    return Scaffold(
      backgroundColor: const Color(0xffffe5f1),
      appBar: AppBar(
        title: const Text('Stories'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: stories.length,
        itemBuilder: (_, i) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: Text(
                stories[i][0],
                s     appBar: AppBar(
        title: const Text('Numbers'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: 10,
        itemBuilder: (_, i) {
          final n = i + 1;
          return Card(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$n',
                    style: const TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    _numberName(n),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _numberName(int n) {
    const names = [
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten'
    ];
    return names[n - 1];
  }
}

// ================= COLORS =================

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      ['Red', Colors.red],
      ['Orange', Colors.orange],
      ['Yellow', Colors.yellow],
      ['Green', Colors.green],
      ['Blue', Colors.blue],
      ['Purple', Colors.purple],
      ['Pink', Colors.pink],
      ['Brown', Colors.brown],
      ['Grey', Colors.grey],
      ['Black', Colors.black],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Colors'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: colors.length,
        itemBuilder: (_, i) {
          return (
            decoration: BoxDecoration(
              color: colors[i][1] as Color,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                colors[i][0] as String,
                style: TextStyle(
                  color: i == 2 || i == 8
                      ? Colors.black
                      : Colors.white,

