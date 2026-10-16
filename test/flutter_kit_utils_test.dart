import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_kit_utils/flutter_kit_utils.dart';

void main() {
  group('Size Extensions Tests', () {
    test('orientation returns landscape when width > height', () {
      const size = Size(800, 400);
      expect(size.orientation(), equals(SizeOrientation.landscape));
    });

    test('orientation returns portrait when height > width', () {
      const size = Size(400, 800);
      expect(size.orientation(), equals(SizeOrientation.portrait));
    });

    test('orientation returns square when width == height', () {
      const size = Size(500, 500);
      expect(size.orientation(), equals(SizeOrientation.square));
    });

    test('max returns the largest dimension', () {
      const size = Size(300, 600);
      expect(size.max(), equals(600.0));
      const size2 = Size(700, 200);
      expect(size2.max(), equals(700.0));
    });
  });

  group('OrientationSizeBox & OrientationStack Tests', () {
    testWidgets('OrientationSizeBox applies fraction correctly in landscape',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OrientationSizeBox(
              size: Size(1000, 500), // landscape
              fraction: 0.5,
              child: Text('Content'),
            ),
          ),
        ),
      );

      expect(find.text('Content'), findsOneWidget);
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
      expect(sizedBox.width, equals(500.0));
    });

    testWidgets(
        'OrientationStack renders Row in landscape and Column in portrait',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OrientationStack(
              orientation: SizeOrientation.landscape,
              children: [Text('Item 1'), Text('Item 2')],
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OrientationStack(
              orientation: SizeOrientation.portrait,
              children: [Text('Item 1'), Text('Item 2')],
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
    });
  });

  group('CropConfig and BubbleConfig Model Tests', () {
    test('CropConfig holds default and custom values', () {
      const crop = CropConfig(index: 0);
      expect(crop.alignment, equals(Alignment.center));
      expect(crop.widthFactor, equals(1.0));
      expect(crop.heightFactor, equals(1.0));

      const customCrop = CropConfig(
        index: 2,
        alignment: Alignment.topLeft,
        widthFactor: 0.8,
        heightFactor: 0.6,
      );
      expect(customCrop.index, equals(2));
      expect(customCrop.alignment, equals(Alignment.topLeft));
      expect(customCrop.widthFactor, equals(0.8));
    });

    test('BubbleConfig equality, hashCode and copyWith', () {
      final config1 = BubbleConfig(
        borderColor: Colors.black,
        text: 'Hello',
        textStyle: const TextStyle(fontSize: 14),
        width: 100,
        height: 50,
      );

      final config2 = BubbleConfig(
        borderColor: Colors.black,
        text: 'Hello',
        textStyle: const TextStyle(fontSize: 14),
        width: 100,
        height: 50,
      );

      expect(config1, equals(config2));
      expect(config1.hashCode, equals(config2.hashCode));
      expect(config1.type, equals(BubbleType.speech));
      expect(config1.tailPosition, equals(BubbleTailPosition.bottomLeft));
      expect(config1.strokeWidth, equals(2.0));

      final config3 = config1.copyWith(
        type: BubbleType.thought,
        tailPosition: BubbleTailPosition.bottomRight,
        fillColor: Colors.purple,
      );
      expect(config3.type, equals(BubbleType.thought));
      expect(config3.tailPosition, equals(BubbleTailPosition.bottomRight));
      expect(config3.fillColor, equals(Colors.purple));
      expect(config3.text, equals('Hello'));
      expect(config1 == config3, isFalse);
    });
  });

  group('Custom Widgets Tests', () {
    testWidgets('CustomButton renders and triggers onPressed callback',
        (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Cliquez ici',
              onPressed: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      expect(find.text('Cliquez ici'), findsOneWidget);
      await tester.tap(find.text('Cliquez ici'));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('CustomTextField renders and accepts text input',
        (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hintText: 'Entrez votre nom',
              controller: controller,
              keyboardType: TextInputType.text,
              obscureText: false,
            ),
          ),
        ),
      );

      expect(find.text('Entrez votre nom'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'Antigravity');
      expect(controller.text, equals('Antigravity'));
    });

    testWidgets('AnimatedOpacityFade renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedOpacityFade(
              duration: Duration(milliseconds: 200),
              child: Text('Fade In'),
            ),
          ),
        ),
      );

      expect(find.text('Fade In'), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 250));
      expect(find.text('Fade In'), findsOneWidget);
    });

    testWidgets('FadeTransitionFade renders child widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FadeTransitionFade(
              duration: Duration(milliseconds: 200),
              child: Text('Fade Transition'),
            ),
          ),
        ),
      );

      expect(find.text('Fade Transition'), findsOneWidget);
      await tester.pump(const Duration(milliseconds: 250));
      expect(find.text('Fade Transition'), findsOneWidget);
    });

    testWidgets('SvgCustomPainter paints speech bubbles in all directions',
        (tester) async {
      for (final position in BubbleTailPosition.values) {
        final config = BubbleConfig(
          borderColor: Colors.blue,
          fillColor: Colors.amber,
          text: 'Speech $position',
          textStyle: const TextStyle(fontSize: 12, color: Colors.black),
          width: 150,
          height: 80,
          type: BubbleType.speech,
          tailPosition: position,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomPaint(
                size: const Size(150, 80),
                painter: SvgCustomPainter(config: config),
              ),
            ),
          ),
        );

        expect(find.byType(CustomPaint), findsWidgets);
      }
    });

    testWidgets('SvgCustomPainter paints thought bubbles in all directions',
        (tester) async {
      for (final position in BubbleTailPosition.values) {
        final config = BubbleConfig(
          borderColor: Colors.indigo,
          fillColor: Colors.white,
          text: 'Thought $position',
          textStyle: const TextStyle(fontSize: 12, color: Colors.black),
          width: 150,
          height: 80,
          type: BubbleType.thought,
          tailPosition: position,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: CustomPaint(
                size: const Size(150, 80),
                painter: SvgCustomPainter(config: config),
              ),
            ),
          ),
        );

        expect(find.byType(CustomPaint), findsWidgets);
      }
    });

    test('SvgCustomPainter shouldRepaint test', () {
      final config1 = BubbleConfig(
        borderColor: Colors.blue,
        text: 'A',
        textStyle: const TextStyle(fontSize: 12),
        width: 100,
        height: 50,
      );
      final config2 = config1.copyWith(text: 'B');
      final painter1 = SvgCustomPainter(config: config1);
      final painter2 = SvgCustomPainter(config: config1);
      final painter3 = SvgCustomPainter(config: config2);

      expect(painter1.shouldRepaint(painter2), isFalse);
      expect(painter1.shouldRepaint(painter3), isTrue);
    });
  });
}
