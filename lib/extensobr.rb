require "extensobr/version"
class Extenso
# Extenso class file

# Extenso é uma classe que gera a representação por extenso de um número ou valor monetário.
#
# ATENÇÃO: A PÁGINA DE CÓDIGO DESTE ARQUIVO É UTF-8 (Unicode)!
# 
# Sua implementação foi feita como prova de conceito, utilizando:
# * Métodos estáticos, implementando o padrão de projeto ("design pattern") SINGLETON;
# * Chamadas recursivas a métodos, minimizando repetições e mantendo o código enxuto; e
# * Tratamento de erros por intermédio de exceções.
#
# = EXEMPLOS DE USO =
#
# Para obter o extenso de um número, utilize Extenso.numero.
# 
# puts Extenso.numero(832); # oitocentos e trinta e dois
# puts Extenso.numero(832, Extenso::GENERO_FEM) # oitocentas e trinta e duas
# 
#
# Para obter o extenso de um valor monetário, utilize Extenso.moeda.
# 
# # IMPORTANTE: veja nota sobre o parâmetro 'valor' na documentação do método!
#
# puts Extenso.moeda(15402) # cento e cinquenta e quatro reais e dois centavos
#
# puts Extenso.moeda(47)   # quarenta e sete centavos
#
# puts Extenso.moeda(357082, 2,
#   ['peseta', 'pesetas', Extenso::GENERO_FEM],
#   ['cêntimo', 'cêntimos', Extenso::GENERO_MASC])
#   # três mil, quinhentas e setenta pesetas e oitenta e dois cêntimos
#
  
  NUM_SING = 0
  NUM_PLURAL = 1
  POS_GENERO = 2
  GENERO_MASC = 0
  GENERO_FEM = 1
  
  VALOR_MAXIMO = 999999999
  
  # As unidades 1 e 2 variam em gênero, pelo que precisamos de dois conjuntos de strings (masculinas e femininas) para as unidades
  UNIDADES = {
    GENERO_MASC => {
      1 => 'Um',
      2 => 'Dois',
      3 => 'Três',
      4 => 'Quatro',
      5 => 'Cinco',
      6 => 'Seis',
      7 => 'Sete',
      8 => 'Oito',
      9 => 'Nove'
    },
    GENERO_FEM => {
      1 => 'Uma',
      2 => 'Duas',
      3 => 'Três',
      4 => 'Quatro',
      5 => 'Cinco',
      6 => 'Seis',
      7 => 'Sete',
      8 => 'Oito',
      9 => 'Nove'
    }
  }
  
  DE11A19 = {
    11 => 'Onze',
    12 => 'Doze',
    13 => 'Treze',
    14 => 'Quatorze',
    15 => 'Quinze',
    16 => 'Dezesseis',
    17 => 'Dezessete',
    18 => 'Dezoito',
    19 => 'Dezenove'
  }
  
  DEZENAS = {
    10 => 'Dez',
    20 => 'Vinte',
    30 => 'Trinta',
    40 => 'Quarenta',
    50 => 'Cinquenta',
    60 => 'Sessenta',
    70 => 'Setenta',
    80 => 'Oitenta',
    90 => 'Noventa'
  }
  
  CENTENA_EXATA = 'Cem'
  
  # As centenas, com exceção de 'cento', também variam em gênero. Aqui também se faz
  # necessário dois conjuntos de strings (masculinas e femininas).
   
  CENTENAS = {
    GENERO_MASC => {
      100 => 'Cento',
      200 => 'Duzentos',
      300 => 'Trezentos',
      400 => 'Quatrocentos',
      500 => 'Quinhentos',
      600 => 'Seiscentos',
      700 => 'Setecentos',
      800 => 'Oitocentos',
      900 => 'Novecentos'
    },
    GENERO_FEM => {
      100 => 'Cento',
      200 => 'Duzentas',
      300 => 'Trezentas',
      400 => 'Quatrocentas',
      500 => 'Quinhentas',
      600 => 'Seiscentas',
      700 => 'Setecentas',
      800 => 'Oitocentas',
      900 => 'Novecentas'
    }
  }
  
  #'Mil' é invariável, seja em gênero, seja em número
  MILHAR = 'mil'

  MILHOES = {
    NUM_SING => 'Milhão',
    NUM_PLURAL => 'Milhões'
  }

   UNIDADES_ORDINAL = {
    GENERO_MASC => {
      1 => 'Primeiro',
      2 => 'Segundo',
      3 => 'Terceiro',
      4 => 'Quarto',
      5 => 'Quinto',
      6 => 'Sexto',
      7 => 'Sétimo',
      8 => 'Oitavo',
      9 => 'Nono'},
    GENERO_FEM => {
      1 => 'Primeira',
      2 => 'Segunda',
      3 => 'Terceira',
      4 => 'Quarta',
      5 => 'Quinta',
      6 => 'Sexta',
      7 => 'Sétima',
      8 => 'Oitava',
      9 => 'Nona'}}

  DEZENAS_ORDINAL = {
    GENERO_MASC => {
      10 => 'Décimo',
      20 => 'Vigésimo',
      30 => 'Trigésimo',
      40 => 'Quadragésimo',
      50 => 'Quinquagésimo',
      60 => 'Sexagésimo',
      70 => 'Septuagésimo',
      80 => 'Octogésimo',
      90 => 'Nonagésimo'},
    GENERO_FEM => {
      10 => 'Décima',
      20 => 'Vigésima',
      30 => 'Trigésima',
      40 => 'Quadragésima',
      50 => 'Quinquagésima',
      60 => 'Sexagésima',
      70 => 'Septuagésima',
      80 => 'Octogésima',
      90 => 'Nonagésima'}}
   
  CENTENAS_ORDINAL = {
    GENERO_MASC => {
      100 => 'Centésimo',
      200 => 'Ducentésimo',
      300 => 'Trecentésimo',
      400 => 'Quadringentésimo',
      500 => 'Quingentésimo',
      600 => 'Seiscentésimo',
      700 => 'Septingentésimo',
      800 => 'Octingentésimo',
      900 => 'Noningentésimo'},
    GENERO_FEM => {
      100 => 'Centésima',
      200 => 'Ducentésima',
      300 => 'Trecentésima',
      400 => 'Quadringentésima',
      500 => 'Quingentésima',
      600 => 'Seiscentésima',
      700 => 'Septingentésima',
      800 => 'Octingentésima',
      900 => 'Noningentésima'}}
    
  
    MILHAR_ORDINAL = {
      GENERO_MASC => {
        1000 => 'Milésimo'},
      GENERO_FEM =>{
        1000 => 'Milésima'}}
  
  def self.is_int(s)
    Integer(s) != nil rescue false
  end
  
  #######################################################################################################################################
  
  def self.numero (valor, genero = GENERO_MASC)

    # Gera a representação por extenso de um número inteiro, maior que zero e menor ou igual a VALOR_MAXIMO.
    #
    # PARÂMETROS:
    # valor (Integer) O valor numérico cujo extenso se deseja gerar
    #
    # genero (Integer) [Opcional; valor padrão: Extenso::GENERO_MASC] O gênero gramatical (Extenso::GENERO_MASC ou Extenso::GENERO_FEM)
    # do extenso a ser gerado. Isso possibilita distinguir, por exemplo, entre 'duzentos e dois homens' e 'duzentas e duas mulheres'.
    #
    # VALOR DE RETORNO:
    # (String) O número por extenso
    
    # ----- VALIDAÇÃO DOS PARÂMETROS DE ENTRADA ---- 
    
    if !is_int(valor)
      raise "[Exceção em Extenso.numero] Parâmetro 'valor' não é numérico (recebido: '#{valor}')"
    elsif valor <= 0
      raise "[Exceção em Extenso.numero] Parâmetro 'valor' igual a ou menor que zero (recebido: '#{valor}')"
    elsif valor > VALOR_MAXIMO
      raise '[Exceção em Extenso::numero] Parâmetro ''valor'' deve ser um inteiro entre 1 e ' + VALOR_MAXIMO.to_s + " (recebido: '#{valor}')"
    elsif genero != GENERO_MASC && genero != GENERO_FEM
      raise "Exceção em Extenso: valor incorreto para o parâmetro 'genero' (recebido: '#{genero}')"

  # ------------------------------------------------

    elsif valor >= 1 && valor <= 9
      UNIDADES[genero][valor]
    
    elsif valor == 10
      DEZENAS[valor]

    elsif valor >= 11 && valor <= 19
      DE11A19[valor]
    
    elsif valor >= 20 && valor <= 99
      dezena = valor - (valor % 10)
      ret = DEZENAS[dezena]
      # Chamada recursiva à função para processar resto se este for maior que zero.
      # O conectivo 'e' é utilizado entre dezenas e unidades.
      resto = valor - dezena
      if resto > 0
        ret += ' e ' + self.numero(resto, genero)
      end
      ret

    elsif valor == 100 
      CENTENA_EXATA

    elsif valor >= 101 && valor <= 999
      centena = valor - (valor % 100)
      ret = CENTENAS[genero][centena] # As centenas (exceto 'cento') variam em gênero
      # Chamada recursiva à função para processar resto se este for maior que zero.
      # O conectivo 'e' é utilizado entre centenas e dezenas.
      resto = valor - centena 
      if resto > 0
        ret += ' e ' + self.numero(resto, genero)
      end
      ret

    elsif valor >= 1000 && valor <= 999999
      # A função 'floor' é utilizada para encontrar o inteiro da divisão de valor por 1000,
      # assim determinando a quantidade de milhares. O resultado é enviado a uma chamada recursiva
      # da função. A palavra 'mil' não se flexiona.
      milhar = (valor / 1000).floor
      ret = self.numero(milhar, GENERO_MASC) + ' ' + MILHAR # 'Mil' é do gênero masculino
      resto = valor % 1000
      # Chamada recursiva à função para processar resto se este for maior que zero.
      # O conectivo 'e' é utilizado entre milhares e números entre 1 e 99, bem como antes de centenas exatas.
      if resto > 0 && ((resto >= 1 && resto <= 99) || resto % 100 == 0)
        ret += ' e ' + self.numero(resto, genero)
      # Nos demais casos, após o milhar é utilizada a vírgula.
      elsif (resto > 0)
        ret += ', ' + self.numero(resto, genero)
      end
      ret

    elsif valor >= 100000 && valor <= VALOR_MAXIMO
      # A função 'floor' é utilizada para encontrar o inteiro da divisão de valor por 1000000,
      # assim determinando a quantidade de milhões. O resultado é enviado a uma chamada recursiva
      # da função. A palavra 'milhão' flexiona-se no plural.
      milhoes = (valor / 1000000).floor
      ret = self.numero(milhoes, GENERO_MASC) + ' ' # Milhão e milhões são do gênero masculino
      
      # Se a o número de milhões for maior que 1, deve-se utilizar a forma flexionada no plural
      ret += milhoes == 1 ? MILHOES[NUM_SING] : MILHOES[NUM_PLURAL]

      resto = valor % 1000000

      # Chamada recursiva à função para processar resto se este for maior que zero.
      # O conectivo 'e' é utilizado entre milhões e números entre 1 e 99, bem como antes de centenas exatas.
      if resto && (resto >= 1 && resto <= 99)
        ret += ' e ' + self.numero(resto, genero)
      # Nos demais casos, após o milhão é utilizada a vírgula.
      elsif resto > 0
        ret += ', ' + self.numero(resto, genero)
      end
      ret

    end
  
  end
  
  #######################################################################################################################################
  
  def self.moeda(
    valor,
    casas_decimais = 2,
    info_unidade = ['Real', 'Reais', GENERO_MASC],
    info_fracao = ['Centavo', 'Centavos', GENERO_MASC]
  ) 
  
   # Gera a representação por extenso de um valor monetário, maior que zero e menor ou igual a Extenso::VALOR_MAXIMO.
   #
   #
   # PARÂMETROS:
   # valor (Integer) O valor monetário cujo extenso se deseja gerar.
   #   ATENÇÃO: PARA EVITAR OS CONHECIDOS PROBLEMAS DE ARREDONDAMENTO COM NÚMEROS DE PONTO FLUTUANTE, O VALOR DEVE SER PASSADO
   #   JÁ DEVIDAMENTE MULTIPLICADO POR 10 ELEVADO A $casasDecimais (o que equivale, normalmente, a passar o valor com centavos
   #   multiplicado por 100)
   #
   # casas_decimais (Integer) [Opcional; valor padrão: 2] Número de casas decimais a serem consideradas como parte fracionária (centavos)
   #
   # info_unidade (Array) [Opcional; valor padrão: ['real', 'reais', Extenso::GENERO_MASC]] Fornece informações sobre a moeda a ser
   #   utilizada. O primeiro valor da matriz corresponde ao nome da moeda no singular, o segundo ao nome da moeda no plural e o terceiro
   #   ao gênero gramatical do nome da moeda (Extenso::GENERO_MASC ou Extenso::GENERO_FEM)
   #
   # info_fracao (Array) [Opcional; valor padrão: ['centavo', 'centavos', Extenso::GENERO_MASC]] Provê informações sobre a parte fracionária
   #   da moeda. O primeiro valor da matriz corresponde ao nome da parte fracionária no singular, o segundo ao nome da parte fracionária no plural
   #   e o terceiro ao gênero gramatical da parte fracionária (Extenso::GENERO_MASC ou Extenso::GENERO_FEM)
   #
   # VALOR DE RETORNO:
   # (String) O valor monetário por extenso
   
    # ----- VALIDAÇÃO DOS PARÂMETROS DE ENTRADA ----

    if ! self.is_int(valor)
      raise "[Exceção em Extenso.moeda] Parâmetro 'valor' não é numérico (recebido: '#{valor}')"

    elsif valor <= 0
      raise "[Exceção em Extenso.moeda] Parâmetro valor igual a ou menor que zero (recebido: '#{valor}')"

    elsif ! self.is_int(casas_decimais) || casas_decimais < 0
      raise "[Exceção em Extenso.moeda] Parâmetro 'casas_decimais' não é numérico ou é menor que zero (recebido: '#{casas_decimais}')"

    elsif info_unidade.class != Array || info_unidade.length < 3
      temp = info_unidade.class == Array ? '[' + info_unidade.join(', ') + ']' : "'#{info_unidade}'"
      raise "[Exceção em Extenso.moeda] Parâmetro 'info_unidade' não é uma matriz com 3 (três) elementos (recebido: #{temp})"
    
    elsif info_unidade[POS_GENERO] != GENERO_MASC && info_unidade[POS_GENERO] != GENERO_FEM
      raise "Exceção em Extenso: valor incorreto para o parâmetro 'info_unidade[POS_GENERO]' (recebido: '#{info_unidade[POS_GENERO]}')"

    elsif info_fracao.class != Array || info_fracao.length < 3
      temp = info_fracao.class == Array ? '[' + info_fracao.join(', ') + ']' : "'#{info_fracao}'"
      raise "[Exceção em Extenso.moeda] Parâmetro 'info_fracao' não é uma matriz com 3 (três) elementos (recebido: #{temp})"
    
    elsif info_fracao[POS_GENERO] != GENERO_MASC && info_fracao[POS_GENERO] != GENERO_FEM
      raise "[Exceção em Extenso.moeda] valor incorreto para o parâmetro 'info_fracao[POS_GENERO]' (recebido: '#{info_fracao[POS_GENERO]}')."
    
    end

    # -----------------------------------------------

    ret = ''

    # A parte inteira do valor monetário corresponde ao valor passado dividido por 10 elevado a casas_decimais, desprezado o resto.
    # Assim, com o padrão de 2 casas_decimais, o valor será dividido por 100 (10^2), e o resto é descartado utilizando-se floor().
    parte_inteira = valor.floor / (10**casas_decimais)

    # A parte fracionária ('centavos'), por seu turno, corresponderá ao resto da divisão do valor por 10 elevado a casas_decimais.
    # No cenário comum em que trabalhamos com 2 casas_decimais, será o resto da divisão do valor por 100 (10^2).
    fracao = valor % (10**casas_decimais)

    # O extenso para a parte_inteira somente será gerado se esta for maior que zero. Para tanto, utilizamos
    # os préstimos do método Extenso::numero().
    if parte_inteira > 0
      ret = self.numero(parte_inteira, info_unidade[POS_GENERO]) + ' '
      ret += parte_inteira == 1 ? info_unidade[NUM_SING] : info_unidade[NUM_PLURAL]
    end

    # De forma semelhante, o extenso da fracao somente será gerado se esta for maior que zero. */
    if fracao > 0
      # Se a parte_inteira for maior que zero, o extenso para ela já terá sido gerado. Antes de juntar os
      # centavos, precisamos colocar o conectivo 'e'.
      if parte_inteira > 0
        ret += ' e '
      end
      ret += self.numero(fracao, info_fracao[POS_GENERO]) + ' '
      ret += parte_inteira == 1 ? info_fracao[NUM_SING] : info_fracao[NUM_PLURAL]
    end

    ret

  end

  ######################################################################################################################################################
  def self.ordinal (valor, genero = GENERO_MASC)

    # Gera a representação ordinal de um número inteiro de 1 à 1000

    # PARÂMETROS:
    # valor (Integer) O valor numérico cujo extenso se deseja gerar
    #
    # genero (Integer) [Opcional; valor padrão: Extenso::GENERO_MASC] O gênero gramatical (Extenso::GENERO_MASC ou Extenso::GENERO_FEM)
    # do extenso a ser gerado. Isso possibilita distinguir, por exemplo, entre 'duzentos e dois homens' e 'duzentas e duas mulheres'.
    #
    # VALOR DE RETORNO:
    # (String) O número por extenso
    
    # ----- VALIDAÇÃO DOS PARÂMETROS DE ENTRADA ---- 
    
    if !is_int(valor)
      raise "[Exceção em Extenso.numero] Parâmetro 'valor' não é numérico (recebido: '#{valor}')"
    elsif valor <= 0
      raise "[Exceção em Extenso.numero] Parâmetro 'valor' igual a ou menor que zero (recebido: '#{valor}')"
    elsif valor > VALOR_MAXIMO
      raise '[Exceção em Extenso::numero] Parâmetro ''valor'' deve ser um inteiro entre 1 e ' + VALOR_MAXIMO.to_s + " (recebido: '#{valor}')"
    elsif genero != GENERO_MASC && genero != GENERO_FEM
      raise "Exceção em Extenso: valor incorreto para o parâmetro 'genero' (recebido: '#{genero}')"
  # ------------------------------------------------
    elsif valor >= 1 && valor <= 9
      return UNIDADES_ORDINAL[genero][valor]
    elsif valor >= 10 && valor <= 99
      dezena = valor - (valor % 10)
      resto = valor - dezena
      ret = DEZENAS_ORDINAL[genero][dezena]+" "
      if resto > 0 then ret+= self.ordinal(resto,genero); end
      return ret
    elsif valor >= 100 && valor <= 999
      centena = valor - (valor % 100)
      resto = valor - centena 
      ret = CENTENAS_ORDINAL[genero][centena]+" "
      if resto > 0 then ret += self.ordinal(resto, genero); end
      return ret
    elsif valor == 1000
      return MILHAR_ORDINAL[genero][valor]+" "
    end
  end

  # Gera o valor em formato de Real
  #
  # Exemplo:
  #   Extenso.real_formatado(10) - R$ 10,00
  #   Extenso.real_formatado(1.55) - R$ 1,55
  #
  # @params[Object]
  def self.real_formatado(valor)
    "R$ #{format("%.2f", valor).to_s.gsub('.', ',')}"
  end
end