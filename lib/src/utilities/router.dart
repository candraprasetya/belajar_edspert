part of 'utilities.dart';

final GoRouter router = GoRouter(initialLocation: '/register', routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            return const DetailScreen();
          },
        ),
      ]),
  GoRoute(
    path: '/register',
    builder: (context, state) {
      return const RegisterScreen();
    },
  )
]);
