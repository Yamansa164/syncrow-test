import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test/featuers/text_analyzer/data/datasource/text_analyzer_datasource.dart';
import 'package:test/featuers/text_analyzer/data/repository/text_analyzer_repository_impl.dart';
import 'package:test/featuers/text_analyzer/domain/usecase/analyze_text_usecase.dart';
import 'package:test/featuers/text_analyzer/presentation/bloc/text_analyzer_bloc.dart';
import 'package:test/featuers/text_analyzer/presentation/pages/text_analyzer_page.dart';

void main() {
  testWidgets('typing shows the stats computed in the background isolate', (
    tester,
  ) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(430, 933),
        builder: (context, child) => MaterialApp(
          home: BlocProvider(
            create: (context) => TextAnalyzerBloc(
              analyzeTextUsecase: AnalyzeTextUsecase(
                TextAnalyzerRepositoryImp(TextAnalyzerDataResource()),
              ),
            ),
            child: const TextAnalyzerPage(),
          ),
        ),
      ),
    );
    expect(find.text('No words yet.'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'to be or not to be');
    await tester.pump();
    expect(find.text('Analyzing…'), findsOneWidget);

    // Let the debounce fire, then give the real isolate real time to reply.
    await tester.pump(const Duration(milliseconds: 400));
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 500)),
    );
    await tester.pump();

    expect(find.text('Analyzing…'), findsNothing);
    expect(find.text('6'), findsOneWidget); // words
    expect(find.text('13'), findsOneWidget); // letters
    expect(find.text('5'), findsOneWidget); // whitespace
    expect(find.text('×2'), findsNWidgets(2)); // "be" and "to"
  });
}
