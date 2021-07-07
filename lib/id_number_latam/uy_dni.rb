module IdNumberLatam
  class UyDni < Base
    attr_reader :digit

    def initialize(id_number, opts = {})
      super
      @country = :uy
      @digit   = unformat.slice(-1)
    end

    def unformat
      id_number.gsub(/\D/, '')
    end

    def format
      dni = unformat
      digit = dni.slice!(-1)
      formatted_dni = dni.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
      [formatted_dni, digit].join("-")
    end

    def valid?
      return false unless valid_length
      dni = unformat
      digit = dni.slice!(-1)

      (10 - (dni.chars.zip("2987634".chars).map {|p| p.map(&:to_i).inject(&:*) }.sum % 10)).to_s == digit
    end

    def valid_length
      unformat.size == 8
    end
  end
end