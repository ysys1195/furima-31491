class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :postal_code,      null: false
      t.string :prefecture_id,    null: false
      t.string :city,             null: false
      t.string :address,          null: false
      t.string :building
      t.string :phone_number,     null: false
      t.references :purchase_log, null: false, foreign_key: true
      t.timestamps
    end
  end
end
