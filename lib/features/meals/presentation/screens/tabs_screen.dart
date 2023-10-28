import 'package:flutter/material.dart';
import 'package:meals_app/config/routes/routes.dart';

class TabsScreen extends StatelessWidget {
  final String? title;
  final Widget activePage;
  const TabsScreen({
    super.key,
    this.title,
    required this.activePage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(title!),
            )
          : null,
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          _selectPage(index, context);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void _selectPage(int index, BuildContext ctx) {
    if (index == 0) {
      Navigator.pushNamed(ctx, Routes.categories);
    }
    if (index == 1) {
      Navigator.pushNamed(ctx, Routes.favorites);
    }
  }
}
