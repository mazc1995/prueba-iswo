class CreateDocumentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :document_types do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
