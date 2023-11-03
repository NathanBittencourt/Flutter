/*
Utilize a estrutura de seleção if/else para exibir a faixa de tributação 
do IR de uma pessoa de acordo com a seguinte classificação:

0%: Salário até 1903,98;

7,5%: Salário entre 1903,98 e 2862,65;

15%: Salário entre 2826,66 a 3751,05;

22,5%: Salário entre 3751,06 e 4664,68;

27,5%: Salário acima de 4664,68.

Obs: Não é necessário solicitar que o usuário entre com dados 
referentes do salário. Pois, neste momento, serão avaliados a 
montagem do if/else e a funcionalidade do mesmo, caso o valor 
da variável do salário seja alterado.

Obs.: Cópia do código outros alunos serão avaliados com nota 0 na atividade
*/
void main() {
  var salario = 10000;
  
  if(salario <= 1903.98){
    var ir = salario * 0;
    print("Valor do Imposto de Renda: $ir");
  }else if(salario > 1903.98 && salario <= 2862.65){
    var ir = salario * 0.075;
    print("Valor do Imposto de Renda: $ir");
  }else if(salario >= 2862.66 && salario <= 3751.05){
    var ir = salario * 0.15;
    print("Valor do Imposto de Renda: $ir");
  }else if(salario >= 3751.06 && salario <= 4664.68){
    var ir = salario * 0.225;
    print("Valor do Imposto de Renda: $ir");
  }else{
    var ir = salario * 0.275;
    print("Valor do Imposto de Renda: $ir");
  }
}
