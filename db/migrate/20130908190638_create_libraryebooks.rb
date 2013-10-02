class CreateLibraryebooks < ActiveRecord::Migration
  def change
    create_table :libraryebooks do |t|
      t.string :name
      t.string :author
      t.string :genre
      t.string :abstract
      t.float :loanamount

      t.timestamps
    end
  end
end
