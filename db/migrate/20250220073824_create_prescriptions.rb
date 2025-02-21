class CreatePrescriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :prescriptions do |t|
      t.decimal :budget

      t.timestamps
    end
  end
end
