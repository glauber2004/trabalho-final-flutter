import 'package:flutter/material.dart';
import '../models/livro.dart';
import 'adicionar_livro_page.dart';
import '../widgets/livro_tile.dart';

class LivrosPage extends StatefulWidget {
  const LivrosPage({super.key});

  @override
  State<LivrosPage> createState() => _LivrosPageState();
}

class _LivrosPageState extends State<LivrosPage> {
  List<Livro> livros = [
    Livro(
      nome: "1984",
      descricao: "Distopia de George Orwell",
      status: LivroStatus.lido,
    ),
    Livro(
      nome: "O Hobbit",
      descricao: "Aventura na Terra Média",
      status: LivroStatus.lendo,
    ),
    Livro(
      nome: "Dom Quixote",
      descricao: "Clássico da literatura espanhola",
      status: LivroStatus.naoLido,
    ),
  ];

  void _adicionarLivro(Livro novoLivro) {
    setState(() {
      livros.add(novoLivro);
    });
  }

  void _atualizarStatus(Livro livro, LivroStatus novoStatus) {
    setState(() {
      final index = livros.indexOf(livro);
      if (index != -1) {
        livros[index] = Livro(
          nome: livro.nome,
          descricao: livro.descricao,
          imagemUrl: livro.imagemUrl,
          status: novoStatus,
        );
      }
    });
  }

  void _excluirLivro(Livro livro) {
    setState(() {
      livros.remove(livro);
    });
  }

  void _mostrarMenuDeAcoes(BuildContext context, Livro livro) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Marcar como Lido'),
              onTap: () {
                Navigator.pop(context);
                _atualizarStatus(livro, LivroStatus.lido);
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Marcar como Lendo'),
              onTap: () {
                Navigator.pop(context);
                _atualizarStatus(livro, LivroStatus.lendo);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_outlined),
              title: const Text('Marcar como Não lido'),
              onTap: () {
                Navigator.pop(context);
                _atualizarStatus(livro, LivroStatus.naoLido);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Excluir Livro', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _excluirLivro(livro);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Livros'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final novoLivro = await Navigator.push<Livro>(
                context,
                MaterialPageRoute(builder: (_) => const AdicionarLivroPage()),
              );
              if (novoLivro != null) _adicionarLivro(novoLivro);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final livro = livros[index];
          return GestureDetector(
            onLongPress: () => _mostrarMenuDeAcoes(context, livro),
            child: LivroTile(livro: livro),
          );
        },
      ),
    );
  }
}
