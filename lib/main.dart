// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'services/data_service.dart'; // Importă serviciul

// Funcție asincronă pentru a inițializa serviciile
Future<void> initServices() async {
  debugPrint("Încep inițializarea serviciilor...");
  // Înregistrăm DataService ca o dependență permanentă și așteptăm
  // ca datele să fie încărcate înainte de a continua.
  await Get.putAsync(() async {
    final service = DataService();
    await service.loadAppData();
    return service;
  });
  debugPrint("Toate serviciile au fost inițializate.");
}

// Facem funcția main asincronă
void main() async {
  // Asigură-te că binding-urile Flutter sunt gata înainte de a rula cod asincron
  WidgetsFlutterBinding.ensureInitialized();
  
  // Așteptăm ca serviciile (și datele) să fie încărcate
  await initServices();
  
  // Apoi pornim aplicația
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Course App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00796B)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}