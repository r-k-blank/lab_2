import 'package:flutter/material.dart';
import '../../../resources/app_colors.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;
  final bool isSaved; // Adăugat
  final VoidCallback onBookmarkTap;
  const VideoPlayerWidget({
    super.key, 
    required this.videoUrl,
    required this.isSaved, // Adăugat
    required this.onBookmarkTap // Adăugat
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary,
                  AppColors.primaryDark,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '9:30',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          Positioned(
      top: 40,
      right: 16,
      child: GestureDetector( // Învelim în GestureDetector
        onTap: onBookmarkTap, // Apelăm funcția primită
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            // Folosim starea primită pentru a alege iconița
            isSaved ? Icons.bookmark : Icons.bookmark_border,
            color: AppColors.primary,
            size: 24,
          ),
        ),
      ),
    ),
          
          Positioned(
            top: 40,
            right: 16,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.bookmark_border,
                color: AppColors.primary,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}