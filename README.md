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

Para obter o extenso de um número, utilize Extenso.numero.

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

Para obter o valor em real de um número, utilize Extenso.real_formatado.

    Extenso.real_formatado(154.55) # R$ 154,55
    Extenso.real_formatado(0) # R$ 0,00
    Extenso.real_formatado(1) # R$ 1,00

# Developers

[Henrique Max](https://github.com/rickmax),
[Fausto G. Cintra](https://github.com/goncin),
[Victor Eduardo](https://github.com/victoreduardo)

## Como contribuir?

1. Fazer um fork do projeto
1. Fazer os devidos ajustes com os respectivos testes
1. Fazer pull request


## Licença

Está Gem esta disponível sob ostermos de licença [MIT License](http://opensource.org/licenses/MIT).

