class CreateDones < ActiveRecord::Migration
  def change
    create_table :dones do |t|
      t.references :post
      t.references :user

      t.timestamps
    end
    add_index :dones, :post_id
    add_index :dones, :user_id
  end
end
