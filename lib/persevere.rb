#
#  Yogo Data Management Toolkit : Persevere Wrapper
#  (c) 2008-2009 Montana State University
#  Ivan R. Judson
#
# This provides a relatively simple interface to access the Persevere
# JSON data store. More information about Persevere can be found here:
# http://www.persvr.org/
#
require 'net/http'
require 'uri'

require 'rubygems'
require 'json'

class PersevereResult
  attr_reader :location, :code, :message, :body

  def PersevereResult.make(response)
    return PersevereResult.new(response["Location"], response.code,
                               response.msg, response.body)
  end

  def initialize(location, code, message, body)
    @location = location
    @code = code
    @message = message
    @body = body
  end

  def to_s
    super + " < Location: #{ @location } Code: #{ @code } Message: #{ @message } >"
  end
end

class Persevere
  VERSION = '1.0.2'
  ACCEPT = { 'Accept' => 'application/json' }

  attr_accessor :server_url, :pservr


  def initialize(url)
    @server_url = url
    server = URI.parse(@server_url)
    @persevere = Net::HTTP.new(server.host, server.port)
  end

  # Pass in a resource hash
  def create(path, resource)
    json_blob = resource.to_json
    response = @persevere.send_request('POST', path, json_blob, ACCEPT)
    return PersevereResult.make(response)
  end

  def retrieve(path)
    response = @persevere.send_request('GET', path, nil, ACCEPT)
    return PersevereResult.make(response)
  end

  def update(path, resource)
    json_blob = resource.to_json
    response = @persevere.send_request('PUT', path, json_blob, ACCEPT)
    return PersevereResult.make(response)
  end

  def delete(path)
    response = @persevere.send_request('DELETE', path, nil, ACCEPT)
    return PersevereResult.make(response)
  end
end # class Persevere
