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
        csv_file.processed!
      end
    end

    def handle_sku(file_path)
      CSV.foreach(file_path, headers: false) do |row|
        sku, supplier_code, name, additional1, additional2, additional3, additional4, additional5, price = row.first.split(CSV_SPLITER)
        next unless [sku, supplier_code, name, price].all?(&:present?)
        next unless Supplier.exists?(code: supplier_code)

        Sku.find_or_initialize_by(sku: sku).tap do |supplier|
          supplier.supplier_code = supplier_code
          supplier.name = name
          supplier.additional1 = additional1
          supplier.additional2 = additional2
          supplier.additional3 = additional3
          supplier.additional4 = additional4
          supplier.additional5 = additional5
          supplier.price = price

          supplier.save
        end
      end
    end

    def handle_supplier(file_path)
      CSV.foreach(file_path, headers: false) do |row|
        code, name = row.first.split(CSV_SPLITER)
        next unless [code, name].all?(&:present?)

        Supplier.find_or_initialize_by(code: code).tap do |supplier|
          next if supplier.name == name

          supplier.name = name
          supplier.save
        end
      end
    end
  end
end
