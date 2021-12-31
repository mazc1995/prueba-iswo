class CreateWorker < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
