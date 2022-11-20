// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../functions/size_conging.dart';

class Poster extends StatelessWidget {
  final String imageUrl;
  const Poster({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig(context, 200)(),
      width: SizeConfig(context, 140)(),
      child: Image.network(imageUrl),
    );
  }
}
