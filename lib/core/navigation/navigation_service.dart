import 'package:go_router/go_router.dart';

class NavigationService {
  static GoRouter? _router;

  static GoRouter get router => _router!;

  static set router(GoRouter value) {
    _router = value;
  }

  static void navigateTo(String route) {
    _router?.go(route);
  }

  static void pop() {
    _router?.pop();
  }
}
