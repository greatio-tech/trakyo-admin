class ApiEndpoints {
  ApiEndpoints._();

  static String refreshToken = 'auth/refresh';
  static String login = 'admin/login';
  static String users = 'admin/users';
  static String qr = 'admin/qrcodes';
  static String order = 'admin/sales-orders';
  static String generateQr = 'admin/generate-codes';

  static String getRequests = 'support/tickets';
  static String closeRequest = 'support/ticket/close';
  static String getUserByUserId = 'admin/user/';
  static String getProducts = 'products';
  static String updateProduct = 'products/edit/';
}
