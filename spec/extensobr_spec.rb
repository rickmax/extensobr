# frozen_string_literal: true

require 'spec_helper'

describe 'Extensobr' do
  context 'método extenso.numero' do
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
      expect(Extenso.numero(10_000)).to eq('Dez mil')
      expect(Extenso.numero(19_999)).to eq('Dezenove mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso centenas de milhares' do
      expect(Extenso.numero(100_000)).to eq('Cem mil')
      expect(Extenso.numero(199_999)).to eq('Cento e Noventa e Nove mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso milhões' do
      expect(Extenso.numero(1_000_000)).to eq('Um milhão')
      expect(Extenso.numero(999_999_999)).to eq('Novecentos e Noventa e Nove milhões, Novecentos e Noventa e Nove mil, Novecentos e Noventa e Nove')
    end
    # it 'retorno de erro para números acima de milhoões' do
    #   expect(Extenso.numero(1000000000)).to raise_error
    # end
  end

  context 'método extenso.moeda' do
    it 'retorno de valores por extenso unitários' do
      expect(Extenso.moeda(0)).to eq('Zero Centavos')
      expect(Extenso.moeda(0.01)).to eq('Um Centavo')
      expect(Extenso.moeda(0.02)).to eq('Dois Centavos')
    end
    it 'retorno de valores por extenso decimais do Dez' do
      expect(Extenso.moeda(0.10)).to eq('Dez Centavos')
      expect(Extenso.moeda(0.11)).to eq('Onze Centavos')
      expect(Extenso.moeda(0.12)).to eq('Doze Centavos')
      expect(Extenso.moeda(0.13)).to eq('Treze Centavos')
      expect(Extenso.moeda(0.14)).to eq('Quatorze Centavos')
      expect(Extenso.moeda(0.15)).to eq('Quinze Centavos')
      expect(Extenso.moeda(0.16)).to eq('Dezesseis Centavos')
      expect(Extenso.moeda(0.17)).to eq('Dezessete Centavos')
      expect(Extenso.moeda(0.18)).to eq('Dezoito Centavos')
      expect(Extenso.moeda(0.19)).to eq('Dezenove Centavos')
    end
    it 'retorno de valores por extenso decimais do Vinte até Noventa' do
      expect(Extenso.moeda(0.20)).to eq('Vinte Centavos')
      expect(Extenso.moeda(0.21)).to eq('Vinte e Um Centavos')
      expect(Extenso.moeda(0.31)).to eq('Trinta e Um Centavos')
      expect(Extenso.moeda(0.41)).to eq('Quarenta e Um Centavos')
      expect(Extenso.moeda(0.51)).to eq('Cinquenta e Um Centavos')
      expect(Extenso.moeda(0.61)).to eq('Sessenta e Um Centavos')
      expect(Extenso.moeda(0.71)).to eq('Setenta e Um Centavos')
      expect(Extenso.moeda(0.81)).to eq('Oitenta e Um Centavos')
      expect(Extenso.moeda(0.91)).to eq('Noventa e Um Centavos')
    end
    it 'retorno de valores por extenso centenas do cem' do
      expect(Extenso.moeda(100)).to eq('Cem Reais')
      expect(Extenso.moeda(101)).to eq('Cento e Um Reais')
      expect(Extenso.moeda(102.2)).to eq('Cento e Dois Reais e Vinte Centavos')
      expect(Extenso.moeda(110)).to eq('Cento e Dez Reais')
      expect(Extenso.moeda(111)).to eq('Cento e Onze Reais')
      expect(Extenso.moeda(120)).to eq('Cento e Vinte Reais')
      expect(Extenso.moeda(123.45)).to eq('Cento e Vinte e Três Reais e Quarenta e Cinco Centavos')
      expect(Extenso.moeda(121)).to eq('Cento e Vinte e Um Reais')
    end
    it 'retorno de valores por extenso centenas do duzentos' do
      expect(Extenso.moeda(200)).to eq('Duzentos Reais')
      expect(Extenso.moeda(201)).to eq('Duzentos e Um Reais')
      expect(Extenso.moeda(210)).to eq('Duzentos e Dez Reais')
      expect(Extenso.moeda(211)).to eq('Duzentos e Onze Reais')
      expect(Extenso.moeda(220)).to eq('Duzentos e Vinte Reais')
      expect(Extenso.moeda(221)).to eq('Duzentos e Vinte e Um Reais')
    end
    it 'retorno de valores por extenso milhares' do
      expect(Extenso.moeda(1000)).to eq('Um mil Reais')
      expect(Extenso.moeda(1999)).to eq('Um mil, Novecentos e Noventa e Nove Reais')
      expect(Extenso.moeda(1999.99)).to eq('Um mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
    end
    it 'retorno de valores por extenso dezenas de milhares' do
      expect(Extenso.moeda(10_000)).to eq('Dez mil Reais')
      expect(Extenso.moeda(19_999.99)).to eq('Dezenove mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
    end
    it 'retorno de valores por extenso centenas de milhares' do
      expect(Extenso.moeda(100_000)).to eq('Cem mil Reais')
      expect(Extenso.moeda(199_999.99)).to eq('Cento e Noventa e Nove mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
    end
    it 'retorno de valores por extenso milhões' do
      expect(Extenso.moeda(1_000_000)).to eq('Um milhão de Reais')
      expect(Extenso.moeda(25_100_000)).to eq('Vinte e Cinco milhões, Cem mil Reais')
      expect(Extenso.moeda(25_199_999.99)).to eq('Vinte e Cinco milhões, Cento e Noventa e Nove mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
      expect(Extenso.moeda(999_999_999)).to eq('Novecentos e Noventa e Nove milhões, Novecentos e Noventa e Nove mil, Novecentos e Noventa e Nove Reais')
    end

    # Desenvolver test para raise error quando numero for inválido
    # it 'retorno de erro para números acima de milhoões' do
    #   # expect(Extenso.numero(1000000000)).to raise_error
    # end
  end

  context 'método extenso.moeda customizado' do
    it 'retorno de valores por extenso milhões' do
      expect(
        Extenso.moeda(
          3570.82,
          2,
          ['Peseta', 'Pesetas', 1],
          ['Cêntimo', 'Cêntimos', 0]
        )
      ).to eq('Três mil, Quinhentas e Setenta Pesetas e Oitenta e Dois Cêntimos')
    end
  end

  context 'método extenso.real_formatado' do
    it 'retorno de valores para moéda brasileira R$' do
      expect(Extenso.real_formatado(0)).to eq('R$ 0,00')
      expect(Extenso.real_formatado(0.82)).to eq('R$ 0,82')
      expect(Extenso.real_formatado(1)).to eq('R$ 1,00')
      expect(Extenso.real_formatado(10)).to eq('R$ 10,00')
      expect(Extenso.real_formatado(10.5)).to eq('R$ 10,50')
      expect(Extenso.real_formatado(100.5)).to eq('R$ 100,50')
      expect(Extenso.real_formatado(3570.82)).to eq('R$ 3.570,82')
      expect(Extenso.real_formatado(30_570.82)).to eq('R$ 30.570,82')
      expect(Extenso.real_formatado(300_570.82)).to eq('R$ 300.570,82')
      expect(Extenso.real_formatado(1_300_570.82)).to eq('R$ 1.300.570,82')
      expect(Extenso.real_formatado(100_300_570.82)).to eq('R$ 100.300.570,82')
    end
  end

  context 'valor de payload nil' do
    it 'retorno quando envia nil com raise ligado' do
      expect { Extenso.numero(nil) }.to raise_error "[Exceção em Extenso.numero] Parâmetro 'valor' é nulo"
      expect { Extenso.moeda(nil) }.to raise_error "[Exceção em Extenso.moeda] Parâmetro 'valor' é nulo"
      expect { Extenso.ordinal(nil) }.to raise_error "[Exceção em Extenso.ordinal] Parâmetro 'valor' é nulo"
    end

    it 'retorno quando envia nil com raise desligado' do
      ENV['EXTENSO_RAISE_FOR_NIL'] = 'false'
      Object.send(:remove_const, :Extenso) if Kernel.const_defined?('Extenso')
      load 'lib/extensobr.rb'
      expect(Extenso.numero(nil)).to eq('Zero')
      expect(Extenso.moeda(nil)).to eq('Zero')
      expect(Extenso.ordinal(nil)).to eq('Zero')
    end
  end
end
