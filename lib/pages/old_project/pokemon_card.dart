import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pokemon_tcg/models/pokemon.dart';
import 'package:pokemon_tcg/pages/old_project/pokemon_datails.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  PokemonCard({required this.pokemon});

  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard>
    with AfterLayoutMixin<PokemonCard> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 1, child: _contentDependingInState());
  }

  Widget _contentDependingInState() {
    if (_isLoaded) {
      return Center(child: CircularProgressIndicator());
    } else {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PokemonDetails(pokemon: widget.pokemon)));
        },
        child: Hero(
          tag: widget.pokemon.id!,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            imageUrl: widget.pokemon.smallImage!,
          ),
        ),
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    setState(() {
      _isLoaded = true;
    });

    await DefaultCacheManager().downloadFile(widget.pokemon.smallImage!);

    setState(() {
      _isLoaded = false;
    });
  }
}
