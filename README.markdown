# Quercle #

Turns JSON into DB fodder. Yum.

## Say what? ##

From the specs:

	Quercle.parse '{"field":"foo","operator":"contains","value":"bar"}'
	=> ['foo like ?', '%bar%']
	
The output is suitable for passing to ActiveRecord or DataMapper in conditional queries. Quercle relies on your ORM library's SQL sanitisation to escape malicious input.

### What about complex nested conditions? ###

No problemmo:

	json = {
		{ 
			:operator => "AND",
			:predicates" => [{
				:operator" => "OR",
				:predicates" => [
				{ :field => "foo",
				  :operator => "starts",
				  :value => "bar"
				},
				{ :field => "baz",
				  :operator => "gt",
				  :value => 2000
				}]
			},
			{ :field => "rex",
			  :operator => "lte",
			  :value => 10000
			}]
		}
	}
	
	Quercle.parse json
	=> [((foo like ? OR baz > ?) AND rex <= ?), '%bar%', 2000, 10000]
	
Quercle accepts either a JSON string or a hash. Field and value keys must always be provided. The default operator is 'AND' for predicate groups or 'eq' for individual expressions.

### Goodie! What operators can I use? ###


Quercle::Operator contains the following mappings:

	{
		'contains' 	=> Contains,
		'ends' 		=> EndsWith,
		'eq' 		=> Equals,
		'gt' 		=> GreaterThan,
		'lt' 		=> LessThan,
		'starts' 	=> StartsWith
	}

### Do you support field name validation / table prefixes for joins / etc? ###

Nope, sorry. If you need to perform your own validation on input data, you might find something like [json_select](https://github.com/fd/json_select) useful.

## Licence ##

Quercle is released under the MIT Licence.

Copyright © 2011 Henry Garner