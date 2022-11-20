// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/components/texts/key_value_text.dart';
import '../cubit/film_cubit/film_state.dart';

class PeripheralInformation extends StatelessWidget {
  final FilmLoadedState filmLoadedState;
  const PeripheralInformation({
    Key? key,
    required this.filmLoadedState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = filmLoadedState.filmEntity;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KeyValueText(
          AppLocalizations.of(context)!.director,
          state.director,
          fontSize: 14,
        ),
        const SizedBox(
          height: 5,
        ),
        KeyValueText(
          AppLocalizations.of(context)!.writer,
          state.writer,
          fontSize: 14,
        ),
        const SizedBox(
          height: 5,
        ),
        KeyValueText(
          AppLocalizations.of(context)!.released,
          state.released,
          fontSize: 14,
        ),
        const SizedBox(
          height: 5,
        ),
        KeyValueText(
          AppLocalizations.of(context)!.awards,
          state.awards,
          fontSize: 14,
        ),
      ],
    );
  }
}
