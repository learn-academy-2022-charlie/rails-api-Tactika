class ChangeAnimalStringDataType < ActiveRecord::Migration[7.0]
  def change
    change_table :sightings do |t|
      t.remove :animal
      t.column :animal_id, :integer
    end
  end
end
