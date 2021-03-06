# frozen_string_literal: true

require_relative "id_number_latam/version"
require_relative "id_number_latam/base"
require_relative "id_number_latam/ar_dni"
require_relative "id_number_latam/cl_dni"
require_relative "id_number_latam/ec_dni"
require_relative "id_number_latam/pe_dni"
require_relative "id_number_latam/py_dni"
require_relative "id_number_latam/uy_dni"

module IdNumberLatam
  class Error < StandardError; end
end
