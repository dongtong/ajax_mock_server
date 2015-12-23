class CreateStateCodes < ActiveRecord::Migration
  def change
    create_table :state_codes do |t|
      t.string :code_num
      t.string :code_des
      t.integer :namespace_id
      t.timestamps
    end
  end
end
