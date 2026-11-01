import 'package:flutter/material.dart';
import 'package:nike/ui/home/home.dart';

const int homeIndex = 0;
const int cartIndex = 1;
const int profileIndex = 2;

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeIndex;

  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _cartKey = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> _profileKey = GlobalKey<NavigatorState>();

  late final Map<int, GlobalKey<NavigatorState>> _navigatorKeys = {
    homeIndex: _homeKey,
    cartIndex: _cartKey,
    profileIndex: _profileKey,
  };

  late final Map<int, Widget> _screens = {
    homeIndex: HomeScreen(),
    cartIndex: const Center(child: Text('Cart')),
    profileIndex: const Center(child: Text('Profile')),
  };

  NavigatorState? get _currentNavigator =>
      _navigatorKeys[selectedScreenIndex]?.currentState;

  // Allow the app to exit only when all navigation stacks are at root
  // and there is no previous tab in history.
  bool get _canPop =>
      !(_currentNavigator?.canPop() ?? false) && _history.isEmpty;

  void _onTabSelected(int index) {
    if (index == selectedScreenIndex) {
      return;
    }

    setState(() {
      _history.add(selectedScreenIndex);
      selectedScreenIndex = index;
    });
  }

  void _onPopInvoked(bool didPop, Object? result) {
    if (didPop) return;

    final navigator = _currentNavigator;

    // First, pop the current tab's navigation stack.
    if (navigator != null && navigator.canPop()) {
      navigator.pop();
      return;
    }

    // Otherwise, return to the previously selected tab.
    if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.removeLast();
      });
    }
  }

  Widget _buildNavigator(int index) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => _screens[index]!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope<Object?>(
      canPop: _canPop,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        body: IndexedStack(
          index: selectedScreenIndex,
          children: [
            _buildNavigator(homeIndex),
            _buildNavigator(cartIndex),
            _buildNavigator(profileIndex),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedScreenIndex,
          onTap: _onTabSelected,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'خانه'),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'سبد خرید',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'پروفایل'),
          ],
        ),
      ),
    );
  }
}
