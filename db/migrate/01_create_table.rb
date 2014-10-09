
Sequel.migration do
  up do
    create_table :messages do
      primary_key :id
      DateTime :created_at
      String :message
    end
  end

  down do
    drop_table :messages
  end
end

