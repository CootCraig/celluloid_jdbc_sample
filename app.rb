require 'rubygems'
require 'bundler/setup'
require 'celluloid/autostart'

require 'java'
require './postgresql-9.3-1102.jdbc41.jar'
require 'sequel'

Java::org.postgresql.Driver

DB = Sequel.connect('jdbc:postgresql://localhost/celluloid_jdb_sample?user=aaa&password=bbb')

class Message < Sequel::Model(:messages)
end
Message.plugin :timestamps, :create=>:sequel_insert_at

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

