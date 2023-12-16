import "package:flutter/material.dart";
import "package:segunda_prova/repository/professor_dao.dart";
import "package:segunda_prova/ui/tela_cadastro.dart";
import "package:segunda_prova/widgets/listar_professores.dart";

class TelaHome extends StatelessWidget {
  final ProfessorDao dao;
  const TelaHome({super.key, required this.dao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Professores',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: BodyHome(dao: dao),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaCadastro(dao: dao),
            ),
          );
        },
      ),
    );
  }
}

class BodyHome extends StatelessWidget {
  final ProfessorDao dao;
  const BodyHome({super.key, required this.dao});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Listagem de Professores',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        ListagemProfessores(dao: dao)
      ],
    );
  }
}