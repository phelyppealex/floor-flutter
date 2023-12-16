import 'package:flutter/material.dart';
import 'package:segunda_prova/repository/app_database.dart';
import 'package:segunda_prova/repository/professor_dao.dart';
import 'package:segunda_prova/ui/tela_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final database = await $FloorAppDatabase
    .databaseBuilder('app_database.db')
    .build();
  
  final dao = database.professorDao;

  runApp(MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  final ProfessorDao dao;
  const MyApp({super.key, required this.dao});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Professores EAJ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          labelLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      home: TelaHome(dao: dao),
    );
  } 
}