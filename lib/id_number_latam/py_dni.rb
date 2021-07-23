# frozen_string_literal: true

module IdNumberLatam
  class PyDni < Base
    attr_reader :digit

    def initialize(id_number, opts = {})
      super
      @country = :py
      @digit   = unformat.slice(-1)
    end

    def unformat
      id_number.gsub(/\D/, "")
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

      (11 - (dni.chars.reverse.zip("2345678".chars).map { |p| p.map(&:to_i).inject(&:*) }.sum % 11)).to_s == digit
    end

    def valid_length
      unformat.size == 8
    end
  end
end
