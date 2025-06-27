import 'package:flutter/material.dart';
import '../models/livro.dart';

class LivroTile extends StatelessWidget {
  final Livro livro;

  const LivroTile({super.key, required this.livro});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _corStatus(livro.status),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: livro.imagemUrl != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            livro.imagemUrl!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        )
            : const Icon(Icons.book, size: 40, color: Colors.white),
        title: Text(
          livro.nome,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          livro.descricao,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  Color _corStatus(LivroStatus status) {
    switch (status) {
      case LivroStatus.lido:
        return Colors.greenAccent.shade700;
      case LivroStatus.lendo:
        return Colors.orangeAccent.shade700;
      case LivroStatus.naoLido:
        return Colors.redAccent.shade700;
    }
  }
}
