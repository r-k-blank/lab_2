import 'list_item.dart';

class CourseCardItem extends ListItem {
  final String id;
  final String title;
  final String institute; // Am simplificat din 'subtitle' si 'institution'
  final double rating;
  final String imageUrl;
  final bool isSaved;
  
  CourseCardItem({
    required this.id,
    required this.title,
    required this.institute, // Am simplificat
    required this.rating,
    required this.imageUrl,
    this.isSaved = false,
  });
  CourseCardItem copyWith({bool? isSaved}) {
    return CourseCardItem(
      id: this.id,
      title: this.title,
      institute: this.institute,
      rating: this.rating,
      imageUrl: this.imageUrl,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}