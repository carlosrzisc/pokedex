import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/view/app.dart';
import 'package:pokedex/presentation/screens/home/home.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
