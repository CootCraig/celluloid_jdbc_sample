celluloid_jdbc_sample
=====================

Sample of using JDBC to connect to Postgreql 9.3 using JDBC from a JRuby Celluloid actor

1. cp pg_connection_template.txt pg_connection.txt  
2. Edit the connection string in pg_connection.txt
3. bundle install
4. (cd db; jruby migration_runner.rb)
5. jruby app.rb
