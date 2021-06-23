class Resistance {
  final String type;
  final String value;

  Resistance(this.type, this.value);

  Resistance.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        value = json['value'];

  @override
  String toString() => 'type: $type, value: $value';
}
