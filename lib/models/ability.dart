class Ability {
  final String name;
  final String text;
  final String type;

  Ability(this.name, this.text, this.type);

  Ability.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        text = json['text'],
        type = json['type'];

  @override
  String toString() => 'name: $name, text: $text, type: $type';
}
