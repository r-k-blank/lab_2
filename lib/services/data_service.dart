import 'dart:convert';
import 'package:flutter/foundation.dart'; // Importează pentru debugPrint
import 'package:flutter/services.dart' show rootBundle;

class DataService {
  Map<String, dynamic>? _homeData;
  Map<String, dynamic>? _detailsData;

  Map<String, dynamic> get homeData => _homeData ?? {};
  Map<String, dynamic> get detailsData => _detailsData ?? {};

  Future<void> loadAppData() async {
    try {
      debugPrint("Încerc să încarc app_data.json...");
      // Citim tot conținutul fișierului ca un singur String
      final jsonString = await rootBundle.loadString('assets/app_data.json');
      
      // Parsăm String-ul JSON într-un Map Dart
      final data = json.decode(jsonString) as Map<String, dynamic>;

      // Atribuim secțiunile corespunzătoare variabilelor noastre
      _homeData = data['home'] as Map<String, dynamic>;
      _detailsData = data['details'] as Map<String, dynamic>;
      
      debugPrint("Datele au fost încărcate și parsate cu succes!");

    } catch (e) {
      // Aici vom prinde orice eroare (fișier lipsă, JSON invalid etc.)
      debugPrint("A APĂRUT O EROARE la încărcarea datelor: $e");
    }
  }
}