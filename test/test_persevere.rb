#!/usr/bin/env ruby
#
require 'rubygems'
require 'persevere'

#
# Create an object to interact with Persevere
#
p = Persevere.new('http://localhost:8080')

#
# Test POST to create a new class
#
print "\nTesting POST..."
tstObj = { 'id' => 'tstObj', 'extends' => { '$ref' => 'Object' } }
result = p.create('/Class/', tstObj)
print "Response:\n"
puts result

#
# Test GET to retrieve the list of classes from Persvr
#
print "\nTesting GET..."
result = p.retrieve('/Class')
print "Response:\n"
puts result

#
# Test PUT to modify an existing class
#
print "\nTesting PUT..."
tstObj['tstAttribute'] = 42
result = p.update('/Class/tstObj', tstObj)
print "Response:\n"
puts result

#
# Test DELETE to remove the previously created and modified class
#
print "\nTesting DELETE..."
result = p.delete('/Class/tstObj')
print "Response:\n"
puts result
