class CourseDetail {
  final String id;
  final String title;
  final String institute; // Am schimbat din 'college'
  final double price;
  final double rating;
  final String duration;
  final int lecturesCount;
  final String certificationType;
  final String videoUrl;
  final String description;
  final List<String> skills;
  final bool isSaved;

  CourseDetail({
    this.id = '',
    this.title = '',
    this.institute = '', // Am schimbat din 'college'
    this.price = 0,
    this.rating = 0,
    this.duration = '',
    this.lecturesCount = 0,
    this.certificationType = '',
    this.videoUrl = '',
    this.description = '',
    this.skills = const [],
    this.isSaved = false,
  });
  CourseDetail copyWith({bool? isSaved}) {
    return CourseDetail(
      id: this.id,
      title: this.title,
      institute: this.institute,
      price: this.price,
      rating: this.rating,
      duration: this.duration,
      lecturesCount: this.lecturesCount,
      certificationType: this.certificationType,
      videoUrl: this.videoUrl,
      description: this.description,
      skills: this.skills,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}