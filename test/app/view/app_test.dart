import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_timer/app/app.dart';
import 'package:pomodoro_timer/timer/view/timer_page.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const AppPage());
      expect(find.byType(TimerPage), findsOneWidget);
    });
  });
}
