require 'rubygems'
require 'bundler/setup'

require 'java'
require '../postgresql-9.3-1102.jdbc41.jar'
require 'sequel'

Sequel.extension :migration

Java::org.postgresql.Driver

connection_string = File.read('../pg_connection.txt').strip
DB = Sequel.connect(connection_string)

Sequel::Migrator.apply(DB,'./migrate')

