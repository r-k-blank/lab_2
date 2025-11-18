import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../list_items/categories_list_item.dart';
import '../list_items/continue_watching_item.dart';
import '../list_items/courses_section_item.dart';
import '../list_items/list_item.dart';
import '../list_items/nav_bar_item.dart';
import '../list_items/search_bar_item.dart';
import '../list_items/section_header_item.dart';
import '../resources/app_colors.dart';
import '../widgets/home/categories_horizontal_list_widget.dart';
import '../widgets/home/continue_watching_widget.dart';
import '../widgets/home/courses_horizontal_list_widget.dart';
import '../widgets/home/search_bar_widget.dart';
import '../widgets/home/section_header_widget.dart';
import '../widgets/home/top_nav_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  Widget _buildListItem(ListItem item) {
    if (item is NavBarItem) {
      return TopNavWidget(item: item);
    } else if (item is SearchBarItem) {
      return SearchBarWidget(item: item);
    } else if (item is SectionHeaderItem) {
      return SectionHeaderWidget(item: item);
    } else if (item is ContinueWatchingItem) {
      return ContinueWatchingWidget(item: item);
    } else if (item is CategoriesListItem) {
      return CategoriesHorizontalListWidget(item: item);
    } else if (item is CoursesSectionItem) {
      return CoursesHorizontalListWidget(item: item);
    } else {
      return const SizedBox.shrink(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.items.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return _buildListItem(item);
              },
            );
          }),
        ),
      ),
    );
  }
}