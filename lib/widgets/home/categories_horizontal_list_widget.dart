import 'package:flutter/material.dart';
import '../../list_items/categories_list_item.dart';
import '../../resources/app_colors.dart';

class CategoriesHorizontalListWidget extends StatelessWidget {
  final CategoriesListItem item;
  
  const CategoriesHorizontalListWidget({super.key, required this.item});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.categories.length,
        itemBuilder: (context, index) {
          final category = item.categories[index];
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: Chip(
              label: Text(
                category.categoryName,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
              backgroundColor: AppColors.chipBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: AppColors.primary),
              ),
            ),
          );
        },
      ),
    );
  }
}