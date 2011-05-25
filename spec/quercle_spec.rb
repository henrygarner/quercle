require 'spec_helper'

describe 'quercle' do
  specify 'should parse a single predicate' do
    json = '{"field":"foo","operator":"contains","value":"bar"}'
    parsed = Quercle.parse json
    parsed.to_a.first.should == 'foo like ?'
    parsed.to_a.last.should == '%bar%'
  end
  
  specify 'should parse a simple compound predicate' do
    json = %q{{"operator":"AND","predicates":[{"field":"foo","operator":"contains","value":"bar"},{"field":"baz","operator":"gt","value":2000}]}}
    parsed = Quercle.parse json
    parsed.to_a.first.should == "(foo like ? AND baz > ?)"
  end
  
  specify 'should parse a complex compound predicate' do
    json = %q{{"operator":"AND","predicates":[{"operator":"OR","predicates":[{"field":"foo","operator":"starts","value":"bar"},{"field":"baz","operator":"gt","value":2000}]},{"field":"rex","operator":"lt","value":10000}]}}
    parsed = Quercle.parse json
    parsed.to_a.first.should == '((foo like ? OR baz > ?) AND rex < ?)'
  end
end
