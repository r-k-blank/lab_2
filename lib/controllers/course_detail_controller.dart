import 'package:get/get.dart';
import '../services/data_service.dart'; // IMPORTĂM SERVICIUL
import '../models/course_detail.dart';

class CourseDetailController extends GetxController {
  // Obținem instanța serviciului de date din GetX
  final DataService dataService = Get.find();
  Rx<CourseDetail> course = Rx(CourseDetail());
  
  void loadCourseDetail(String courseId) {
    // Extragem datele din serviciu
    final details = dataService.detailsData;
    
    // Aici ar trebui să cauți cursul după ID, dar pentru exemplu folosim direct ce e în JSON
    final courseData = details['course'] as Map<String, dynamic>;

    course.value = CourseDetail(
      id: courseData['id'] as String,
      title: courseData['title'] as String,
      institute: courseData['institute'] as String,
      price: (courseData['price'] as num).toDouble(),
      rating: (courseData['rating'] as num).toDouble(),
      duration: courseData['duration'] as String,
      lecturesCount: courseData['lectures'] as int,
      certificationType: courseData['certification'] as String,
      videoUrl: courseData['previewVideo'] as String,
      description: courseData['description'] as String,
      skills: List<String>.from(courseData['skills'] as List),
      isSaved: courseData['isSaved'] ?? false,
    );
  }

  void toggleSavedStatus() {
    final currentState = course.value;
    course.value = currentState.copyWith(isSaved: !currentState.isSaved);
  }
}