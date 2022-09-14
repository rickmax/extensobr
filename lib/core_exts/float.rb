# frozen_string_literal: true

require 'extensobr'

# Extende a classe Float adicionando o metodo por_extenso
Float.class_eval do
  def por_extenso(*args)
    Extenso.moeda(self, *args)
  end
end
