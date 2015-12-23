class AddResColToNamespaces < ActiveRecord::Migration
  def change
    add_column :namespaces, :res, :text
  end
end
