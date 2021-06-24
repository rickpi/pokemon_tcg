import 'package:pokemon_tcg/models/ability.dart';
import 'package:pokemon_tcg/models/resistance.dart';

import 'attack.dart';

class Pokemon {
  final String? id;
  final String? name;
  final String? hp;
  final String? evolvesFrom;
  final List<String> evolvesTo;
  final List<String> types;
  final List<String> retreatCost;
  final String? number;
  final String? setID;
  final String? rarity;
  final String? smallImage;
  final String? largeImage;
  final List<Ability> abilities;
  final List<Attack> attacks;
  final List<Resistance> weaknesses;
  final List<Resistance> resistances;

  Pokemon(
    this.id,
    this.name,
    this.hp,
    this.types,
    this.evolvesFrom,
    this.evolvesTo,
    this.retreatCost,
    this.number,
    this.setID,
    this.rarity,
    this.smallImage,
    this.largeImage,
    this.abilities,
    this.attacks,
    this.weaknesses,
    this.resistances,
  );

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        hp = json['hp'],
        types =
            json['types'] != null ? [for (var type in json['types']) type] : [],
        evolvesFrom = json['evolvesFrom'],
        evolvesTo = json['evolvesTo'] != null
            ? [for (var to in json['evolvesTo']) to]
            : [],
        retreatCost = json['retreatCost'] != null
            ? [for (var cost in json['retreatCost']) cost]
            : [],
        number = json['number'],
        setID = json['set']['id'],
        rarity = json['rarity'],
        smallImage = json['images']['small'],
        largeImage = json['images']['large'],
        abilities = json['abilities'] != null
            ? [for (var ability in json['abilities']) Ability.fromJson(ability)]
            : [],
        attacks = json['attacks'] != null
            ? [for (var attack in json['attacks']) Attack.fromJson(attack)]
            : [],
        weaknesses = json['weaknesses'] != null
            ? [
                for (var weakness in json['weaknesses'])
                  Resistance.fromJson(weakness)
              ]
            : [],
        resistances = json['resistances'] != null
            ? [
                for (var resistance in json['resistances'])
                  Resistance.fromJson(resistance)
              ]
            : [];

  static bool isPokemonInList(List<Pokemon> list, Pokemon pokemon) {
    try {
      list.firstWhere((item) => item.id == pokemon.id);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  String toString() =>
      'id: $id\n' +
      'name: $name\n' +
      'hp: $hp\n' +
      'evolvesFrom: $evolvesFrom\n' +
      'evolvesTo: $evolvesTo\n' +
      'retreatCost: $retreatCost\n' +
      'number: $number\n' +
      'setID: $setID\n' +
      'rarity: $rarity\n' +
      'smallImage: $smallImage\n' +
      'largeImage: $largeImage\n' +
      'attacks: $attacks\n' +
      'abilities: $abilities\n' +
      'weaknesses: $weaknesses\n' +
      'resistances: $resistances\n';
}
