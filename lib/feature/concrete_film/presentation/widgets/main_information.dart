// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:search_for_films/core/functions/size_conging.dart';
import '../../../../core/components/texts/body_text.dart';
import '../../../../core/components/texts/key_value_text.dart';
import '../cubit/film_cubit/film_state.dart';

class MainInformation extends StatelessWidget {
  final FilmLoadedState filmLoadedState;
  const MainInformation({
    Key? key,
    required this.filmLoadedState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = filmLoadedState.filmEntity;
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KeyValueText(AppLocalizations.of(context)!.title, state.title,
              fontSize: 16),
          SizedBox(height: SizeConfig(context, 10)()),
          KeyValueText(
            AppLocalizations.of(context)!.year,
            state.year,
            fontSize: 16,
          ),
          SizedBox(height: SizeConfig(context, 10)()),
          KeyValueText(AppLocalizations.of(context)!.country, state.country,
              fontSize: 16),
          SizedBox(height: SizeConfig(context, 10)()),
          KeyValueText(AppLocalizations.of(context)!.rating, state.imbdRating,
              fontSize: 16),
          SizedBox(height: SizeConfig(context, 10)()),
          BodyText(
            state.runtime,
            fontSize: 16,
            color: Colors.white,
          ),
          SizedBox(height: SizeConfig(context, 10)()),
          KeyValueText(AppLocalizations.of(context)!.genre, state.genre,
              fontSize: 16),
        ],
      ),
    );
  }
}
