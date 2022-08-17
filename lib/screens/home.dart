import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../props.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitSeconds = "00";

      started = false;
    });
  }

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  void clearLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.clear();
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours + 1;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "STOPWATCH",
          style: GoogleFonts.paytoneOne(
            textStyle: const TextStyle(fontSize: 32),
            color: Colors.grey.shade900,
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    boxShadow: neuBoxShadow,
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("$digitHours:$digitMinutes:$digitSeconds",
                      style: GoogleFonts.paytoneOne(
                          textStyle: const TextStyle(fontSize: 64),
                          color: Colors.grey.shade900)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 400,
              decoration: BoxDecoration(
                  boxShadow: neuBoxShadow,
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16)),
              child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tur: ${index + 1}",
                          style: GoogleFonts.paytoneOne(
                              textStyle: const TextStyle(fontSize: 18),
                              color: Colors.grey.shade900),
                        ),
                        Text(
                          "${laps[index]}",
                          style: GoogleFonts.paytoneOne(
                              textStyle: const TextStyle(fontSize: 18),
                              color: Colors.grey.shade900),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    clearLaps();
                    reset();
                  },
                  child: const Icon(
                    Icons.clear_rounded,
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: IconButton(
                      onPressed: () {
                        addLaps();
                      },
                      icon: Icon(
                        Icons.flag,
                        color: Colors.grey.shade900,
                      )),
                ),
                Expanded(
                    child: ElevatedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    (!started) ? start() : stop();
                  },
                  child: Icon(
                    color: Colors.white,
                    (!started) ? Icons.play_arrow : Icons.pause,
                  ),
                )),
              ],
            )
          ],
        ),
      )),
    );
  }
}
