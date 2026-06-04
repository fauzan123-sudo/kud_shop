class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const String login   = '/auth/login';
  static const String refresh = '/auth/refresh';
  static const String me      = '/auth/me';

  // Users
  static const String users   = '/users';
  static String userById(int id) => '/users/$id';
}