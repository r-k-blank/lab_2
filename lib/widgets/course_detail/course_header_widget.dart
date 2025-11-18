import 'package:flutter/material.dart';
import '../../models/course_detail.dart';
import '../../resources/app_colors.dart';

class CourseHeaderWidget extends StatelessWidget {
  final CourseDetail course;
  
  const CourseHeaderWidget({super.key, required this.course});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                course.institute,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
              Text(
                '${course.price}\$',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star, color: AppColors.ratingYellow, size: 18),
              const SizedBox(width: 4),
              Text(
                '${course.rating}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}