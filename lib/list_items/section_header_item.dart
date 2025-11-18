import 'list_item.dart';

class SectionHeaderItem extends ListItem {
  final String title;
  final String? actionText;
  
  SectionHeaderItem({required this.title, this.actionText});
}