# frozen_string_literal: true

require_relative "id_number_latam/version"
require_relative "id_number_latam/base"
require_relative "id_number_latam/cl_dni"

module IdNumberLatam
  class Error < StandardError; end
end
