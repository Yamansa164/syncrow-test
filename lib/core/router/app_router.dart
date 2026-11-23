import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/dependency_injection/injection_container.dart';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:test/featuers/text_analyzer/presentation/bloc/text_analyzer_bloc.dart';
import 'package:test/featuers/text_analyzer/presentation/pages/text_analyzer_page.dart';

class AppRouter {
  static final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static final GoRouter router = GoRouter(
    observers: [routeObserver],

    initialLocation: "/textAnalyzerPage",
    navigatorKey: getIt<GlobalKey<NavigatorState>>(),
    debugLogDiagnostics: true,
    routes: [
      
      GoRoute(
        path: "/textAnalyzerPage",
        name: "/textAnalyzerPage",
        builder: (BuildContext context, GoRouterState state) {
          // BlocProvider closes the bloc with the page, which also kills any
          // analysis isolate that is still running.
          return BlocProvider(
            create: (context) => getIt.get<TextAnalyzerBloc>(),
            child: const TextAnalyzerPage(),
          );
        },
      ),
    ],
  );
}
