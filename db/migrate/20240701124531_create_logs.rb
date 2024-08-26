class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.string :event
      t.text :description

      t.datetime :created_at
    end
  end
end
