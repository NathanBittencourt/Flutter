import 'dart:async';

/*void main(){
  List<int> numeros = [1,2,3];
  
  List<String> letras = ['a','b','c'];
  
  print(letras);
}*/

/*void main(){
  final s = Stream<int>.periodic(Duration(seconds: 2),
            (indice) => indice + 1,
            ).take(10);
  s.listen((valor){
    print(valor);
  });
}*/

/*void main(){
  final s = Stream<int>.multi((controller){
    controller.add(1);
    controller.add(2);
    controller.add(3);
    controller.add(4);
    controller.add(5);
  });
  
  s.listen((valor){
    print(valor);
  });
}*/

/*void main(){
  final s = Stream<int>.multi((controller){
    int num = 10;
    
    Timer.periodic(Duration(seconds: 2),(_){
      controller.add(num--);
    });
    
  });
  
  s.listen((valor){
    print(valor);
  });
}*/

void main(){
  final s = Stream<int>.multi((controller){
    int num = 100;
    
    Timer.periodic(Duration(seconds: 2),(_){
      controller.add(num--);
    });
    
  });
  
  s.listen((valor){
    if(valor >= 50 && valor % 2 == 1){
       print(valor);
    }
  });
}