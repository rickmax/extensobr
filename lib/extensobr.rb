require 'extensobr/version'
class Extenso
  class << self
    BRL = { delimiter: '.', separator: ',', unit: 'R$', precision: 2, position: 'before' }

    NUM_SING = 0
    NUM_PLURAL = 1
    POS_GENERO = 2
    GENERO_MASC = 0
    GENERO_FEM = 1

    SEPARATOR = 'vírgula'

    VALOR_MAXIMO = 999_999_999

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

    # 'Mil' é invariável, seja em gênero, seja em número
    MILHAR = 'mil'

    MILHOES = {
      NUM_SING => 'milhão',
      NUM_PLURAL => 'milhões'
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
        9 => 'Nono'
      },
      GENERO_FEM => {
        1 => 'Primeira',
        2 => 'Segunda',
        3 => 'Terceira',
        4 => 'Quarta',
        5 => 'Quinta',
        6 => 'Sexta',
        7 => 'Sétima',
        8 => 'Oitava',
        9 => 'Nona'
      }
    }

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
        90 => 'Nonagésimo'
      },
      GENERO_FEM => {
        10 => 'Décima',
        20 => 'Vigésima',
        30 => 'Trigésima',
        40 => 'Quadragésima',
        50 => 'Quinquagésima',
        60 => 'Sexagésima',
        70 => 'Septuagésima',
        80 => 'Octogésima',
        90 => 'Nonagésima'
      }
    }

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
        900 => 'Noningentésimo'
      },
      GENERO_FEM => {
        100 => 'Centésima',
        200 => 'Ducentésima',
        300 => 'Trecentésima',
        400 => 'Quadringentésima',
        500 => 'Quingentésima',
        600 => 'Seiscentésima',
        700 => 'Septingentésima',
        800 => 'Octingentésima',
        900 => 'Noningentésima'
      }
    }

    MILHAR_ORDINAL = {
      GENERO_MASC => {
        1000 => 'Milésimo'
      },
      GENERO_FEM => {
        1000 => 'Milésima'
      }
    }

    def is_int(s)
      !Integer(s).nil?
    rescue StandardError
      false
    end

    def is_float?(str)
      !!Float(str)
    rescue StandardError
      false
    end

    #######################################################################################################################################

    def numero(valor, genero = GENERO_MASC, separator = SEPARATOR)
      # Gera a representação por extenso de um número, menor ou igual a VALOR_MAXIMO.
      #
      # PARÂMETROS:
      # valor (Integer/Float) O valor numérico cujo extenso se deseja gerar
      #
      # genero (Integer) [Opcional; valor padrão: Extenso::GENERO_MASC] O gênero gramatical (Extenso::GENERO_MASC ou Extenso::GENERO_FEM)
      # do extenso a ser gerado. Isso possibilita distinguir, por exemplo, entre 'duzentos e dois homens' e 'duzentas e duas mulheres'.
      #
      # VALOR DE RETORNO:
      # (String) O número por extenso

      # ----- VALIDAÇÃO DOS PARÂMETROS DE ENTRADA ----
      if !is_int(valor) && !is_float?(valor)
        raise "[Exceção em Extenso.numero] Parâmetro 'valor' não é numérico (recebido: '#{valor}')"
      end

      valor = valor.to_s
      parte_inteira = valor.split('.')[0].to_i
      fracao = valor.to_s.split('.')[1].to_i

      ret_parte_inteira = numero_inteiro(parte_inteira, genero)

      return ret_parte_inteira if fracao <= 0

      "#{ret_parte_inteira} #{separator} #{numero_inteiro(fracao, genero)}"
    end

    #######################################################################################################################################

    def moeda(
      valor,
      casas_decimais = 2,
      info_unidade = ['Real', 'Reais', GENERO_MASC],
      info_fracao = ['Centavo', 'Centavos', GENERO_MASC]
    )

      # Gera a representação por extenso de um valor monetário, maior que zero e menor ou igual a Extenso::VALOR_MAXIMO.
      #
      #
      # PARÂMETROS:
      # valor (Float) O valor monetário cujo extenso se deseja gerar.
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

      if !is_float?(valor.to_f.round(casas_decimais).to_s)
        raise "[Exceção em Extenso.moeda] Parâmetro 'valor' não é numérico (recebido: '#{valor}')"

      elsif valor <= 0
        'Zero'

      elsif !is_int(casas_decimais) || casas_decimais < 0
        raise "[Exceção em Extenso.moeda] Parâmetro 'casas_decimais' não é numérico ou é menor que zero (recebido: '#{casas_decimais}')"

      elsif info_unidade.class != Array || info_unidade.length < 3
        temp = info_unidade.instance_of?(Array) ? '[' + info_unidade.join(', ') + ']' : "'#{info_unidade}'"
        raise "[Exceção em Extenso.moeda] Parâmetro 'info_unidade' não é uma matriz com 3 (três) elementos (recebido: #{temp})"

      elsif info_unidade[POS_GENERO] != GENERO_MASC && info_unidade[POS_GENERO] != GENERO_FEM
        raise "Exceção em Extenso: valor incorreto para o parâmetro 'info_unidade[POS_GENERO]' (recebido: '#{info_unidade[POS_GENERO]}')"

      elsif info_fracao.class != Array || info_fracao.length < 3
        temp = info_fracao.instance_of?(Array) ? '[' + info_fracao.join(', ') + ']' : "'#{info_fracao}'"
        raise "[Exceção em Extenso.moeda] Parâmetro 'info_fracao' não é uma matriz com 3 (três) elementos (recebido: #{temp})"

      elsif info_fracao[POS_GENERO] != GENERO_MASC && info_fracao[POS_GENERO] != GENERO_FEM
        raise "[Exceção em Extenso.moeda] valor incorreto para o parâmetro 'info_fracao[POS_GENERO]' (recebido: '#{info_fracao[POS_GENERO]}')."

      end

      # -----------------------------------------------

      ret = ''

      valor = format("%#{casas_decimais.to_f / 100}f", valor)
      # A parte inteira do valor monetário corresponde ao valor passado antes do '.' no tipo float.
      parte_inteira = valor.split('.')[0].to_i

      # A parte fracionária ('centavos'), por seu turno, corresponderá ao valor passado depois do  '.'
      fracao = valor.to_s.split('.')[1].to_i

      # os préstimos do método Extenso::numero().
      if parte_inteira > 0
        ret = numero_inteiro(parte_inteira,
                             info_unidade[POS_GENERO]) + (parte_inteira >= 1_000_000 && (parte_inteira.to_s.chars.reverse[5] == '0') ? ' de ' : ' ')
        ret += parte_inteira == 1 ? info_unidade[NUM_SING] : info_unidade[NUM_PLURAL]
        ret
      end

      # De forma semelhante, o extenso da fracao somente será gerado se esta for maior que zero. */
      if fracao > 0
        # Se a parte_inteira for maior que zero, o extenso para ela já terá sido gerado. Antes de juntar os
        # centavos, precisamos colocar o conectivo 'e'.
        ret += ' e ' if parte_inteira > 0
        ret += numero_inteiro(fracao, info_fracao[POS_GENERO]) + ' '
        ret += fracao == 1 ? info_fracao[NUM_SING] : info_fracao[NUM_PLURAL]
      end

      if valor.to_f == 0
        ret += numero_inteiro(fracao, info_fracao[POS_GENERO]) + ' '
        ret += parte_inteira == 1 ? info_fracao[NUM_SING] : info_fracao[NUM_PLURAL]
      end

      ret
    end

    ######################################################################################################################################################
    def ordinal(valor, genero = GENERO_MASC)
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
        'Zero'
        # raise "[Exceção em Extenso.numero] Parâmetro 'valor' igual a ou menor que zero (recebido: '#{valor}')"
      elsif valor > VALOR_MAXIMO
        raise '[Exceção em Extenso::numero] Parâmetro ''valor'' deve ser um inteiro entre 1 e ' + VALOR_MAXIMO.to_s + " (recebido: '#{valor}')"
      elsif genero != GENERO_MASC && genero != GENERO_FEM
        raise "Exceção em Extenso: valor incorreto para o parâmetro 'genero' (recebido: '#{genero}')"
      # ------------------------------------------------
      elsif valor >= 1 && valor <= 9
        UNIDADES_ORDINAL[genero][valor]
      elsif valor >= 10 && valor <= 99
        dezena = valor - (valor % 10)
        resto = valor - dezena
        ret = DEZENAS_ORDINAL[genero][dezena] + ' '
        ret += ordinal(resto, genero) if resto > 0
        ret
      elsif valor >= 100 && valor <= 999
        centena = valor - (valor % 100)
        resto = valor - centena
        ret = CENTENAS_ORDINAL[genero][centena] + ' '
        ret += ordinal(resto, genero) if resto > 0
        ret
      elsif valor == 1000
        MILHAR_ORDINAL[genero][valor] + ' '
      end
    end

    # Gera o valor em formato de Real
    #
    # Exemplo:
    #   Extenso.real_formatado(10) - R$ 10,00
    #   Extenso.real_formatado(1.55) - R$ 1,55
    #
    # @params[Object]
    def real_formatado(valor)
      float_valor = format('%#0.02f', valor)
      float_valor = float_valor.chars.reverse.insert(6, '.').reverse.join if float_valor.chars.count >= 7

      float_valor = float_valor.chars.reverse.insert(10, '.').reverse.join if float_valor.chars.count >= 11

      float_valor = float_valor.chars.reverse
      float_valor[2] = ','

      "R$ #{float_valor.reverse.join}"
    end

  private

    def numero_inteiro(valor, genero = GENERO_MASC)
      if !is_int(valor)
        raise "[Exceção em Extenso.numero] Parâmetro 'valor' não é numérico (recebido: '#{valor}')"
      elsif valor <= 0
        'Zero'
      elsif valor > VALOR_MAXIMO
        raise "[Exceção em Extenso.numero] Parâmetro '#{valor} deve ser um inteiro entre 1 e #{VALOR_MAXIMO} (recebido: '#{valor}')"
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
        ret += ' e ' + numero_inteiro(resto, genero) if resto > 0
        ret

      elsif valor == 100
        CENTENA_EXATA

      elsif valor >= 101 && valor <= 999
        centena = valor - (valor % 100)
        ret = CENTENAS[genero][centena] # As centenas (exceto 'cento') variam em gênero
        # Chamada recursiva à função para processar resto se este for maior que zero.
        # O conectivo 'e' é utilizado entre centenas e dezenas.
        resto = valor - centena
        ret += ' e ' + numero_inteiro(resto, genero) if resto > 0
        ret

      elsif valor >= 1000 && valor <= 999_999
        # A função 'floor' é utilizada para encontrar o inteiro da divisão de valor por 1000,
        # assim determinando a quantidade de milhares. O resultado é enviado a uma chamada recursiva
        # da função. A palavra 'mil' não se flexiona.
        milhar = (valor / 1000).floor
        ret = numero_inteiro(milhar, GENERO_MASC) + ' ' + MILHAR # 'Mil' é do gênero masculino
        resto = valor % 1000
        # Chamada recursiva à função para processar resto se este for maior que zero.
        # O conectivo 'e' é utilizado entre milhares e números entre 1 e 99, bem como antes de centenas exatas.
        if resto > 0 && ((resto >= 1 && resto <= 99) || resto % 100 == 0)
          ret += ' e ' + numero_inteiro(resto, genero)
        # Nos demais casos, após o milhar é utilizada a vírgula.
        elsif resto > 0
          ret += ', ' + numero_inteiro(resto, genero)
        end
        ret

      elsif valor >= 100_000 && valor <= VALOR_MAXIMO
        # A função 'floor' é utilizada para encontrar o inteiro da divisão de valor por 1000000,
        # assim determinando a quantidade de milhões. O resultado é enviado a uma chamada recursiva
        # da função. A palavra 'milhão' flexiona-se no plural.
        milhoes = (valor / 1_000_000).floor
        ret = numero_inteiro(milhoes, GENERO_MASC) + ' ' # Milhão e milhões são do gênero masculino

        # Se a o número de milhões for maior que 1, deve-se utilizar a forma flexionada no plural
        ret += milhoes == 1 ? MILHOES[NUM_SING] : MILHOES[NUM_PLURAL]

        resto = valor % 1_000_000

        # Chamada recursiva à função para processar resto se este for maior que zero.
        # O conectivo 'e' é utilizado entre milhões e números entre 1 e 99, bem como antes de centenas exatas.
        if resto && (resto >= 1 && resto <= 99)
          ret += " e #{numero_inteiro(resto, genero)}"
        # Nos demais casos, após o milhão é utilizada a vírgula.
        elsif resto.positive?
          ret += ", #{numero_inteiro(resto, genero)}"
        end
        ret

      end
    end
  end
end
