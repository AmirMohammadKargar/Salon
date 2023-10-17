enum ReservedHour {
  eight('EIGHT', '08:00'),
  ten('TEN', '10:00'),
  twelewe('TWELEWE', '12:00'),
  fourteen('FOURTEEN', '14:00'),
  sixteen('SIXTEEN', '16:00'),
  eighteen('EIGHTEEN', '18:00');

  final String value;
  final String name;
  const ReservedHour(this.value, this.name);

  static String getName(String name) {
    switch (name) {
      case 'EIGHT':
        return '08:00';
      case 'TEN':
        return '10:00';
      case 'TWELEWE':
        return '12:00';
      case 'FOURTEEN':
        return '14:00';
      case 'SIXTEEN':
        return '16:00';
      case 'EIGHTEEN':
        return '18:00';
      default:
        return '08:00';
    }
  }
}
