require 'sequel_postgresql_triggers'

Sequel.migration do
  up do
    create_table :messages do
      primary_key :id
      DateTime :created_at # PG trigger insert timestamp
      DateTime :sequel_insert_at # Set by Sequel plugin timestamps
      String :message
    end
    pgt_created_at 'messages', 'created_at'
  end
  down do
    drop_table :messages
  end
end

