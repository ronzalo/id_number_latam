module IdNumberLatam
  class EcDni < Base
    attr_reader :digit, :third_digit

    def initialize(id_number, opts = {})
      super
      @country     = :ec
      @third_digit = unformat[2]
      @digit       = @third_digit == "6" ? unformat[8] : unformat[9]
    end

    def coefficient
      if (0..5).include? @third_digit.to_i
        "212121212"
      elsif @third_digit == "6"
        "32765432"
      elsif @third_digit == "9"
        "432765432"
      end
    end

    def modulo
      (0..5).include?(@third_digit.to_i) ? 10 : 11
    end

    def format
      dni = unformat
      digit = dni.slice!(-1)
      formatted_dni = dni.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
      [formatted_dni, digit].join("-")
    end

    def unformat
      id_number.gsub(/\D/, '')
    end

    def valid?
      return false unless valid_length
      return false unless unformat[0..1].to_i <= 24
      return false unless [0,1,2,3,4,5,6,9].include?(unformat[2].to_i)

      dni = unformat[0..8]
      (modulo - (dni.chars.zip(coefficient.chars).map {|p| p.map(&:to_i).inject(&:*) }.map {|r| operation_block(r) }.sum % modulo)).to_s == @digit
    end

    def operation_block(prod)
      if (0..5).include? @third_digit.to_i
        prod >= 10 ? prod - 9 : prod
      else
        prod
      end
    end

    def valid_length
      [10, 13].include?(unformat.size)
    end
  end
end
