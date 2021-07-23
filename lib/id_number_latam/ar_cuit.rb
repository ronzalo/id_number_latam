module IdNumberLatam
  class ArCUIT < Base

    def initialize(id_number, opts = {})
      super
      @country = :ar
      @digit   = unformat[-1]
    end

    def unformat
      id_number.gsub(/\D/, "")
    end

    def format
      dni = unformat
      groups = dni.match(/(\d{2})(\d+)(\d)/)[1..-1]
      "%s-%s-%s" % groups
    end

    def valid?
      return false unless valid_length
      cuit = unformat
      xy, slice = cuit[0..1], cuit[0..-2]
      digit = (cuit[-1]).to_i
      factors = [5, 4, 3, 2, 7, 6, 5, 4, 3, 2]
      pre_calc_lambda = lambda { |str| str.chars.each_with_index.reduce(0) { |acc, (d, i)| (acc += d.to_i*(factors[i])) } }
      11 - (pre_calc_lambda.call(slice) % 11) == digit
    end

    def valid_length
      unformat.size == 11
    end

  end
end