class CsvFile < ApplicationRecord
  has_attached_file :attachment, attachment_presence: true
  validates_attachment :attachment,
    content_type: { content_type: 'text/plain' },
    file_name: { matches: [/sku.csv/, /suppliers.csv/] }
end
