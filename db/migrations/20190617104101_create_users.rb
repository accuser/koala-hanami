Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :email,      String,   null: false, unique: true
      column :password,   String,   null: false
      column :token,      String,   null: false, unique: true, length: 36
      
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
