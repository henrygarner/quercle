require 'quercle/version'
require 'quercle/predicate_set'
require 'quercle/predicate'
require 'quercle/operator'

module Quercle
  def self.parse(json_or_hash)
    json_or_hash = JSON.parse(json_or_hash) if json_or_hash.is_a?(String)
    json_or_hash['predicates'] ? PredicateSet.new(json_or_hash) : Predicate.new(json_or_hash)
  end
end
