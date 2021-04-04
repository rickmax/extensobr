require 'spec_helper'

describe 'Extensobr' do
  context "método extenso.numero" do
    it 'retorno de numeros por extenso unitários' do
      expect(Extenso.numero(0)).to eq('Zero')
      expect(Extenso.numero(1)).to eq('Um')
      expect(Extenso.numero(2)).to eq('Dois')
      expect(Extenso.numero(3)).to eq('Três')
      expect(Extenso.numero(4)).to eq('Quatro')
      expect(Extenso.numero(5)).to eq('Cinco')
      expect(Extenso.numero(6)).to eq('Seis')
      expect(Extenso.numero(7)).to eq('Sete')
      expect(Extenso.numero(8)).to eq('Oito')
      expect(Extenso.numero(9)).to eq('Nove')
    end
    it 'retorno de numeros por extenso decimais do Dez' do
      expect(Extenso.numero(10)).to eq('Dez')
      expect(Extenso.numero(11)).to eq('Onze')
      expect(Extenso.numero(12)).to eq('Doze')
      expect(Extenso.numero(13)).to eq('Treze')
      expect(Extenso.numero(14)).to eq('Quatorze')
      expect(Extenso.numero(15)).to eq('Quinze')
      expect(Extenso.numero(16)).to eq('Dezesseis')
      expect(Extenso.numero(17)).to eq('Dezessete')
      expect(Extenso.numero(18)).to eq('Dezoito')
      expect(Extenso.numero(19)).to eq('Dezenove')
    end
    it 'retorno de numeros por extenso decimais do Vinte até Noventa' do
      expect(Extenso.numero(20)).to eq('Vinte')
      expect(Extenso.numero(21)).to eq('Vinte e Um')
      expect(Extenso.numero(31)).to eq('Trinta e Um')
      expect(Extenso.numero(41)).to eq('Quarenta e Um')
      expect(Extenso.numero(51)).to eq('Cinquenta e Um')
      expect(Extenso.numero(61)).to eq('Sessenta e Um')
      expect(Extenso.numero(71)).to eq('Setenta e Um')
      expect(Extenso.numero(81)).to eq('Oitenta e Um')
      expect(Extenso.numero(91)).to eq('Noventa e Um')
    end
    it 'retorno de numeros por extenso centenas do cem' do
      expect(Extenso.numero(100)).to eq('Cem')
      expect(Extenso.numero(101)).to eq('Cento e Um')
      expect(Extenso.numero(110)).to eq('Cento e Dez')
      expect(Extenso.numero(111)).to eq('Cento e Onze')
      expect(Extenso.numero(120)).to eq('Cento e Vinte')
      expect(Extenso.numero(121)).to eq('Cento e Vinte e Um')
    end
    it 'retorno de numeros por extenso centenas do duzentos' do
      expect(Extenso.numero(200)).to eq('Duzentos')
      expect(Extenso.numero(201)).to eq('Duzentos e Um')
      expect(Extenso.numero(210)).to eq('Duzentos e Dez')
      expect(Extenso.numero(211)).to eq('Duzentos e Onze')
      expect(Extenso.numero(220)).to eq('Duzentos e Vinte')
      expect(Extenso.numero(221)).to eq('Duzentos e Vinte e Um')
    end
    it 'retorno de numeros por extenso milhares' do
      expect(Extenso.numero(1000)).to eq('Um mil')
      expect(Extenso.numero(1999)).to eq('Um mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso dezenas de milhares' do
      expect(Extenso.numero(10000)).to eq('Dez mil')
      expect(Extenso.numero(19999)).to eq('Dezenove mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso centenas de milhares' do
      expect(Extenso.numero(100000)).to eq('Cem mil')
      expect(Extenso.numero(199999)).to eq('Cento e Noventa e Nove mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso milhões' do
      expect(Extenso.numero(1000000)).to eq('Um milhão')
      expect(Extenso.numero(999999999)).to eq('Novecentos e Noventa e Nove milhões, Novecentos e Noventa e Nove mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de erro para números acima de milhoões' do
      # expect(Extenso.numero(1000000000)).to raise_error
    end
  end
end