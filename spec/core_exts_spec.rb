# frozen_string_literal: true

require 'spec_helper'

describe 'Core Extensions' do
  context 'extensão do integer para numero' do
    it 'retorno de numeros por extenso unitários' do
      expect(0.por_extenso).to eq('Zero')
      expect(1.por_extenso).to eq('Um')
      expect(2.por_extenso).to eq('Dois')
      expect(3.por_extenso).to eq('Três')
      expect(4.por_extenso).to eq('Quatro')
      expect(5.por_extenso).to eq('Cinco')
      expect(6.por_extenso).to eq('Seis')
      expect(7.por_extenso).to eq('Sete')
      expect(8.por_extenso).to eq('Oito')
      expect(9.por_extenso).to eq('Nove')
    end
    it 'retorno de numeros por extenso decimais do Dez' do
      expect(10.por_extenso).to eq('Dez')
      expect(11.por_extenso).to eq('Onze')
      expect(12.por_extenso).to eq('Doze')
      expect(13.por_extenso).to eq('Treze')
      expect(14.por_extenso).to eq('Quatorze')
      expect(15.por_extenso).to eq('Quinze')
      expect(16.por_extenso).to eq('Dezesseis')
      expect(17.por_extenso).to eq('Dezessete')
      expect(18.por_extenso).to eq('Dezoito')
      expect(19.por_extenso).to eq('Dezenove')
    end
    it 'retorno de numeros por extenso decimais do Vinte até Noventa' do
      expect(20.por_extenso).to eq('Vinte')
      expect(21.por_extenso).to eq('Vinte e Um')
      expect(31.por_extenso).to eq('Trinta e Um')
      expect(41.por_extenso).to eq('Quarenta e Um')
      expect(51.por_extenso).to eq('Cinquenta e Um')
      expect(61.por_extenso).to eq('Sessenta e Um')
      expect(71.por_extenso).to eq('Setenta e Um')
      expect(81.por_extenso).to eq('Oitenta e Um')
      expect(91.por_extenso).to eq('Noventa e Um')
    end
    it 'retorno de numeros por extenso centenas do cem' do
      expect(100.por_extenso).to eq('Cem')
      expect(101.por_extenso).to eq('Cento e Um')
      expect(110.por_extenso).to eq('Cento e Dez')
      expect(111.por_extenso).to eq('Cento e Onze')
      expect(120.por_extenso).to eq('Cento e Vinte')
      expect(121.por_extenso).to eq('Cento e Vinte e Um')
    end
    it 'retorno de numeros por extenso centenas do duzentos' do
      expect(200.por_extenso).to eq('Duzentos')
      expect(201.por_extenso).to eq('Duzentos e Um')
      expect(210.por_extenso).to eq('Duzentos e Dez')
      expect(211.por_extenso).to eq('Duzentos e Onze')
      expect(220.por_extenso).to eq('Duzentos e Vinte')
      expect(221.por_extenso).to eq('Duzentos e Vinte e Um')
    end
    it 'retorno de numeros por extenso milhares' do
      expect(1000.por_extenso).to eq('Um mil')
      expect(1999.por_extenso).to eq('Um mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso dezenas de milhares' do
      expect(10_000.por_extenso).to eq('Dez mil')
      expect(19_999.por_extenso).to eq('Dezenove mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso centenas de milhares' do
      expect(100_000.por_extenso).to eq('Cem mil')
      expect(199_999.por_extenso).to eq('Cento e Noventa e Nove mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso milhões' do
      expect(1_000_000.por_extenso).to eq('Um milhão')
      expect(999_999_999.por_extenso).to eq('Novecentos e Noventa e Nove milhões, Novecentos e Noventa e Nove mil, Novecentos e Noventa e Nove')
    end
  end

  context 'extensão do float para moeda' do
    it 'retorno de valores por extenso unitários' do
      expect(0.00.por_extenso).to eq('Zero Centavos')
      expect(0.01.por_extenso).to eq('Um Centavo')
      expect(0.02.por_extenso).to eq('Dois Centavos')
    end
    it 'retorno de valores por extenso decimais do Dez' do
      expect(0.10.por_extenso).to eq('Dez Centavos')
      expect(0.11.por_extenso).to eq('Onze Centavos')
      expect(0.12.por_extenso).to eq('Doze Centavos')
      expect(0.13.por_extenso).to eq('Treze Centavos')
      expect(0.14.por_extenso).to eq('Quatorze Centavos')
      expect(0.15.por_extenso).to eq('Quinze Centavos')
      expect(0.16.por_extenso).to eq('Dezesseis Centavos')
      expect(0.17.por_extenso).to eq('Dezessete Centavos')
      expect(0.18.por_extenso).to eq('Dezoito Centavos')
      expect(0.19.por_extenso).to eq('Dezenove Centavos')
    end
    it 'retorno de valores por extenso decimais do Vinte até Noventa' do
      expect(0.20.por_extenso).to eq('Vinte Centavos')
      expect(0.21.por_extenso).to eq('Vinte e Um Centavos')
      expect(0.31.por_extenso).to eq('Trinta e Um Centavos')
      expect(0.41.por_extenso).to eq('Quarenta e Um Centavos')
      expect(0.51.por_extenso).to eq('Cinquenta e Um Centavos')
      expect(0.61.por_extenso).to eq('Sessenta e Um Centavos')
      expect(0.71.por_extenso).to eq('Setenta e Um Centavos')
      expect(0.81.por_extenso).to eq('Oitenta e Um Centavos')
      expect(0.91.por_extenso).to eq('Noventa e Um Centavos')
    end
    it 'retorno de valores por extenso centenas do cem' do
      expect(100.00.por_extenso).to eq('Cem Reais')
      expect(101.00.por_extenso).to eq('Cento e Um Reais')
      expect(102.2.por_extenso).to eq('Cento e Dois Reais e Vinte Centavos')
      expect(110.00.por_extenso).to eq('Cento e Dez Reais')
      expect(111.00.por_extenso).to eq('Cento e Onze Reais')
      expect(120.00.por_extenso).to eq('Cento e Vinte Reais')
      expect(123.45.por_extenso).to eq('Cento e Vinte e Três Reais e Quarenta e Cinco Centavos')
      expect(121.00.por_extenso).to eq('Cento e Vinte e Um Reais')
    end
    it 'retorno de valores por extenso centenas do duzentos' do
      expect(200.00.por_extenso).to eq('Duzentos Reais')
      expect(201.00.por_extenso).to eq('Duzentos e Um Reais')
      expect(210.00.por_extenso).to eq('Duzentos e Dez Reais')
      expect(211.00.por_extenso).to eq('Duzentos e Onze Reais')
      expect(220.00.por_extenso).to eq('Duzentos e Vinte Reais')
      expect(221.00.por_extenso).to eq('Duzentos e Vinte e Um Reais')
    end
    it 'retorno de valores por extenso milhares' do
      expect(1000.00.por_extenso).to eq('Um mil Reais')
      expect(1999.00.por_extenso).to eq('Um mil, Novecentos e Noventa e Nove Reais')
      expect(1999.99.por_extenso).to eq('Um mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
    end
    it 'retorno de valores por extenso dezenas de milhares' do
      expect(10_000.00.por_extenso).to eq('Dez mil Reais')
      expect(19_999.99.por_extenso).to eq('Dezenove mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
    end
    it 'retorno de valores por extenso centenas de milhares' do
      expect(100_000.00.por_extenso).to eq('Cem mil Reais')
      expect(199_999.99.por_extenso).to eq('Cento e Noventa e Nove mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
    end
    it 'retorno de valores por extenso milhões' do
      expect(1_000_000.00.por_extenso).to eq('Um milhão de Reais')
      expect(25_100_000.00.por_extenso).to eq('Vinte e Cinco milhões, Cem mil Reais')
      expect(25_199_999.99.por_extenso).to eq('Vinte e Cinco milhões, Cento e Noventa e Nove mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
      expect(999_999_999.00.por_extenso).to eq('Novecentos e Noventa e Nove milhões, Novecentos e Noventa e Nove mil, Novecentos e Noventa e Nove Reais')
    end
  end

  context 'extensão do float para moeda customizado' do
    it 'retorno de valores por extenso milhões' do
      expect(
        3570.82.por_extenso(
          2,
          ['Peseta', 'Pesetas', 1],
          ['Cêntimo', 'Cêntimos', 0]
        )
      ).to eq('Três mil, Quinhentas e Setenta Pesetas e Oitenta e Dois Cêntimos')
    end
  end

  context 'extensão da string para numero' do
    it 'retorno de numeros por extenso unitários' do
      expect('0'.por_extenso).to eq('Zero')
      expect('1'.por_extenso).to eq('Um')
      expect('2'.por_extenso).to eq('Dois')
      expect('3'.por_extenso).to eq('Três')
      expect('4'.por_extenso).to eq('Quatro')
      expect('5'.por_extenso).to eq('Cinco')
      expect('6'.por_extenso).to eq('Seis')
      expect('7'.por_extenso).to eq('Sete')
      expect('8'.por_extenso).to eq('Oito')
      expect('9'.por_extenso).to eq('Nove')
    end
    it 'retorno de numeros por extenso decimais do Dez' do
      expect('10'.por_extenso).to eq('Dez')
      expect('11'.por_extenso).to eq('Onze')
      expect('12'.por_extenso).to eq('Doze')
      expect('13'.por_extenso).to eq('Treze')
      expect('14'.por_extenso).to eq('Quatorze')
      expect('15'.por_extenso).to eq('Quinze')
      expect('16'.por_extenso).to eq('Dezesseis')
      expect('17'.por_extenso).to eq('Dezessete')
      expect('18'.por_extenso).to eq('Dezoito')
      expect('19'.por_extenso).to eq('Dezenove')
    end
    it 'retorno de numeros por extenso decimais do Vinte até Noventa' do
      expect('20'.por_extenso).to eq('Vinte')
      expect('21'.por_extenso).to eq('Vinte e Um')
      expect('31'.por_extenso).to eq('Trinta e Um')
      expect('41'.por_extenso).to eq('Quarenta e Um')
      expect('51'.por_extenso).to eq('Cinquenta e Um')
      expect('61'.por_extenso).to eq('Sessenta e Um')
      expect('71'.por_extenso).to eq('Setenta e Um')
      expect('81'.por_extenso).to eq('Oitenta e Um')
      expect('91'.por_extenso).to eq('Noventa e Um')
    end
    it 'retorno de numeros por extenso centenas do cem' do
      expect('100'.por_extenso).to eq('Cem')
      expect('101'.por_extenso).to eq('Cento e Um')
      expect('110'.por_extenso).to eq('Cento e Dez')
      expect('111'.por_extenso).to eq('Cento e Onze')
      expect('120'.por_extenso).to eq('Cento e Vinte')
      expect('121'.por_extenso).to eq('Cento e Vinte e Um')
    end
    it 'retorno de numeros por extenso centenas do duzentos' do
      expect('200'.por_extenso).to eq('Duzentos')
      expect('201'.por_extenso).to eq('Duzentos e Um')
      expect('210'.por_extenso).to eq('Duzentos e Dez')
      expect('211'.por_extenso).to eq('Duzentos e Onze')
      expect('220'.por_extenso).to eq('Duzentos e Vinte')
      expect('221'.por_extenso).to eq('Duzentos e Vinte e Um')
    end
    it 'retorno de numeros por extenso milhares' do
      expect('1000'.por_extenso).to eq('Um mil')
      expect('1999'.por_extenso).to eq('Um mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso dezenas de milhares' do
      expect('10_000'.por_extenso).to eq('Dez mil')
      expect('19_999'.por_extenso).to eq('Dezenove mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso centenas de milhares' do
      expect('100_000'.por_extenso).to eq('Cem mil')
      expect('199_999'.por_extenso).to eq('Cento e Noventa e Nove mil, Novecentos e Noventa e Nove')
    end
    it 'retorno de numeros por extenso milhões' do
      expect('1_000_000'.por_extenso).to eq('Um milhão')
      expect('999_999_999'.por_extenso).to eq('Novecentos e Noventa e Nove milhões, Novecentos e Noventa e Nove mil, Novecentos e Noventa e Nove')
    end
  end

  context 'extensão da string para moeda' do
    it 'retorno de valores por extenso unitários' do
      expect('0.00'.por_extenso).to eq('Zero Centavos')
      expect('0.01'.por_extenso).to eq('Um Centavo')
      expect('0.02'.por_extenso).to eq('Dois Centavos')
    end
    it 'retorno de valores por extenso decimais do Dez' do
      expect('0.10'.por_extenso).to eq('Dez Centavos')
      expect('0.11'.por_extenso).to eq('Onze Centavos')
      expect('0.12'.por_extenso).to eq('Doze Centavos')
      expect('0.13'.por_extenso).to eq('Treze Centavos')
      expect('0.14'.por_extenso).to eq('Quatorze Centavos')
      expect('0.15'.por_extenso).to eq('Quinze Centavos')
      expect('0.16'.por_extenso).to eq('Dezesseis Centavos')
      expect('0.17'.por_extenso).to eq('Dezessete Centavos')
      expect('0.18'.por_extenso).to eq('Dezoito Centavos')
      expect('0.19'.por_extenso).to eq('Dezenove Centavos')
    end
    it 'retorno de valores por extenso decimais do Vinte até Noventa' do
      expect('0.20'.por_extenso).to eq('Vinte Centavos')
      expect('0.21'.por_extenso).to eq('Vinte e Um Centavos')
      expect('0.31'.por_extenso).to eq('Trinta e Um Centavos')
      expect('0.41'.por_extenso).to eq('Quarenta e Um Centavos')
      expect('0.51'.por_extenso).to eq('Cinquenta e Um Centavos')
      expect('0.61'.por_extenso).to eq('Sessenta e Um Centavos')
      expect('0.71'.por_extenso).to eq('Setenta e Um Centavos')
      expect('0.81'.por_extenso).to eq('Oitenta e Um Centavos')
      expect('0.91'.por_extenso).to eq('Noventa e Um Centavos')
    end
    it 'retorno de valores por extenso centenas do cem' do
      expect('100.00'.por_extenso).to eq('Cem Reais')
      expect('101.00'.por_extenso).to eq('Cento e Um Reais')
      expect('102.2'.por_extenso).to eq('Cento e Dois Reais e Vinte Centavos')
      expect('110.00'.por_extenso).to eq('Cento e Dez Reais')
      expect('111.00'.por_extenso).to eq('Cento e Onze Reais')
      expect('120.00'.por_extenso).to eq('Cento e Vinte Reais')
      expect('123.45'.por_extenso).to eq('Cento e Vinte e Três Reais e Quarenta e Cinco Centavos')
      expect('121.00'.por_extenso).to eq('Cento e Vinte e Um Reais')
    end
    it 'retorno de valores por extenso centenas do duzentos' do
      expect('200.00'.por_extenso).to eq('Duzentos Reais')
      expect('201.00'.por_extenso).to eq('Duzentos e Um Reais')
      expect('210.00'.por_extenso).to eq('Duzentos e Dez Reais')
      expect('211.00'.por_extenso).to eq('Duzentos e Onze Reais')
      expect('220.00'.por_extenso).to eq('Duzentos e Vinte Reais')
      expect('221.00'.por_extenso).to eq('Duzentos e Vinte e Um Reais')
    end
    it 'retorno de valores por extenso milhares' do
      expect('1000.00'.por_extenso).to eq('Um mil Reais')
      expect('1999.00'.por_extenso).to eq('Um mil, Novecentos e Noventa e Nove Reais')
      expect('1999.99'.por_extenso).to eq('Um mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
    end
    it 'retorno de valores por extenso dezenas de milhares' do
      expect('10_000.00'.por_extenso).to eq('Dez mil Reais')
      expect('19_999.99'.por_extenso).to eq('Dezenove mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
    end
    it 'retorno de valores por extenso centenas de milhares' do
      expect('100_000.00'.por_extenso).to eq('Cem mil Reais')
      expect('199_999.99'.por_extenso).to eq('Cento e Noventa e Nove mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
    end
    it 'retorno de valores por extenso milhões' do
      expect('1_000_000.00'.por_extenso).to eq('Um milhão de Reais')
      expect('25_100_000.00'.por_extenso).to eq('Vinte e Cinco milhões, Cem mil Reais')
      expect('25_199_999.99'.por_extenso).to eq('Vinte e Cinco milhões, Cento e Noventa e Nove mil, Novecentos e Noventa e Nove Reais e Noventa e Nove Centavos')
      expect('999_999_999.00'.por_extenso).to eq('Novecentos e Noventa e Nove milhões, Novecentos e Noventa e Nove mil, Novecentos e Noventa e Nove Reais')
    end
  end

  context 'extensão da string para moeda customizado' do
    it 'retorno de valores por extenso milhões' do
      expect(
        '3570.82'.por_extenso(
          :moeda,
          2,
          ['Peseta', 'Pesetas', 1],
          ['Cêntimo', 'Cêntimos', 0]
        )
      ).to eq('Três mil, Quinhentas e Setenta Pesetas e Oitenta e Dois Cêntimos')
    end
  end
end
