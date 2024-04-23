// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:keepyoga/screens/home_screen.dart';

class CustomNavigationBar extends StatelessWidget {
  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Color backgroundColor;

  const CustomNavigationBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: destinations.asMap().entries.map((entry) {
          final index = entry.key;
          final destination = entry.value;
          final isSelected = index == selectedIndex;
          final icon = isSelected ? destination.selectedIcon : destination.icon;
          final borderColor =
              isSelected ? const Color(0xFF6B4EFF) : Colors.transparent;

          return GestureDetector(
            onTap: () {
              onDestinationSelected(index);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 2.0, color: borderColor),
                ),
              ),
              child: icon,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final int selectedIndex;
  const MainScreen({Key? key, required this.selectedIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomeScreen(),
        const HomeScreen(),
        const HomeScreen(),
      ][_selectedIndex],
      bottomNavigationBar: CustomNavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.circle_outlined),
            selectedIcon: Icon(Icons.circle_outlined),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite_outline),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(Icons.circle_outlined),
            selectedIcon: Icon(Icons.circle_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
