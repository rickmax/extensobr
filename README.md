# Extensobr

Esta gem foi desenvolvida para auxiliar no desenvolvimento de aplicações onde é necessário escrever ou números ou moedas por extenso como por exemplo em recibos, contratos entre outros.


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
Padrão de genero da escrita é passado com um parâmetro do tipo integer, Masculino: 0, Feminino: 1, sendo que o padrão é masculino. 

    irb

require 'Extensobr.rb'
 
    puts Extenso.numero(832); # oitocentos e trinta e dois
    puts Extenso.numero(832, 1) # oitocentas e trinta e duas

    # Novo método usando a classes do ruby a partir da versão 1.2 em diante.
    puts 832.por_extenso; # oitocentos e trinta e dois
    puts 832.por_extenso(1) # oitocentas e trinta e duas
    puts "832".por_extenso; # oitocentos e trinta e dois
    puts "832".por_extenso(1) # oitocentas e trinta e duas
 
### IMPORTANTE: este método recebe um valor decimal(float), para a contagem das casas decimais

Para obter o extenso de um valor monetário, utilize Extenso.moeda() OBS: Ovalor deve ser do tipo "FLOAT".

require 'Extenso.rb'

    puts Extenso.moeda(154.02) # cento e cinquenta e quatro reais e dois centavos
    puts Extenso.moeda(0.47)   # quarenta e sete centavos
    
    # Novos métodos usando a classes do ruby a partir da versão 1.2 em diante.
    puts 154.02.por_extenso # cento e cinquenta e quatro reais e dois centavos
    puts 0.47.por_extenso   # quarenta e sete centavos
    puts "154.02".por_extenso # cento e cinquenta e quatro reais e dois centavos
    puts "0.47".por_extenso   # quarenta e sete centavos

### Customize sua moéda passando como parâmetro
    
    puts Extenso.moeda(3570.82, 2, ['peseta', 'pesetas', Extenso::GENERO_FEM], ['cêntimo', 'cêntimos', Extenso::GENERO_MASC])
    # Três mil, Quinhentas e Setenta pesetas e Oitenta e Dois cêntimos

### Para obter o valor numérico em reais de um número decimal

    Extenso.real_formatado(154.55) # R$ 154,55
    Extenso.real_formatado(0) # R$ 0,00
    Extenso.real_formatado(1) # R$ 1,00

### Configurando exeptions para valores nulos
É possivel que na sua regra de negócio ou caso de uso, seja passado um valor nulo ou vazio para tentar escrever por extenso, nesses casos por padrão será retornado "Zero" para inteiros e "Zero centavos" para decimais. No entanto você pode configurar para receber uma exceção caso seja necessário. Em suas váriáis de ambiente adicione a seguinte chave e valor:
    
    EXTENSO_RAISE_FOR_NIL=true

E adicione um arquivo "config/extensobr.yml", com a seguinte configuração:
    
    raise_for_nil: ENV['EXTENSO_RAISE_FOR_NIL'] || 'false'

Você pode rodar o seguinte script para criar seu arquivo a partir da pasta raiz do seu projeto rails:

    echo 'extensobr_settings:\n  raise_for_nil: true\n  use_core_exts: true' > config/extensobr.yml

    

Dessa forma, você pode esperar em seus testes a seguinte excessão:

    RuntimeError: [Exceção em Extenso.numero] Parâmetro 'valor' é nulo
    

# Developers

[Henrique Max](https://github.com/rickmax),
[Renan Garcia](https://github.com/renan-garcia),
[Fausto G. Cintra](https://github.com/goncin),
[Victor Eduardo](https://github.com/victoreduardo)

## Como contribuir?

1. Faça um fork do projeto;
1. Adicione os devidos ajustes ou melhorias com os respectivos testes;
1. Envie pull request;


## Licença

Está Gem esta disponível sob os termos de licença [MIT License](http://opensource.org/licenses/MIT).

