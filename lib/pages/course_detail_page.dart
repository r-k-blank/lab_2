import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/course_detail_controller.dart';
import '../resources/app_colors.dart';
import '../widgets/course_detail/course_header_widget.dart';
import '../widgets/course_detail/course_info_row_widget.dart';
import '../widgets/course_detail/enroll_button_widget.dart';
import '../widgets/course_detail/skills_widget.dart';
import '../widgets/course_detail/video_player_widget.dart';

class CourseDetailPage extends StatelessWidget {
  CourseDetailPage({super.key});

  final CourseDetailController controller = Get.find<CourseDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      body: Obx(() {
        final course = controller.course.value;
        
        if (course.id.isEmpty) {
          return Center(child: CircularProgressIndicator(color: AppColors.primary));
        }
        
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VideoPlayerWidget(
  videoUrl: course.videoUrl,
  isSaved: course.isSaved, // îi dăm starea curentă
  onBookmarkTap: () {
    // îi dăm funcția de toggle din controller
    controller.toggleSavedStatus();
  },
),
                    CourseHeaderWidget(course: course),
                    CourseInfoRowWidget(course: course),
                    SkillsWidget(skills: course.skills),
                  ],
                ),
              ),
            ),
            EnrollButtonWidget(),
          ],
        );
      }),
    );
  }
}