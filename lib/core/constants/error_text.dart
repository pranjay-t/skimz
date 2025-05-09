import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorText extends ConsumerWidget {
  final String error;
  const ErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        error,
        style: TextStyle(
          fontFamily: 'carter',
          fontSize: 20,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
