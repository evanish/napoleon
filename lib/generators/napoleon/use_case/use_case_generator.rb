require 'generators/napoleon'

module Napoleon
  module Generators
    class UseCaseGenerator < Base
      def add_use_case
        template "use_case.rb", File.join('app/use_cases/', "#{file_name.singularize}_use_case.rb")
      end
    end
  end
end
