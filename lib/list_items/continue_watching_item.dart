import 'list_item.dart';

class ContinueWatchingItem extends ListItem {
  final String courseTitle;
  final String institute; // Am schimbat din 'university'
  final double rating;
  final double progress;
  final String imageUrl;
  
  ContinueWatchingItem({
    required this.courseTitle,
    required this.institute, // Am schimbat din 'university'
    required this.rating,
    required this.progress,
    required this.imageUrl,
  });
}