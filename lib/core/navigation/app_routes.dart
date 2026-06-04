class AppRoutes {
  AppRoutes._();
 
  static const String splash   = '/';
  static const String login    = '/login';
  static const String register = '/register';
 
  // Admin
  static const String adminHome    = '/admin';
  static const String adminOrder   = '/admin/order';
  static const String adminProduct = '/admin/product';
  static const String adminProfile = '/admin/profile';
 
  // Customer
  static const String customerHome     = '/customer';
  static const String customerProduct  = '/customer/product';
  static const String customerCart     = '/customer/cart';
  static const String customerCheckout = '/customer/checkout';
  static const String customerProfile  = '/customer/profile';
}