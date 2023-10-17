enum OrderStatus {
  pending('PENDING'),
  confirmed('CONFIRMED'),
  completed('COMPLETED'),
  canceled('CANCELED');

  final String value;
  const OrderStatus(this.value);
}
