class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
			t.references :dog_groomer, foreign_key: true
      t.string :name
      t.integer :age
      t.string :breed
      t.integer :weight

			t.timestamps
    end
  end
end