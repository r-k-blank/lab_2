import 'package:flutter/material.dart';
import '../../../list_items/search_bar_item.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';

class SearchBarWidget extends StatelessWidget {
  final SearchBarItem item;
  
  const SearchBarWidget({super.key, required this.item});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: AppStrings.searchPlaceholder,
          hintStyle: TextStyle(color: AppColors.textLight),
          prefixIcon: null,
          suffixIcon: Icon(Icons.search, color: AppColors.textLight),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}