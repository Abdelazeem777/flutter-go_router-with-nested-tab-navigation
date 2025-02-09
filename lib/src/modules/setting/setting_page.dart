import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/src/router/app_router.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key, this.label, this.child});

  final String? label;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Setting',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ElevatedButton(
              onPressed: () => context.go('/setting/details'),
              child: const Text('Go to setting/details'),
            ),
          ],
        ),
      ),
    );
  }
}
