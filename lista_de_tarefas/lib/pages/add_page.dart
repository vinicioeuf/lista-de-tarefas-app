import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final nomeDaTarefa = TextEditingController();
  final descricaoDaTarefa = TextEditingController();
  final dataTarefa = TextEditingController();
  final segunda = TextEditingController();
  final terca = TextEditingController();
  final quarta = TextEditingController();
  final quinta = TextEditingController();
  final sexta = TextEditingController();
  bool showNextFields = false;

  TimeOfDay _selectedTime = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
  }

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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!showNextFields) ...[
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
                            "Aqui é o nome do cronograma, como ele ira aparecer na página inicial",
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
                ],
                SizedBox(
                  height: 20,
                ),
                // Outros campos podem ser adicionados aqui se necessário
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFC84B31)),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(0.4 * MediaQuery.of(context).size.width, 50),
                ),
              ),
              child: Text("Próximo", style: TextStyle(color: Colors.white)),
              onPressed: () {
                setState(() {
                  showNextFields = !showNextFields;
                });
              },
            ),
          ),
          Visibility(
            visible: showNextFields,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% da largura da tela
                  height: 50, // Altura de 50
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
                                // Defina o tema para o AlertDialog
                                dialogBackgroundColor: Color(
                                    0xFF2D4263), // Cor de fundo do AlertDialog
                                textTheme: Theme.of(context).textTheme.apply(
                                      bodyColor: Colors
                                          .white, // Cor do texto do AlertDialog
                                    ),
                              ),
                              child: AlertDialog(
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 200, 75, 49),
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: Text("Segunda Feira"),
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Descrição do dia',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: segunda,
                                          // Adicione a lógica de validação aqui, se necessário
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text("Escolha o horário: "),
                                            TextButton(
                                              onPressed: () async {
                                                final TimeOfDay? picked =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: _selectedTime,
                                                );
                                                if (picked != null &&
                                                    picked != _selectedTime) {
                                                  setState(() {
                                                    _selectedTime = picked;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                _selectedTime.format(
                                                    context), // Movido para fora do Builder
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 200, 75, 49),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])));
                        },
                      );
                    },
                    child: Text("Segunda Feira",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% da largura da tela
                  height: 50, // Altura de 50
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
                                // Defina o tema para o AlertDialog
                                dialogBackgroundColor: Color(
                                    0xFF2D4263), // Cor de fundo do AlertDialog
                                textTheme: Theme.of(context).textTheme.apply(
                                      bodyColor: Colors
                                          .white, // Cor do texto do AlertDialog
                                    ),
                              ),
                              child: AlertDialog(
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 200, 75, 49),
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: Text("Terça Feira"),
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Descrição do dia',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: segunda,
                                          // Adicione a lógica de validação aqui, se necessário
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text("Escolha o horário: "),
                                            TextButton(
                                              onPressed: () async {
                                                final TimeOfDay? picked =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: _selectedTime,
                                                );
                                                if (picked != null &&
                                                    picked != _selectedTime) {
                                                  setState(() {
                                                    _selectedTime = picked;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                _selectedTime.format(
                                                    context), // Movido para fora do Builder
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 200, 75, 49),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])));
                        },
                      );
                    },
                    child: Text("Terça Feira",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% da largura da tela
                  height: 50, // Altura de 50
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
                                // Defina o tema para o AlertDialog
                                dialogBackgroundColor: Color(
                                    0xFF2D4263), // Cor de fundo do AlertDialog
                                textTheme: Theme.of(context).textTheme.apply(
                                      bodyColor: Colors
                                          .white, // Cor do texto do AlertDialog
                                    ),
                              ),
                              child: AlertDialog(
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 200, 75, 49),
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: Text("Quarta Feira"),
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Descrição do dia',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: segunda,
                                          // Adicione a lógica de validação aqui, se necessário
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text("Escolha o horário: "),
                                            TextButton(
                                              onPressed: () async {
                                                final TimeOfDay? picked =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: _selectedTime,
                                                );
                                                if (picked != null &&
                                                    picked != _selectedTime) {
                                                  setState(() {
                                                    _selectedTime = picked;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                _selectedTime.format(
                                                    context), // Movido para fora do Builder
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 200, 75, 49),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])));
                        },
                      );
                    },
                    child: Text("Quarta Feira",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% da largura da tela
                  height: 50, // Altura de 50
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
                                // Defina o tema para o AlertDialog
                                dialogBackgroundColor: Color(
                                    0xFF2D4263), // Cor de fundo do AlertDialog
                                textTheme: Theme.of(context).textTheme.apply(
                                      bodyColor: Colors
                                          .white, // Cor do texto do AlertDialog
                                    ),
                              ),
                              child: AlertDialog(
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 200, 75, 49),
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: Text("Quinta Feira"),
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Descrição do dia',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: segunda,
                                          // Adicione a lógica de validação aqui, se necessário
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text("Escolha o horário: "),
                                            TextButton(
                                              onPressed: () async {
                                                final TimeOfDay? picked =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: _selectedTime,
                                                );
                                                if (picked != null &&
                                                    picked != _selectedTime) {
                                                  setState(() {
                                                    _selectedTime = picked;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                _selectedTime.format(
                                                    context), // Movido para fora do Builder
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 200, 75, 49),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])));
                        },
                      );
                    },
                    child: Text("Quinta Feira",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% da largura da tela
                  height: 50, // Altura de 50
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
                                // Defina o tema para o AlertDialog
                                dialogBackgroundColor: Color(
                                    0xFF2D4263), // Cor de fundo do AlertDialog
                                textTheme: Theme.of(context).textTheme.apply(
                                      bodyColor: Colors
                                          .white, // Cor do texto do AlertDialog
                                    ),
                              ),
                              child: AlertDialog(
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 200, 75, 49),
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: Text("Sexta Feira"),
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Descrição do dia',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: segunda,
                                          // Adicione a lógica de validação aqui, se necessário
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text("Escolha o horário: "),
                                            TextButton(
                                              onPressed: () async {
                                                final TimeOfDay? picked =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: _selectedTime,
                                                );
                                                if (picked != null &&
                                                    picked != _selectedTime) {
                                                  setState(() {
                                                    _selectedTime = picked;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                _selectedTime.format(
                                                    context), // Movido para fora do Builder
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 200, 75, 49),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])));
                        },
                      );
                    },
                    child: Text("Sexta Feira",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% da largura da tela
                  height: 50, // Altura de 50
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
                                // Defina o tema para o AlertDialog
                                dialogBackgroundColor: Color(
                                    0xFF2D4263), // Cor de fundo do AlertDialog
                                textTheme: Theme.of(context).textTheme.apply(
                                      bodyColor: Colors
                                          .white, // Cor do texto do AlertDialog
                                    ),
                              ),
                              child: AlertDialog(
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 200, 75, 49),
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: Text("Sábado"),
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Descrição do dia',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: segunda,
                                          // Adicione a lógica de validação aqui, se necessário
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text("Escolha o horário: "),
                                            TextButton(
                                              onPressed: () async {
                                                final TimeOfDay? picked =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: _selectedTime,
                                                );
                                                if (picked != null &&
                                                    picked != _selectedTime) {
                                                  setState(() {
                                                    _selectedTime = picked;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                _selectedTime.format(
                                                    context), // Movido para fora do Builder
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 200, 75, 49),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])));
                        },
                      );
                    },
                    child: Text("Sábado",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.8, // 80% da largura da tela
                  height: 50, // Altura de 50
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
                                // Defina o tema para o AlertDialog
                                dialogBackgroundColor: Color(
                                    0xFF2D4263), // Cor de fundo do AlertDialog
                                textTheme: Theme.of(context).textTheme.apply(
                                      bodyColor: Colors
                                          .white, // Cor do texto do AlertDialog
                                    ),
                              ),
                              child: AlertDialog(
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Salvar",
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 200, 75, 49),
                                          fontSize: 18,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: Text("Domingo"),
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Descrição do dia',
                                            labelStyle:
                                                TextStyle(color: Colors.white),
                                            border: OutlineInputBorder(),
                                          ),
                                          controller: segunda,
                                          // Adicione a lógica de validação aqui, se necessário
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text("Escolha o horário: "),
                                            TextButton(
                                              onPressed: () async {
                                                final TimeOfDay? picked =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: _selectedTime,
                                                );
                                                if (picked != null &&
                                                    picked != _selectedTime) {
                                                  setState(() {
                                                    _selectedTime = picked;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                _selectedTime.format(
                                                    context), // Movido para fora do Builder
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 200, 75, 49),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ])));
                        },
                      );
                    },
                    child: Text("Domingo",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
