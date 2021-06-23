import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pokemon_tcg/models/pokemon.dart';

class PokemonDetails extends StatefulWidget {
  final Pokemon pokemon;

  PokemonDetails({required this.pokemon});

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails>
    with AfterLayoutMixin<PokemonDetails> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pokemon.name!)),
      body: _contentDependingInState(),
    );
  }

  Widget _contentDependingInState() {
    if (_isLoaded) {
      return Container(child: Center(child: CircularProgressIndicator()));
    } else {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Hero(
                  tag: widget.pokemon.id!,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    imageUrl: widget.pokemon.smallImage!,
                  ),
                ),
              ),
              height: constraints.maxHeight,
            ),
            Divider(
              height: 2,
              color: Colors.black,
            ),
            Text(widget.pokemon.name!,
                style: Theme.of(context).textTheme.subtitle1)
          ],
        );
      });
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
