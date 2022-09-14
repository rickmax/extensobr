# frozen_string_literal: true

require 'extensobr'

# Extende a classe Integer adicionando o metodo por_extenso, por_extenso_moeda e por_extenso_numero
String.class_eval do
  # Um wapper para o metodo Extenso.numero ou Extenso.moeda
  # PARÂMETROS:
  # type (Symbol) O tipo especifico que deseja gerar
  #
  # Caso o tipo não seja informado é inferido primeiro tentando encontrar um padrão de Float
  # caso encontre ele supõe que o tipo é moeda. Caso contrario o tipo será numero.
  def por_extenso(type = nil, *args)
    return por_extenso_numero(*args) if type == :numero

    return por_extenso_moeda(*args) if type == :moeda

    return por_extenso_ordinal(*args) if type == :ordinal

    number = scan(/\d+[,.]\d+/).first
    return por_extenso_moeda(*args) unless number.nil? || number.empty?

    por_extenso_numero(*args)
  end

  def por_extenso_moeda(*args)
    number = gsub('_', '').scan(/\d+[,.]\d+/).first
    Extenso.moeda(number.to_f, *args)
  end

  def por_extenso_numero(*args)
    number = scan(/\d/)&.join('')
    Extenso.numero(number&.to_i, *args)
  end

  def por_extenso_ordinal(*args)
    number = scan(/\d/)&.join('')
    Extenso.ordinal(number&.to_i, *args)
  end
end
