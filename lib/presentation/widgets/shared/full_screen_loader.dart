import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando peliculas',
      'Comprando maizpira',
      'Llamando a mi novia para ir al cine',
      'Cargando pelis populares',
      'Ya falta poco...',
      'Un momento...'
    ];

    return Stream.periodic(const Duration(seconds: 3), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        CircularProgressIndicator(strokeWidth: 2, color: colors.primary),
        const SizedBox(height: 10),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando');
            return Text(snapshot.data!);
          },
        )
      ],
    ));
  }
}
