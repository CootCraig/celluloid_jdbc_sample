require 'rubygems'
require 'bundler/setup'

require 'java'
require '../postgresql-9.3-1102.jdbc41.jar'
require 'sequel'

Sequel.extension :migration

Java::org.postgresql.Driver

DB = Sequel.connect('jdbc:postgresql://localhost/celluloid_jdb_sample?user=craig&password=banana')

Sequel::Migrator.apply(DB,'./migrate')

# craig@virt-ubu-1:/opt/gcsww.com/cvlan_logger_2/db$ jruby --debug migration_runner.rb
# Sequel::DatabaseError: Java::ComMicrosoftSqlserverJdbc::SQLServerException: Column or parameter #3: Cannot find data type UUID.
# UNIQUEIDENTIFIER
#
