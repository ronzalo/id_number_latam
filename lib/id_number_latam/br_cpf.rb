module IdNumberLatam
  class BrCPF < Base
    # This Class allows validating the Argentinean Number (DNI). 
    # This document does not have a verification digit.

    def initialize(id_number, opts = {})
      super
      @country = :br
      @digit   = unformat[-2..-1]
    end

    def unformat
      id_number.gsub(/\D/, "")
    end

    def format
      cpf = unformat
      groups = cpf.match(/(\d{3})(\d{3})(\d{3})(\d{2})/)[1..-1]
      formatted_cpf="%s.%s.%s-%s" % groups
    end

    def valid?
      return false unless valid_length
      cpf = unformat
      digits = (cpf[-2..-1]).to_i
      first_slice, second_slice = cpf[0..-3], cpf[0..-2]
      pre_calc_lambda = lambda { |x, str| str.chars.each_with_index.reduce(0) { |acc, (d, i)| (acc += d.to_i*(x-i)) } }
      first_digit = pre_calc_lambda.call(10, first_slice) * 10 % 11 
      first_digit = first_digit == 10 ? 0 : first_digit
      second_digit = pre_calc_lambda.call(11, second_slice) * 10 % 11
      verification_digits = ("%s%s" % [first_digit, second_digit]).to_i
      return true unless verification_digits != digits
    end

    def valid_length
      unformat.size == 11
    end

  end
end