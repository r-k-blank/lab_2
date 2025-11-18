import 'package:flutter/material.dart';
import '../../list_items/courses_section_item.dart';
import 'course_card_widget.dart';

class CoursesHorizontalListWidget extends StatelessWidget {
  final CoursesSectionItem item;
  
  const CoursesHorizontalListWidget({super.key, required this.item});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: item.courses.length,
        itemBuilder: (context, index) {
          return CourseCardWidget(item: item.courses[index]);
        },
      ),
    );
  }
}