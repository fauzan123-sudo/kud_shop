import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kud_shop/component/widgets/alert/exit_confirmation_dialog.dart';
import 'package:kud_shop/core/injection/injection.dart';
import 'package:kud_shop/src/customer/cart/presentation/bloc/cart_bloc.dart';
import 'package:kud_shop/src/customer/cart/presentation/bloc/cart_event.dart';

class CustomerShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomerShell({super.key, required this.navigationShell});

  static const int _homeTabIndex = 0;
  static const int _cartTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CartBloc>()..add(const CartLoad()),
      child: Builder(
        builder: (context) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;

              final currentIndex = navigationShell.currentIndex;

              if (currentIndex != _homeTabIndex) {
                navigationShell.goBranch(_homeTabIndex, initialLocation: true);
                return;
              }

              if (context.mounted) {
                final shouldExit = await ExitConfirmationDialog.show(context);
                if (shouldExit == true) {
                  SystemNavigator.pop(); 
                }
              }
            },
            child: Scaffold(
              body: navigationShell,
              bottomNavigationBar: NavigationBar(
                selectedIndex: navigationShell.currentIndex,
                onDestinationSelected: (index) => _onTap(context, index),
                backgroundColor: Colors.white,
                indicatorColor: Colors.blue.shade100,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home),
                    label: 'Beranda',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.shopping_cart_outlined),
                    selectedIcon: Icon(Icons.shopping_cart),
                    label: 'Keranjang',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    selectedIcon: Icon(Icons.person),
                    label: 'Profil',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    if (index == _cartTabIndex) {
      context.read<CartBloc>().add(const CartLoad());
    }

    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
