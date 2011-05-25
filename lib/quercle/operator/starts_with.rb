module Quercle
  module Operator
    class StartsWith
      attr_accessor :value
      
      def initialize(value)
        @value = "#{value}%"
      end
      
      def sql_fragment
        "like ?"
      end
    end
  end
end
