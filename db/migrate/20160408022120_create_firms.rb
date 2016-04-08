class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :name
      t.string :status
      t.string :juristiction
      t.string :registration_status
      t.string :CRD
      t.string :result
      t.date :effective_date

      t.timestamps null: false
    end
  end
end
