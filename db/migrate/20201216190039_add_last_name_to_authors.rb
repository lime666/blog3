class AddLastNameToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :last_name, :string
  end
end
