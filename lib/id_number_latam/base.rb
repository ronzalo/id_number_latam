# frozen_string_literal: true

require "forwardable"

module IdNumberLatam
  class Base
    extend Forwardable
    def_delegators :@dni_class, :format, :unformat, :valid?

    attr_accessor :id_number, :unformatted_id_number, :country

    def initialize(id_number, opts = {})
      @id_number = id_number
      @country   = opts.delete(:country)&.to_sym
      @dni_class = get_dni_class.new(@id_number) if @country
    end

    def get_dni_class
      return unless @country

      country_dni_class = IdNumberLatam.constants.map(&:to_s).detect { |c| c == "#{@country.capitalize}Dni" }
      unless country_dni_class
        raise "class IdNumberLatam::#{@country.capitalize}Dni not implemented for #{@country} country code"
      end

      IdNumberLatam.const_get country_dni_class
    end
  end
end
