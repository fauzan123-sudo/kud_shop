class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';

  // Admin
  static const String adminHome = '/admin';
  static const String adminOrder = '/admin/order';
  static const String adminProduct = '/admin/product';
  static const String adminProductAdd = '/admin/product/add';
  static const String adminProductEdit = '/admin/product/edit';
  static const String adminProfile = '/admin/profile';
  static const String adminCategory = '/admin/product/category';
  static const String adminProductDetail = '/admin/product/detail';
  static const String adminProfileEdit = '/admin/profile/edit';
  static const String adminChangePassword = '/admin/profile/change-password';

  // Customer
  static const String customerHome = '/customer';
  static const String customerProduct = '/customer/product';
  static const String customerCart = '/customer/cart';
  static const String customerCheckout = '/customer/checkout';
  static const String customerProfile = '/customer/profile';
  static const String customerProfileEdit = '/customer/profile/edit';
  static const String customerChangePassword = '/customer/profile/change-password';
  static const String customerProductDetail = '/customer/product/detail';
  static const String customerAddressList = '/customer/address';
  static const String customerOrderHistory = '/customer/order/history'; 
  static const String customerOrderDetail = '/customer/order/detail';
  static const String customerPaymentProof = '/customer/payment-proof';
}
