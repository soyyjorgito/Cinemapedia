import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkmode;
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
                    Text('Cinemapedia', style: titleStyle),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    IconButton(
                      icon: !isDarkMode
                          ? const Icon(Icons.dark_mode_outlined)
                          : const Icon(Icons.light_mode_outlined),
                      onPressed: () {
                        ref
                            .read(themeNotifierProvider.notifier)
                            .toggleDarkmode();
                      },
                    ),
                  ],
                ))));
  }
}
