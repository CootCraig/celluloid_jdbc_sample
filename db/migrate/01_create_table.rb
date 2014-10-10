require 'sequel_postgresql_triggers'

Sequel.migration do
  up do
    create_table :messages do
      primary_key :id
      DateTime :created_at
      String :message
    end
    pgt_created_at 'messages', 'created_at'
  end
  down do
    drop_table :messages
  end
end

