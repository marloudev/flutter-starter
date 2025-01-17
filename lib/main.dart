import 'package:empireone_mart/app/login/login.dart';
import 'package:empireone_mart/app/portal/home/bloc/home_bloc.dart';
import 'package:empireone_mart/app/portal/layout.dart';
import 'package:empireone_mart/repository/module_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => HomeBloc(
            ModuleRepository(),
          ),
          child: LoginViewPage(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'portal',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => HomeBloc(
                ModuleRepository(),
              )..add(
                  fetchModules(),
                ),
              child: PortalLayout(),
            );
          },
        ),
      ],
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);
  static final _lightTheme = ThemeData.light();
  static final _darkTheme = ThemeData.dark();

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
