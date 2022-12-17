import 'package:flutter/material.dart';

/// Controls the states of the elevated button
class ElevatedButtonWrapper extends StatelessWidget {
  const ElevatedButtonWrapper({
    super.key,
    this.loading = false,
    required this.onPressed,
    required this.child,
    this.statesController,
  });

  final VoidCallback onPressed;
  final Widget child;
  final bool loading;
  final MaterialStatesController? statesController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          statesController: statesController,
          child: child,
        ),
        if (loading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
