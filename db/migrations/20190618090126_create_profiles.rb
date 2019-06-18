Hanami::Model.migration do
  change do
    create_table :profiles do
      primary_key :id

      foreign_key :user_id, :users, null: false, on_delete: :cascade

      column :first_name, String,   null: false
      column :last_name, String,    null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
