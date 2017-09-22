class AddComplementToMeasure < ActiveRecord::Migration[5.0]
  def change
    add_column :measures, :complement, :string
    add_column :measures, :quantity, :integer
  end
end
