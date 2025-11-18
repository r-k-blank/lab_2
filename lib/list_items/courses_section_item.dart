import 'course_card_item.dart';
import 'list_item.dart';

class CoursesSectionItem extends ListItem {
  final List<CourseCardItem> courses;
  
  CoursesSectionItem({required this.courses});
}