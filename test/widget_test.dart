import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_keyboard/services/keyboard_play_service.dart';

import './widget_test.mocks.dart';

class TestButtonWidget extends ConsumerWidget {
  const TestButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // service provider
        ref.read(keyboardPlayServiceProvider).playNote(60);
      },
      child: const Text('Play Note'),
    );
  }
}

@GenerateMocks([KeyboardPlayService])
void main() {
  testWidgets('To call playNote when click button',
      (WidgetTester tester) async {
    final mockAudioService = MockKeyboardPlayService();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          keyboardPlayServiceProvider.overrideWithValue(mockAudioService),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: TestButtonWidget(),
          ),
        ),
      ),
    );

    // Tap button
    final buttonFinder = find.text('Play Note');
    expect(buttonFinder, findsOneWidget); // verify if button exists
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle(); // wait to process complete

    // Verify mock method called once
    verify(mockAudioService.playNote(60)).called(1);

    // Verify to other method not called
    verifyNever(mockAudioService.playPhrase([], 0));
  });

}

// To execute test:
// flutter pub run build_runner build
// flutter test test/widget_test.dart