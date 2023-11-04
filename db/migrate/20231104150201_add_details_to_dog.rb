class AddDetailsToDog < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :name, :string
    add_column :dogs, :description, :text
    add_column :dogs, :location, :string
  end
end
