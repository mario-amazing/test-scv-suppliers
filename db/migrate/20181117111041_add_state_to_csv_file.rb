class AddStateToCsvFile < ActiveRecord::Migration[5.2]
  def change
    add_column :csv_files, :status, :integer, default: 0
  end
end
