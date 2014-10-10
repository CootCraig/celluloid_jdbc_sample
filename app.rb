require 'rubygems'
require 'bundler/setup'
require 'celluloid/autostart'

require 'java'
require './postgresql-9.3-1102.jdbc41.jar'
require 'sequel'

Java::org.postgresql.Driver

connection_string = File.read('./pg_connection.txt').strip
DB = Sequel.connect(connection_string)

class Message < Sequel::Model
end

class MessageWriter
  include Celluloid

  def initialize
    puts "MessageWriter.initialize"
    every (5) { async.write_message }
  end
  def write_message
    msg = "write_message at #{Time.new.to_s}"
    puts msg
    Message.insert( :message => msg )
  end
end

MessageWriter.new
puts "After MessageWriter.new"
sleep

