import 'package:flutter/material.dart';
import '../models/livro.dart';

class AdicionarLivroPage extends StatefulWidget {
  const AdicionarLivroPage({super.key});

  @override
  State<AdicionarLivroPage> createState() => _AdicionarLivroPageState();
}

class _AdicionarLivroPageState extends State<AdicionarLivroPage> {
  final _formKey = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final autorController = TextEditingController();
  final descricaoController = TextEditingController();
  final imagemUrlController = TextEditingController();

  LivroStatus statusSelecionado = LivroStatus.naoLido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adição de Livro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: tituloController,
                decoration: const InputDecoration(labelText: 'Título do Livro'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o título';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: autorController,
                decoration: const InputDecoration(labelText: 'Autor'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descricaoController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: imagemUrlController,
                decoration: const InputDecoration(labelText: 'URL da Imagem (opcional)'),
              ),
              const SizedBox(height: 20),

              // STATUS COM CHOICECHIPS
              const Text(
                'Status de Leitura',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: LivroStatus.values.map((status) {
                  final isSelected = statusSelecionado == status;
                  return ChoiceChip(
                    label: Text(_nomeStatusBonito(status)),
                    selected: isSelected,
                    selectedColor: _corStatus(status),
                    onSelected: (_) {
                      setState(() {
                        statusSelecionado = status;
                      });
                    },
                    avatar: Icon(
                      _iconeStatus(status),
                      color: isSelected ? Colors.white : Colors.black,
                      size: 18,
                    ),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      final novoLivro = Livro(
                        nome: "${tituloController.text} - ${autorController.text}",
                        descricao: descricaoController.text,
                        imagemUrl: imagemUrlController.text.isEmpty
                            ? null
                            : imagemUrlController.text,
                        status: statusSelecionado,
                      );
                      Navigator.pop(context, novoLivro);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // UTILITÁRIOS VISUAIS

  String _nomeStatusBonito(LivroStatus status) {
    switch (status) {
      case LivroStatus.lido:
        return 'Lido';
      case LivroStatus.lendo:
        return 'Lendo';
      case LivroStatus.naoLido:
        return 'Não lido';
    }
  }

  Color _corStatus(LivroStatus status) {
    switch (status) {
      case LivroStatus.lido:
        return Colors.green;
      case LivroStatus.lendo:
        return Colors.orange;
      case LivroStatus.naoLido:
        return Colors.red;
    }
  }

  IconData _iconeStatus(LivroStatus status) {
    switch (status) {
      case LivroStatus.lido:
        return Icons.check_circle;
      case LivroStatus.lendo:
        return Icons.menu_book;
      case LivroStatus.naoLido:
        return Icons.radio_button_unchecked;
    }
  }
}
