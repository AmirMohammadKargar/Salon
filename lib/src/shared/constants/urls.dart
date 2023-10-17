class Urls {
  static const baseUrl = 'http://cs5.thorhammer.space/';

  static const register = 'auth/register/user';
  static const login = 'auth/login';
  static const user = 'auth/profile';
  static const pathUser = 'auth/profile';

  static const upload = 'user/upload-file';

  static const salons = 'salon/get-all-salons';
  static const salon = 'salon/get-salon-by-id/{id}';

  static const services = 'service/get-all-services';
  static const orders = 'order/mine/user';

  static const placeOrder = 'order/place-order';
}
