# frozen_string_literal: true

module IdNumberLatam
  class ClDni < Base
    attr_reader :digit

    def initialize(id_number, opts = {})
      super
      @country = :cl
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

      [*0..9, "K"][dni.to_s.reverse.chars.inject([0, 0]) { |(i, a), n| [i + 1, a - n.to_i * (i % 6 + 2)] }[1] % 11].to_s == digit
    end

    private

    def valid_length
      unformat.size >= 8 && unformat.size <= 9
    end
  end
end
