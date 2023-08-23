import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key, this.label, this.child});

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
              'Shop',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ElevatedButton(
              onPressed: () => context.go('/shop/details'),
              child: const Text('Go to shop/details'),
            ),
          ],
        ),
      ),
    );
  }
}
