class AddNsColToNamespaces < ActiveRecord::Migration
  def change
    add_column :namespaces, :ns, :string
  end
end
