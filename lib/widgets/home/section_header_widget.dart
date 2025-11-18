import 'package:flutter/material.dart';
import '../../../list_items/section_header_item.dart';
import '../../../resources/app_colors.dart';

class SectionHeaderWidget extends StatelessWidget {
  final SectionHeaderItem item;
  
  const SectionHeaderWidget({super.key, required this.item});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          if (item.actionText != null)
            TextButton(
              onPressed: () {
                // Implementează logica de navigare "See All"
              },
              child: Text(
                item.actionText!,
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}