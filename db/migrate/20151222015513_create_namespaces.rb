class CreateNamespaces < ActiveRecord::Migration
  def change
    create_table :namespaces do |t|
      t.string :url_key
      t.string :url_address
      t.string :status

      t.timestamps
    end
  end
end
