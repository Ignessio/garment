class CreateGarmentTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :garment_types do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
