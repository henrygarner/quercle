module Quercle
  class Predicate
    attr_reader :field, :operation
    def initialize(json)
      @field = json['field']
      @operation = Operator.get(json['operator'], json['value'])
    end
    
    def to_a
      ["#{field} #{operation.sql_fragment}", operation.value]
    end
  end
end
