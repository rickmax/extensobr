# Extensobr

Esta gem foi desenvolvida para auxiliar no desenvolvimento de aplicações onde é necessário escrever ou imprimir números ou moedas por extenso como por exemplo em recibos, contratos entre outros.


## Instalação

Adicionando em sua Gemfile:

```ruby
gem 'extensobr'
```

Ou instale você mesmo:

    $ gem install extensobr

## Exemplos de uso

Para obter o extenso de um número, utilize GExtenso.numero.

    irb

require 'Extensobr.rb'
 
    puts Extenso.numero(832); # oitocentos e trinta e dois
    puts Extenso.numero(832, Extenso::GENERO_FEM) # oitocentas e trinta e duas

Para obter o extenso de um valor monetário, utilize Extenso.moeda.

    require 'Extenso.rb'
 
## IMPORTANTE: este método recebe um valor inteiro(int), para a contagem das casas decimais!
    
    puts Extenso.moeda(15402) # cento e cinquenta e quatro reais e dois centavos
    puts Extenso.moeda(47)   # quarenta e sete centavos
    puts Extenso.moeda(357082, 2, ['peseta', 'pesetas', Extenso::GENERO_FEM], ['cêntimo', 'cêntimos', Extenso::GENERO_MASC])

## três mil, quinhentas e setenta pesetas e oitenta e dois cêntimos

# Developers

[Henrique Max](https://github.com/rickmax),
[Fausto G. Cintra](https://github.com/goncin)

## Como contribuir?

1. Fazer um fork do projeto
1. Fazer os devidos ajustes com os respectivos testes
1. Fazer pull request


## Licença

Está Gem esta disponível sob ostermos de licença [MIT License](http://opensource.org/licenses/MIT).

