import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';

class EnrollButtonWidget extends StatelessWidget {
  const EnrollButtonWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Enrollment feature coming soon!'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                AppStrings.enrollNow,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            AppStrings.startFreeTrial,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textLight,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}