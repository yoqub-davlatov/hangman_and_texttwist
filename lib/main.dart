import 'package:flutter/material.dart';
import 'home_page/home_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize().then((_) {
    final RequestConfiguration configuration = RequestConfiguration(
      testDeviceIds: <String>["C356D6FB9FEEA495A81ED52C049E198B"],
    );
    MobileAds.instance.updateRequestConfiguration(configuration);
  });


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hangman & TextTwist',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hangman & TextTwist'),
    );
  }
}
