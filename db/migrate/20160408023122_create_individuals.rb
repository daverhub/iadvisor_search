class CreateIndividuals < ActiveRecord::Migration
  def change
    create_table :individuals do |t|
      t.string :name
      t.string :employer
      t.string :IARD
      t.string :result
      t.string :CRD

      t.timestamps null: false
    end
  end
end
