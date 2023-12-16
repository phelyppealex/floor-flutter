import 'package:flutter/material.dart';
import 'package:segunda_prova/repository/professor_dao.dart';

class ListagemProfessores extends StatefulWidget {
  final ProfessorDao dao;
  
  const ListagemProfessores({super.key, required this.dao});

  @override
  State<ListagemProfessores> createState() => _ListagemProfessoresState(dao: dao);
}

class _ListagemProfessoresState extends State<ListagemProfessores> {
  final ProfessorDao dao;
  late Future<List> professores;

  _ListagemProfessoresState({required this.dao});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    professores = dao.listarProfessores();
  }

  void atualizarTela(){
    setState(() {
      professores = dao.listarProfessores();
    });  
  }
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: professores,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Erro ao carregar os dados'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('Nenhum professor cadastrado ainda'),
          );
        } else {
          return SizedBox(
            height: 600.0,  // Defina a altura conforme necessário
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                return Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Nome: ${snapshot.data![i].nome}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Matrícula: ${snapshot.data![i].matricula}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {
                            dao.deletarProfessor(snapshot.data![i]);
                            atualizarTela();
                          },
                          child: const Icon(Icons.delete)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(Icons.edit),
                      ),
                    ]
                  )
                );
              },
            ),
          );
        }
      }
    );
  }
}