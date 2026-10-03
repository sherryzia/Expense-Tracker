import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/extensions/context_extensions.dart';

/// Floating light-green bottom navigation bar.
///
/// [activeIndex] marks the highlighted icon, or use a negative value to show
/// no active icon.
class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.activeIndex = 0});

  final int activeIndex;

  static const List<IconData> _icons = <IconData>[
    Icons.home_rounded,
    Icons.bar_chart_rounded,
    Icons.swap_horiz_rounded,
    Icons.layers_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        16,
        8,
        16,
        MediaQuery.paddingOf(context).bottom + 12,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 24,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(_icons.length, (int index) {
          return _NavItem(
            icon: _icons[index],
            isActive: index == activeIndex,
          );
        }),
      ),
    );
  }
}

/// Single bottom nav icon; the active one sits in a highlighted capsule.
class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.isActive});

  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive
          ? null
          : () => context.showAppSnackBar(AppStrings.authPlaceholder),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.all(isActive ? 10 : 12),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColors.darkGreen, size: 22),
      ),
    );
  }
}