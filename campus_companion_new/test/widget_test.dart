import 'package:flutter_test/flutter_test.dart';
import 'package:campus_companion/main.dart';

void main() {
  testWidgets('Campus Companion app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const CampusCompanionApp());

    expect(find.text('Campus Companion'), findsOneWidget);
  });
}