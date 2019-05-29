class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :ingredients
      t.text :steps
      t.string :type
      t.text :images

      t.timestamps
    end
  end
end
