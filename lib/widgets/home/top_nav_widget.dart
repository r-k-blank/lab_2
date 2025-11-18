import 'package:flutter/material.dart';
import '../../../list_items/nav_bar_item.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';

class TopNavWidget extends StatelessWidget {
  final NavBarItem item;
  
  const TopNavWidget({super.key, required this.item});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${AppStrings.welcomePrefix} ${item.userName}',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
           const Icon(Icons.notifications, color: Color(0xff00796B), size: 24),
          
        ],
      ),
    );
  }
}