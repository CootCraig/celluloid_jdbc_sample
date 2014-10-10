celluloid_jdbc_sample
=====================

Sample of using JDBC to connect to Postgreql 9.3 using JDBC from a JRuby Celluloid actor

1. Edit the connection string in db/migration_runnner.rb and app.rb
2. bundle install
3. (cd db; jruby migration_runner.rb)
4. jruby app.rb
