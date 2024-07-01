class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.text :comment
      t.string :status, default: 'published'

      t.index :article_id

      t.timestamps
    end
  end
end
