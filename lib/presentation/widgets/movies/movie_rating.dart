import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

class MovieRating extends StatelessWidget {
  final double voteAverage;

  const MovieRating({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Icon(Icons.star_rounded, color: colors.primary),
          const SizedBox(width: 3),
          Text(HumanFormats.number(voteAverage),
              style: textStyles.bodyMedium?.copyWith(color: colors.primary)),
        ],
      ),
    );
  }
}
