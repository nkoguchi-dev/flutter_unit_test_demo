import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_demo/presentation/screen_return_value/screen_return_value_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../create_widget_helper.dart';
import 'screen_return_value_screen_test.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigatorObserver>(onMissingStub: OnMissingStub.returnDefault)
  ],
)
void main() {
  group('ScreenReturnValueScreenクラスのテスト', () {
    late MaterialApp testApp;
    late MockNavigatorObserver mockObserver;
    late String returnValue;
    setUp(() {
      returnValue = 'Screen Return Value Test';
      var screen = ScreenReturnValueScreen(
          key: const ValueKey('TestScreen'), returnValue: returnValue);
      mockObserver = MockNavigatorObserver();
      testApp = CreateWidgetHelper.createTestApp(
        screen,
        navigatorObservers: [mockObserver],
      );
    });
    group('実行ボタンをTapする', () {
      Future<void> startAndTapSubmitButton(tester) async {
        await tester.pumpWidget(testApp);
        await tester.pump();
        await tester.tap(find.byKey(const ValueKey('SubmitButton')));
        await tester.pumpAndSettle();
      }

      testWidgets('対象Screenが終了している', (tester) async {
        await startAndTapSubmitButton(tester);
        expect(find.byKey(const ValueKey('TestScreen')), findsNothing);
      });
      testWidgets('「Screen Return Value Test」の文字列を返す', (tester) async {
        await startAndTapSubmitButton(tester);
        var captured =
            verify(mockObserver.didPop(captureAny, captureAny)).captured;
        Route<dynamic> route = captured.elementAt(0);
        expect(await route.popped, returnValue);
      });
    });
  });
}
