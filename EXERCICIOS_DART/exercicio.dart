main() {
  print("Primeiro programa");

//iniciou um variável sem declamar o tipo que ela é
  var nomes = ['Pedro', 'Gabriel', 'Jose'];
//a partir da inicialização o dart identificou o tipo, como era String transformou-o em objeto pode-se assim ultilizar a notação ponto
  nomes.add('Arthur');
  print(nomes);

//for que irá percerer toda a lista e passar cada nome de acordo com sua posição
//igual o for de Java
  for (int i = 0; i < nomes.length; i++) {
    print('${i} = ${nomes[i]}');
  }

// nesse modo trabalha com a linguagem como se fosso fracamente tipada
// o valor pode ser alterado a partir de novas atribuições
  dynamic x = 'Teste';
  x = false;
  x = 3;
  print(x);

  // a ultima atribuição será o valor dele
}
