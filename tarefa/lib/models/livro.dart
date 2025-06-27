enum LivroStatus { lido, lendo, naoLido }

class Livro {
  final String nome;
  final String descricao;
  final LivroStatus status;
  final String? imagemUrl;

  Livro({
    required this.nome,
    required this.descricao,
    required this.status,
    this.imagemUrl,
  });
}
