# frozen_string_literal: true

module IdNumberLatam
  class PeDni < Base
    attr_reader :digit

    NUMBERS = [6, 7, 8, 9, 0, 1, 1, 2, 3, 4, 5].freeze
    LETTER  = %w[K A B C D E F G H I J].freeze

    def initialize(id_number, opts = {})
      super
      @country = :pe
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

      key = (11 - (dni.chars.zip("32765432".chars).map { |p| p.map(&:to_i).inject(&:*) }.sum % 11))

      NUMBERS[key].to_s == digit
    end

    def valid_length
      unformat.size == 9
    end
  end
end
