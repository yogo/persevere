= ruby persevere client

* http://github.com/irjudson/persevere

== DESCRIPTION:

This gem provides a simple ruby wrapper around the persevere JSON document data store available from http://www.persvr.org.

== FEATURES/PROBLEMS:

Currently this provides a very simple RESTful interface to persevere. Data to be stored in persevere should be sent as hashes. To make this more robust it should provide some schema/table support, plus validate data against the schema/table. This exists in persevere, but is not exposed by this wrapper.

== SYNOPSIS:

#!/usr/bin/env ruby
#
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

== REQUIREMENTS:

* Persevere installed somewhere
* JSON gem

== INSTALL:

sudo gem install persevere

== LICENSE:

(The MIT License)

Copyright (c) 2009 Montana State University

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
