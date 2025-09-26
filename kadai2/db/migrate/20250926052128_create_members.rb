class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.string :name
      t.float :height
      t.float :weight

      t.timestamps
    end
  end
end
