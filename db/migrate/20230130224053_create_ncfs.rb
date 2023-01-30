class CreateNcfs < ActiveRecord::Migration[7.0]
  def change
    create_table :ncfs do |t|
      t.string :name

      t.timestamps
    end
  end
end
