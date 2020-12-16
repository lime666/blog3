class AddGenderToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :gender, :boolean
  end
end
