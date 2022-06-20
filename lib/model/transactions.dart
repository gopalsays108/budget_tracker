class Transactions {
  final String _id;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  final String _title;
  final double _amount;
  final DateTime _dateTime;

  Transactions({
    required this.id,
    required this.title,
    required this.amount,
    required this.dateTime,
  });

  String get title => _title;

  set title(String value) => _value = value;

  double get amount => _amount;

  set amount(double value) {
    _amount = value;
  }

  DateTime get dateTime => _dateTime;

  set dateTime(DateTime value) {
    _dateTime = value;
  }
}
