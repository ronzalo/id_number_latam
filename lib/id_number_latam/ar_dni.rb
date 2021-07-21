module IdNumberLatam
  class ArDni < Base
    # This Class allows validating the Argentinean Number (DNI). 
    # This document does not have a verification digit.

    def initialize(id_number, opts = {})
      super
      @country = :ar
    end

    def unformat
      id_number.gsub(/\D/, "")
    end

    def format
      dni = unformat
      formatted_dni = dni.match(/(\d{2,3})(\d{3})(\d{3})/)[1..-1].join(".")
    end

    def valid?
      return false unless valid_length
    end

    def valid_length
      unformat.size == 8
    end

  end
end