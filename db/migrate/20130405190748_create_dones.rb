class CreateDones < ActiveRecord::Migration
  def change
    drop_table :dones
    create_table :dones do |t|
      t.references :page
      t.references :user

      t.timestamps
    end
    add_index :dones, :page_id
    add_index :dones, :user_id
  end
end
