import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_2/controllers/home_controller.dart';
import '../../../list_items/course_card_item.dart';
import '../../../resources/app_colors.dart';
import '../../../pages/course_detail_page.dart';
import '../../../controllers/course_detail_controller.dart';

class CourseCardWidget extends StatelessWidget {
  final CourseCardItem item;
  
  const CourseCardWidget({super.key, required this.item});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.lazyPut(() => CourseDetailController());
        final controller = Get.find<CourseDetailController>();
        controller.loadCourseDetail(item.id);
        Get.to(() => CourseDetailPage());
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 16, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    item.imageUrl,
                    width: 180,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 180,
                        height: 120,
                        color: AppColors.chipBackground,
                        child: Icon(Icons.image, color: AppColors.textLight),
                      );
                    },
                  ),
                ),
                
                // ### START MODIFICARE ###
                // Am înlăturat condiția `if` și am lăsat Positioned să fie mereu construit.
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      Get.find<HomeController>().toggleSavedStatus(item.id);
                    },
                    // Folosim un container pentru a mări zona de apăsare și a-i da un fundal
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9), // Fundal alb semi-transparent
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        // Schimbăm iconița în funcție de starea 'isSaved'
                        item.isSaved ? Icons.bookmark : Icons.bookmark_border,
                        // Schimbăm culoarea în funcție de starea 'isSaved'
                        color: item.isSaved ? AppColors.primary : AppColors.textMedium,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                // ### END MODIFICARE ###

              ],
            ),
            
            Padding(
              //... (Restul fișierului rămâne neschimbat)
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.institute,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.primaryDark, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '${item.rating}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}