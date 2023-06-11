import 'package:flutter/material.dart';
import './hangman_page.dart';
import './text_twist_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman & TextTwist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hangman & TextTwist'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(

        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/my_background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: 300,
              child: Text(
                "PICK YOUR GAME AND LET THE FUN BEGIN!",
                style: TextStyle(
                  fontFamily: 'KristenITC',
                  color: Colors.green,
                  fontSize: 35.0,
                ),
                textAlign: TextAlign.center,
              ),
              ),
              const SizedBox(height: 150), // Add this
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, primary: Colors.blue,
                  textStyle: const TextStyle(fontSize: 30 , fontFamily: "KristenITC"),
                  padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                ),
                child: const Text('Hangman'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HangmanPage()),
                  );
                },
              ),
              const SizedBox(height: 40), // Add this
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue, primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 30 , fontFamily: "KristenITC"),
                  padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 20),

                ),
                child: const Text('TextTwist'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TextTwistPage()),
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
