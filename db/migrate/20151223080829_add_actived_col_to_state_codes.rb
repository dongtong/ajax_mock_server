class AddActivedColToStateCodes < ActiveRecord::Migration
  def change
    add_column :state_codes, :actived, :boolean, :default => false
  end
end
