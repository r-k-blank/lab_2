// lib/controllers/home_controller.dart

import 'package:get/get.dart';
import '../list_items/list_item.dart';
import '../list_items/nav_bar_item.dart';
import '../list_items/search_bar_item.dart';
import '../list_items/section_header_item.dart';
import '../list_items/continue_watching_item.dart';
import '../list_items/categories_list_item.dart';
import '../list_items/category_chip_item.dart';
import '../list_items/courses_section_item.dart';
import '../list_items/course_card_item.dart';
import '../resources/app_strings.dart';
// import '../data/app_data.dart'; // NU MAI AVEM NEVOIE DE ACEST IMPORT
import '../services/data_service.dart'; // IMPORTĂM SERVICIUL

class HomeController extends GetxController {
  // Obținem instanța serviciului de date din GetX
  final DataService dataService = Get.find();
  RxList<ListItem> items = RxList();
  
  @override
  void onInit() {
    super.onInit();
    loadHomeData();
  }
  
  void loadHomeData() {
    items.clear();
    
    // Extragem datele din serviciu, nu din variabila locală
    final home = dataService.homeData;

    // User & Search
    final user = home['user'] as Map<String, dynamic>;
    items.add(NavBarItem(userName: user['name'] as String));
    items.add(SearchBarItem());
    
    // Continue Watching
    items.add(SectionHeaderItem(title: AppStrings.continueWatching));
    final continueWatchingList = home['continueWatching'] as List;
    for (var courseData in continueWatchingList) {
      final course = courseData as Map<String, dynamic>;
      items.add(ContinueWatchingItem(
        courseTitle: course['title'],
        institute: course['institute'],
        rating: (course['rating'] as num).toDouble(),
        progress: (course['progress'] as num).toDouble() / 100.0,
        imageUrl: course['image'],
      ));
    }
    
    // Categories
    items.add(SectionHeaderItem(
      title: AppStrings.categories,
      actionText: AppStrings.seeAll,
    ));
    final categoriesList = home['categories'] as List;
    items.add(CategoriesListItem(
      categories: categoriesList.map((catData) {
        final category = catData as Map<String, dynamic>;
        return CategoryChipItem(categoryName: category['name']);
      }).toList(),
    ));
    
    // Suggestions for You
    items.add(SectionHeaderItem(
      title: AppStrings.suggestionsForYou,
      actionText: AppStrings.seeAll,
    ));
    final suggestionsList = home['suggestions'] as List;
    items.add(CoursesSectionItem(
      courses: suggestionsList.map((courseData) {
        final course = courseData as Map<String, dynamic>;
        return CourseCardItem(
          id: course['id'],
          title: course['title'],
          institute: course['institute'],
          rating: (course['rating'] as num).toDouble(),
          imageUrl: course['image'],
          isSaved: course['isSaved'] ?? false, // Folosim isSaved din JSON
        );
      }).toList(),
    ));
    
    // Top Courses
    items.add(SectionHeaderItem(
      title: AppStrings.topCourses,
      actionText: AppStrings.seeAll,
    ));
    final topCoursesList = home['topCourses'] as List;
    items.add(CoursesSectionItem(
      courses: topCoursesList.map((courseData) {
        final course = courseData as Map<String, dynamic>;
        return CourseCardItem(
          id: course['id'],
          title: course['title'],
          institute: course['institute'],
          rating: (course['rating'] as num).toDouble(),
          imageUrl: course['image'],
          isSaved: course['isSaved'] ?? false, // Folosim isSaved din JSON
        );
      }).toList(),
    ));
  }

  // Funcția de toggle rămâne la fel
  void toggleSavedStatus(String courseId) {
    for (int i = 0; i < items.length; i++) {
      if (items[i] is CoursesSectionItem) {
        final section = items[i] as CoursesSectionItem;
        
        for (int j = 0; j < section.courses.length; j++) {
          if (section.courses[j].id == courseId) {
            final oldCourse = section.courses[j];
            final newCourse = oldCourse.copyWith(isSaved: !oldCourse.isSaved);
            section.courses[j] = newCourse;
            items.refresh();
            return;
          }
        }
      }
    }
  }
}