import 'package:flutter/material.dart';
import 'bottom_nav_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FT-ieland Intro App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400), // Regular
          bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300), // Light
          headlineLarge: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w700), // Bold (대제목)
        ),
      ),
      home: const MyHomePage(title: 'FT-ie 소개팅land'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.95,
      upperBound: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onButtonPressed() {
    _controller.forward().then((_) => _controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFF48FB1),
                    Color(0xFFCE93D8),
                    Color(0xFFB39DDB),
                  ],
                ),
              ),
            ),
          ),
          // Heart Pattern Background
          const Positioned.fill(
            child: HeartPattern(),
          ),
          // Center Button with Animation
          Center(
            child: GestureDetector(
              onTapDown: (_) => _onButtonPressed(),
              child: ScaleTransition(
                scale: _controller,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BottomNavHome(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      // 화면 크기에 따라 버튼 크기 조정
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.8,  // 화면 너비의 80%
                        MediaQuery.of(context).size.height * 0.07, // 화면 높이의 7%
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 50.0,
                      ),
                    ),
                    child: Text(
                      '만남을 시작하시겠습니까?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05, // 화면 너비의 5%로 글자 크기 조정
                        fontWeight: FontWeight.bold,
                        shadows: const [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black45,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const Positioned(
            top: 200, // Increase this value to move it lower
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "FT-ie 소개팅land",
                style: TextStyle(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Widget for Heart Pattern Background
class HeartPattern extends StatelessWidget {
  const HeartPattern({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20.0,
      runSpacing: 60.0,
      children: List.generate(100, (index) {
        return HeartIcon();
      }),
    );
  }
}

// Animated Heart Icon Widget
class HeartIcon extends StatefulWidget {
  @override
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Icon(
        Icons.favorite,
        size: 50.0,
        color: Colors.white.withOpacity(0.2), // Lighter color for background
      ),
    );
  }
}
