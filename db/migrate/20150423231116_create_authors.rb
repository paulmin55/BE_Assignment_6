class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :fname
      t.string :lname

      t.timestamps null: false
    end
  end
end
