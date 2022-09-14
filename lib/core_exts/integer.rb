# frozen_string_literal: true

require 'extensobr'

# Extende a classe Integer adicionando o metodo por_extenso e por_extenso_ordinal
Integer.class_eval do
  def por_extenso(*args)
    Extenso.numero(self, *args)
  end

  def por_extenso_ordinal(*args)
    Extenso.ordinal(self, *args)
  end
end
