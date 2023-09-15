import 'dart:async';

import 'package:flutter/material.dart';
// Stopwatch _stopwatch = Stopwatch();
// late Timer _timer;
// String _elapsedTime = "00:00:00.00";

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerApp(),
    );
  }
}

class TimerApp extends StatefulWidget {
  const TimerApp({super.key});

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  String _elapsedTime = "00:00:00.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Timer App',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Elapsed Time: $_elapsedTime",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green, // foreground color
                    shadowColor: Colors.green, // elevation color
                    elevation: 5, // elevation of button
                  ),
                  child: Text(
                    "Start",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  onPressed: _startStopwatch,
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red, // foreground color
                    shadowColor: Colors.red, // elevation color
                    elevation: 5,
                  ),
                  child: const Text(
                    "Stop",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  onPressed: _stopStopwatch,
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.amber, // foreground color
                    shadowColor: Colors.amber, // elevation color
                    elevation: 5,
                  ),
                  child: const Text(
                    "Reset",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: _resetStopwatch,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _startStopwatch() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
      setState(() {
        _elapsedTime = _stopwatch.elapsed.toString().substring(0, 8);
      });
    });
  }

  void _stopStopwatch() {
    _stopwatch.stop();
    _timer.cancel();
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    _timer.cancel();
    setState(() {
      _elapsedTime = "00:00:00.00";
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
