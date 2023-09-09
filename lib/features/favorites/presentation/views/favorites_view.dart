import 'package:flutter/material.dart';
import 'package:time_luxe/features/favorites/presentation/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritesViewBody(),
    );
  }
}
