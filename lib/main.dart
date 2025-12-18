import 'package:animation/implicit_animation.dart';
import 'package:animation/interactive_animation.dart';
import 'package:flutter/material.dart';
import 'explicit_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade800, 
              foregroundColor: Colors.white
            ),
              child: const Text("Implicit Animation"),
              onPressed: () {
                _pushWithTransition(
                  context,
                  const LampSwitchAnimation(),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade800, 
              foregroundColor: Colors.white
            ),
              child: const Text("Explicit Animation"),
              onPressed: () {
                _pushWithTransition(
                  context,
                  const ExplicitControlAnimation(),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade800,
              foregroundColor: Colors.white
            ),
              child: const Text("Interactive Animation"),
              onPressed: () {
                _pushWithTransition(
                  context,
                  const InteractiveAnimationPage(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//Page Transition
void _pushWithTransition(BuildContext context, Widget page) {
  Navigator.push(
    context,
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 450),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder:
          (context, animation, secondaryAnimation, child) {
        final slideAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0), // dari kanan
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        );

        final fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(animation);

        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    ),
  );
}
