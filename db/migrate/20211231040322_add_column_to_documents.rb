class AddColumnToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :procedure, null: false, foreign_key: true
  end
end
