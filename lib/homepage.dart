import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime dataSelecionada = DateTime.now();
  String? _nomeC, _cpf, _endereco, _comple, _num;

  bool _opEletronica = false;
  bool _opAutomacao = false;
  bool _opdevSistem = false;

  int selectedRadio = 0;

  String _opcaoSelecionada = "";
  List<String> _opcoes = [
    '',
    'Recife',
    'São Paulo',
    'João Pessoa',
    'Jaboatão dos Guararapes.',
  ];

  Future<void> _escolherData(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: dataSelecionada,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != dataSelecionada) {
      setState(() {
        dataSelecionada = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Formulário de Cadastro",
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w900,
                  color: Colors.blue,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) {
                        _nomeC = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.abc),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) {
                        _cpf = value;
                      },
                      decoration: InputDecoration(
                        labelText: "CPF",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("${dataSelecionada.toLocal()}".split(' ')[0]),
                        ElevatedButton(
                          onPressed: () => _escolherData(context),
                          child: Text("Data de Nascimento"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Escolha a(s) área(s) de interesse:"),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _opEletronica,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _opEletronica = newValue!;
                            });
                          },
                          title: Text('Eletrónica'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _opAutomacao,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _opAutomacao = newValue!;
                            });
                          },
                          title: Text('Automação'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: _opdevSistem,
                          onChanged: (bool? newValue) {
                            setState(() {
                              _opdevSistem = newValue!;
                            });
                          },
                          title: Text('Desenvolvimento de Sistemas'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Escolha o dia de vencimento:"),
                        RadioListTile(
                          value: 1,
                          groupValue: selectedRadio,
                          onChanged: (int? value) {
                            setState(() {
                              selectedRadio = value!;
                            });
                          },
                          title: Text('5'),
                        ),
                        RadioListTile(
                          value: 2,
                          groupValue: selectedRadio,
                          onChanged: (int? value) {
                            setState(() {
                              selectedRadio = value!;
                            });
                          },
                          title: Text('10'),
                        ),
                        RadioListTile(
                          value: 3,
                          groupValue: selectedRadio,
                          onChanged: (int? value) {
                            setState(() {
                              selectedRadio = value!;
                            });
                          },
                          title: Text('15'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) {
                        _endereco = value;
                      },
                      decoration: InputDecoration(
                        labelText: "Endereço",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      onChanged: (value) {
                        _num = value;
                      },
                      decoration: InputDecoration(
                        labelText: "N°",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.map),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    flex: 3,
                    child: DropdownButtonFormField<String>(
                      value: _opcaoSelecionada,
                      onChanged: (novoValor) {
                        setState(() {
                          _opcaoSelecionada = novoValor!;
                        });
                      },
                      items: _opcoes.map((opcao) {
                        return DropdownMenuItem<String>(
                          value: opcao,
                          child: Text(opcao),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                          prefixText: 'Cidade', border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      onChanged: (value) => _comple = value,
                      maxLines: 4,
                      decoration: InputDecoration(
                        label: Text("Complemento"),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.more),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton.icon(
                    onPressed: () {
                      print("$_nomeC $_cpf $_endereco $_num");
                      print("$_opcaoSelecionada $dataSelecionada");
                      print("$_comple");
                    },
                    icon: Icon(Icons.save),
                    label: Text("Cadastrar"),
                  ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
