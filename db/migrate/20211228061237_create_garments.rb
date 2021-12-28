class CreateGarments < ActiveRecord::Migration[6.1]
  def change
    create_table :garments do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :min_temp, null: false, limit: 2
      t.integer :max_temp, null: false, limit: 2
      t.belongs_to :garment_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
