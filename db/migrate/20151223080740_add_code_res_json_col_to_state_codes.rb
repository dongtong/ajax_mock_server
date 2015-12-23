class AddCodeResJsonColToStateCodes < ActiveRecord::Migration
  def change
    add_column :state_codes, :code_res_json, :text
  end
end
