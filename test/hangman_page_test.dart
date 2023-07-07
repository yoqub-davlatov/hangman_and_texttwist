import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hangman_and_texttwist/hangman/UI/widget/show_hint_widget.dart';
import 'package:hangman_and_texttwist/hangman/UI/widget/level_widget.dart';
import 'package:hangman_and_texttwist/hangman/UI/widget/points_widget.dart';
import 'package:hangman_and_texttwist/hangman/utils/Game.dart';

void main() {
  group('HangmanPage', () {
    testWidgets('Page contains Hangman title', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(appBar: AppBar(title: const Text('Hangman')))));
      expect(find.text('Hangman'), findsOneWidget);
    });

    testWidgets('Level widget displays the correct round number', (WidgetTester tester) async {
      const roundNumber = 5;
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: levelWidget(roundNumber))));

      final roundTextFinder = find.text('$roundNumber');
      expect(roundTextFinder, findsOneWidget);
    });

    testWidgets('Points widget displays the correct points', (WidgetTester tester) async {
      const points = 10;
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: pointsWidget(points))));

      final pointsTextFinder = find.text('$points');
      expect(pointsTextFinder, findsOneWidget);
    });

    testWidgets('ShowHintWidget is initially hidden', (WidgetTester tester) async {
      bool showDescription = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                Container(), // Placeholder for other widgets
                showHintWidget(showDescription, 'This is a hint', () {}),
              ],
            ),
          ),
        ),
      );

      final hintFinder = find.text('This is a hint');
      final okButtonFinder = find.text('Ok');

      expect(hintFinder, findsNothing);
      expect(okButtonFinder, findsNothing);
    });

    testWidgets('Game tries are initially zero', (WidgetTester tester) async {
      expect(Game.gameTries, 0);
    });
  });
}
