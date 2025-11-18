import 'package:flutter/material.dart';
import '../../models/course_detail.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';

class CourseInfoRowWidget extends StatelessWidget {
  final CourseDetail course;
  
  const CourseInfoRowWidget({super.key, required this.course});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.courseDetails,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            course.description,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textMedium,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.readMore,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),
          
          _buildInfoRow(
            Icons.play_circle_outline,
            AppStrings.lectures,
            '${course.lecturesCount}+ Lectures',
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            Icons.access_time,
            AppStrings.learningTime,
            course.duration,
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            Icons.workspace_premium,
            AppStrings.certification,
            course.certificationType,
          ),
        ],
      ),
    );
  }
  
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}