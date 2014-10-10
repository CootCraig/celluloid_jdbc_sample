require 'rubygems'
require 'bundler/setup'

require 'java'
require '../postgresql-9.3-1102.jdbc41.jar'
require 'sequel'

Sequel.extension :migration

Java::org.postgresql.Driver

DB = Sequel.connect('jdbc:postgresql://localhost/celluloid_jdb_sample?user=aaa&password=aaa')

Sequel::Migrator.apply(DB,'./migrate')

