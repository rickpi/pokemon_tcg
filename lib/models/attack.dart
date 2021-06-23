class Attack {
  final String name;
  final String damage;
  final String text;
  final List<String> cost;

  Attack(this.name, this.cost, this.damage, this.text);

  Attack.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        damage = json['damage'],
        text = json['text'],
        cost = [for (var el in json['cost']) el];

  @override
  String toString() => 'name: $name, text: $text, damage: $damage, cost: $cost';
}
