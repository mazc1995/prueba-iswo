class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :workflow_state
      t.string :code
      t.date :date
      t.integer :category
      t.references :document_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
