import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final nomeDaTarefa = TextEditingController();
  final descricaoDaTarefa = TextEditingController();
  final segunda = TextEditingController();
  bool showNextFields = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Monte seu cronograma!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
      ),
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome do cronograma',
                filled: true,
                fillColor: Color.fromARGB(255, 45, 66, 99),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Tooltip(
                  message:
                      "Aqui é o nome do cronograma, como ele irá aparecer na página inicial",
                  child: IconButton(
                    color: Color.fromARGB(255, 200, 75, 49),
                    icon: Icon(Icons.help),
                    onPressed: () {},
                  ),
                ),
              ),
              controller: nomeDaTarefa,
              validator: (value) {
                if (value!.isEmpty) {
                  return "O nome da tarefa para continuar";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Descrição da tarefa',
                filled: true,
                fillColor: Color.fromARGB(255, 45, 66, 99),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: Tooltip(
                  message: "Insira aqui uma breve descrição da tarefa.",
                  child: IconButton(
                    color: Color.fromARGB(255, 200, 75, 49),
                    icon: Icon(Icons.help),
                    onPressed: () {},
                  ),
                ),
              ),
              controller: descricaoDaTarefa,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Informe a descrição da tarefa para continuar";
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: showNextFields,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF2D4263)),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Theme(
                          data: ThemeData(
                            dialogBackgroundColor: Color(0xFF2D4263),
                            textTheme: Theme.of(context).textTheme.apply(
                                  bodyColor: Colors.white,
                                ),
                          ),
                          child: AlertDialog(
                            title: Text("Segunda Feira"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Descrição do dia',
                                    labelStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(),
                                  ),
                                  controller: segunda,
                                  // Adicione a lógica de validação aqui, se necessário
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  "Salvar",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 200, 75, 49),
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Segunda Feira",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showNextFields = !showNextFields;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
