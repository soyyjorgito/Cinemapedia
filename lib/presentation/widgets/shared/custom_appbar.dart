import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  final String appBarTitle;
  const CustomAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SafeArea(
        bottom: false,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.movie_outlined, color: colors.primary),
                    const SizedBox(width: 5),
                    Text(appBarTitle, style: titleStyle),
                    const Spacer(),
                    IconButton(
                        onPressed: () async {
                          final searchQuery = ref.read(searchQueryProvider);

                          showSearch<Movie?>(
                            query: searchQuery,
                            context: context,
                            delegate: SearchMovieDelegate(
                                searchMovies: ref
                                    .read(searchedMoviesProvider.notifier)
                                    .searchMoviesByQuery),
                          ).then((movie) {
                            if (movie != null) {
                              context.push('/home/0/movie/${movie.id}');
                            }
                          });
                        },
                        icon: const Icon(Icons.search)),
                  ],
                ))));
  }
}
