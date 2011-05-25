require 'quercle/operator/contains'
require 'quercle/operator/ends_with'
require 'quercle/operator/equals'
require 'quercle/operator/greater_than'
require 'quercle/operator/less_than'
require 'quercle/operator/starts_with'

module Quercle
  module Operator 
    OPERATORS = {
      'contains' => Contains,
      'ends' => EndsWith,
      'eq' => Equals,
      'gt' => GreaterThan,
      'lt' => LessThan,
      'starts' => StartsWith
    }
    
    def self.get(key, value)
      OPERATORS[key].new value
    end
    
  end
end
