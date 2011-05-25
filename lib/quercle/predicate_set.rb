module Quercle
  class PredicateSet
    attr_accessor :operator, :predicates
    def initialize(json)
      @operator = json['operator']
      @predicates = json['predicates'].collect do |predicate_or_set|
        Quercle.parse(predicate_or_set)
      end
    end
    
    def to_a
      fragments, values = [], []
      predicates.each do |predicate_or_set|
        array = predicate_or_set.to_a
        fragments << array.shift
        values    += array
      end
      ["(#{fragments.join(" #{operator} ")})", *values]
    end
  end
end