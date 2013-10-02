
class CreateRelationshps < ActiveRecord::Migration
  def change
    create_table :relationshps do |t|
      t.integer :libraryebook_id
      t.integer :user_id
      t.string :status
      t.string :loanstart
      t.string :loanend

      t.timestamps
    end
    add_index :relationshps, [:user_id, :created_at]
  end
end
