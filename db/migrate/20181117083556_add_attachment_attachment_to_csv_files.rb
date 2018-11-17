class AddAttachmentAttachmentToCsvFiles < ActiveRecord::Migration[5.2]
  def self.up
    change_table :csv_files do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :csv_files, :attachment
  end
end
