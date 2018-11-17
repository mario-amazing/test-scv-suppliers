require "csv"

class CsvFileHandler
  CSV_SPLITER = '¦'.freeze

  class << self
    def call
      CsvFile.active.each do |csv_file|
        handle_csv(csv_file)
      end
      Supplier.all
    end

    private

    def handle_csv(csv_file)
      ActiveRecord::Base.transaction do
        # Place here error handler when will be requirements
        file_path = csv_file.attachment.path
        csv_file.attachment_file_name == CsvFile::SUPPLIER_FILE ? handle_supplier(file_path) : handle_sku(file_path)
        # csv_file.processed!
      end
    end

    def handle_sku(file_path)
      CSV.foreach(file_path, headers: false) do |row|
        code, name = row.first.split(CSV_SPLITER)
        next if code.blank? || name.blank?

        Supplier.find_or_initialize_by(code: code).tap do |supplier|
          next if supplier.name == name

          supplier.name = name
          supplier.save
        end
      end
    end

    def handle_supplier(file_path)
      CSV.foreach(file_path, headers: false) do |row|
        code, name = row.first.split(CSV_SPLITER)
        next if code.blank? || name.blank?

        Supplier.find_or_initialize_by(code: code).tap do |supplier|
          next if supplier.name == name

          supplier.name = name
          supplier.save
        end
      end
    end
  end
end
