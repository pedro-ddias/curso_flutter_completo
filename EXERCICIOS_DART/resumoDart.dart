// nesse bloco não será exucutado, será usado para interpolação dentro do main
int soma(a, b) {
  return a + b;
}

// criando uma classe a parte da entrada
// para iniciar variáveis sem valor elas necessitam ter valor nulo ou no caso de int e double iniciar zeradas
class Produto {
  String nome = "";
  double preco = 0;
}

// porta de entrada do sistema, tudo que será exutado precisa estar dentro do main
void main(List<String> args) {
  print('O valor da soma é: ${soma(2, 5)}');
  /*
  em dart a concatenação é usado o ${aqui dentro é coloca o objeto a ser exibido}
  antes/depois vem o denterminado comentario
  */

// inicio a Orientação a Objetos
  var produto = new Produto();
  produto.nome = "lapis";
  produto.preco = 4.55;

  print("O produto ${produto.nome} tem preco ${produto.preco}");
}
