import 'package:flutter/material.dart';

class ExplicitControlAnimation extends StatefulWidget {
  const ExplicitControlAnimation({super.key});

  @override
  State<ExplicitControlAnimation> createState() =>
      _ExplicitControlAnimationState();
}

class _ExplicitControlAnimationState extends State<ExplicitControlAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glow;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _glow = Tween<double>(
      begin: 0,
      end: 40,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text("Play • Reverse • Repeat"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //LAMPU
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.yellow,
                        blurRadius: _glow.value,
                        spreadRadius: _glow.value / 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.lightbulb,
                    size: 70,
                    color: Colors.orange,
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

            //Button Control
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.forward(); 
                  },
                  child: const Text("Play"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _controller.reverse(); 
                  },
                  child: const Text("Reverse"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _controller.repeat(
                      reverse: true, 
                    );
                  },
                  child: const Text("Repeat"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _controller.stop();
                  },
                  child: const Text("Stop"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
