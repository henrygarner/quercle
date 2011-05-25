module Quercle
  module Operator
    class Equals
      attr_accessor :value
      
      def initialize(value)
        @value = value
      end
      
      def sql_fragment
        "= ?"
      end
    end
  end
end
