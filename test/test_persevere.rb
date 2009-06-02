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
blobObj = {
  'id' => 'Blob',
  'extends' => { '$ref' => 'Object' },
  'properties' => {
    'id' => { },
    'cid' => { },
    'parent' => { },
    'data' => { }
  }
}
result = p.create('/Class/', blobObj)
print "Response:\n"
puts result.inspect

#
# Test GET to retrieve the list of classes from Persvr
#
print "\nTesting GET..."
result = p.retrieve('/Class')
print "Response:\n"
puts result.inspect

#
# Test PUT to modify an existing class
#
print "\nTesting PUT..."
blobObj['tstAttribute'] = 42
result = p.update('/Class/Blob', blobObj)
print "Response:\n"
puts result.inspect

#
# Test DELETE to remove the previously created and modified class
#
#print "\nTesting DELETE..."
#result = p.delete('/Class/Blob')
#print "Response:\n"
#puts result
