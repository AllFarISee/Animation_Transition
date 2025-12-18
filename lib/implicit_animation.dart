import 'package:flutter/material.dart';

class LampSwitchAnimation extends StatefulWidget {
  const LampSwitchAnimation({super.key});

  @override
  State<LampSwitchAnimation> createState() => _LampSwitchAnimationState();
}

class _LampSwitchAnimationState extends State<LampSwitchAnimation> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade900,
      appBar: AppBar(
        title: const Text("Lamp Switch"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: isOn ? Colors.yellow : Colors.grey.shade700,
                shape: BoxShape.circle,
                boxShadow: [
                  if (isOn)
                    BoxShadow(
                      color: Colors.yellow,
                      blurRadius: 40,
                      spreadRadius: 15,
                    )
                ],
              ),
              child: Icon(
                Icons.lightbulb,
                size: 70,
                color: isOn ? Colors.orange : Colors.black54,
              ),
            ),

            const SizedBox(height: 40),

            //Switch
            GestureDetector(
              onTap: () {
                setState(() {
                  isOn = !isOn;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: 160,   // 👉 LEBAR
                height: 70,   // 👉 TINGGI
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 400),
                  alignment: isOn
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isOn ? Colors.yellow : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              isOn ? "ON" : "OFF",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
