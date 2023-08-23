import 'package:flutter/material.dart';

import '../../router/app_router.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, this.label, this.child});

  final String? label;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child ??
                Text(
                  label ?? '',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _resetAll(),
              child: const Text('Reset All'),
            ),
          ],
        ),
      ),
    );
  }

  void _resetAll() {
    for (var branch in statefulShellBranches) {
      branch.navigatorKey.currentState?.popUntil((route) => route.isFirst);
    }
  }
}
