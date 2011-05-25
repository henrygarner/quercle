module Quercle
  module Operator
    class LessThan
      attr_accessor :value
      
      def initialize(value)
        @value = value
      end
      
      def sql_fragment
        "< ?"
      end
    end
  end
end
