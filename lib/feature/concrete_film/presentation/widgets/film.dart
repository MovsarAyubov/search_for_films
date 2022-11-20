// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:search_for_films/core/components/texts/body_text.dart';
import 'package:search_for_films/core/functions/size_conging.dart';
import 'package:search_for_films/feature/concrete_film/presentation/cubit/film_cubit/film_cubit.dart';
import 'package:search_for_films/feature/concrete_film/presentation/cubit/film_cubit/film_state.dart';
import 'package:search_for_films/feature/concrete_film/presentation/widgets/peripheral_information.dart';
import 'package:search_for_films/core/widgets/poster.dart';

import 'main_information.dart';

class Film extends StatelessWidget {
  final FilmLoadedState state;
  final FilmCubit filmCubit;
  const Film({
    Key? key,
    required this.state,
    required this.filmCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Poster(imageUrl: state.filmEntity.poster),
            const SizedBox(
              width: 10,
            ),
            MainInformation(
              filmLoadedState: state,
            )
          ],
        ),
        SizedBox(height: SizeConfig(context, 15)()),
        PeripheralInformation(
          filmLoadedState: state,
        ),
        SizedBox(
          height: SizeConfig(context, 15)(),
        ),
        BodyText(
          AppLocalizations.of(context)!.plot,
        ),
        BodyText(
          state.filmEntity.plot,
        ),
      ],
    );
  }
}
