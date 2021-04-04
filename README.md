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
### IMPORTANTE: este método recebe um valor inteiro(integer)
Para obter o extenso de um número, utilize Extenso.numero() OBS: Ovalor deve ser do tipo "INTEGER".

    irb

require 'Extensobr.rb'
 
    puts Extenso.numero(832); # oitocentos e trinta e dois
    puts Extenso.numero(832, Extenso::GENERO_FEM) # oitocentas e trinta e duas
 
### IMPORTANTE: este método recebe um valor decimal(float), para a contagem das casas decimais

Para obter o extenso de um valor monetário, utilize Extenso.moeda() OBS: Ovalor deve ser do tipo "FLOAT".

require 'Extenso.rb'

    puts Extenso.moeda(154.02) # cento e cinquenta e quatro reais e dois centavos
    puts Extenso.moeda(0.47)   # quarenta e sete centavos

### Customize sua moéda passando como parâmetro
    
    puts Extenso.moeda(3570.82, 2, ['peseta', 'pesetas', Extenso::GENERO_FEM], ['cêntimo', 'cêntimos', Extenso::GENERO_MASC])

### Para obter o valor numérico em reais de um número decimal

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

