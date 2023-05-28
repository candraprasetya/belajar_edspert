part of 'utilities.dart';

final GoRouter router = GoRouter(routes: [
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
]);
