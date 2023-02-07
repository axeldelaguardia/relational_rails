class CreateDogGroomer < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_groomers do |t|
      t.string :name
      t.boolean :master_groomer
      t.string :salon
      t.integer :rating
			
			t.timestamps
    end
  end
end
