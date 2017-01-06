class AddGenderToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :gender, :string
  end
end
