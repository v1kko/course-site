class CreateDones < ActiveRecord::Migration
  def change
  	drop_table :dones
    create_table :dones do |t|
      t.references :user
      t.string :url

      t.timestamps
    end
    add_index :dones, :user_id
  end
end
