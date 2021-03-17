class CreatePersonnages < ActiveRecord::Migration[6.1]
  def change
    create_table :personnages do |t|
      t.string :Nom
      t.integer :Points_de_vie
      t.integer :Points_attaque
      t.timestamps
    end
  end
end
