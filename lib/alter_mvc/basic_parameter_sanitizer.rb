module AlterMvc
  class BasicParameterSanitizer
    include AlterMvc::ParameterSanitizers::Helper
    attr_reader :params
    def initialize(params)
      @params = params
    end
  end
end
