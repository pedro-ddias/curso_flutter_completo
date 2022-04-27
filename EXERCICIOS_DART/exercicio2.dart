class Pessoa {
  String nome = '';
  String _cpf = '';
}

get cpf {
  return _cpf;
}

class _cpf {}

main(List<String> args) {
  var p1 = Pessoa();
  p1.nome = 'Pedro';
  // p1.cpf = '130.221.346-65'; não consigo atribuir um cpf porque ele é privado para a classe
  print(p1._cpf);
}
