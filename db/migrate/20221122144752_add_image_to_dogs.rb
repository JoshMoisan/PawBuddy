class AddImageToDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :dog_image, :string
  end
end
