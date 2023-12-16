import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/professor.dart';
import 'package:segunda_prova/repository/professor_dao.dart';
import 'package:segunda_prova/widgets/formulario.dart';
import 'package:segunda_prova/ui/tela_home.dart';

class TelaCadastro extends StatelessWidget {
  final ProfessorDao dao;
  const TelaCadastro({Key? key, required this.dao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cadastro Professor"),
      ),
      body: Formulario(dao: dao),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class Formulario extends StatefulWidget {
  final ProfessorDao dao;
  
  const Formulario({super.key,required this.dao});

  @override
  State<Formulario> createState() => _FormularioProfessor(dao: dao);
}

class _FormularioProfessor extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  final nomeCtrl = TextEditingController();
  final cpfCtrl = TextEditingController();
  final matriculaCtrl = TextEditingController();
  final nascimentoCtrl = TextEditingController();
  final idadeCtrl = TextEditingController();
  final sexoCtrl = TextEditingController();
  final dao;

  _FormularioProfessor({required this.dao});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Cadastro de Professores",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            CustomFormField(
              controller: nomeCtrl,
              labelText: "NOME",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um nome';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: cpfCtrl,
              labelText: "CPF",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione um cpf';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: matriculaCtrl,
              labelText: "MATRICULA",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione a matricula';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: idadeCtrl,
              labelText: "IDADE",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione sua idade';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: nascimentoCtrl,
              labelText: "DATA DE NASCIMENTO",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione sua data de nascimento';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: sexoCtrl,
              labelText: "SEXO",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'adicione sexo: Masculino ou Feminino';
                }
                return null;
              },
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Professor p = Professor(
                    nome: nomeCtrl.text,
                    cpf: cpfCtrl.text,
                    matricula: matriculaCtrl.text,
                    nascimento: nascimentoCtrl.text,
                    idade: int.parse(idadeCtrl.text),
                    sexo: sexoCtrl.text,
                  );

                  dao.inserirProfessor(p);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaHome(dao: dao),
                    ),
                  );
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                "Cadastrar",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}