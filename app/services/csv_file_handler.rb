require "csv"

class CsvFileHandler
  CSV_SPLITER = '¦'.freeze
  class << self
    def call
      CsvFile.all.each do |csv_file|
        parse_csv(csv_file)
      end
    end

    private

    def parse_csv(csv_file)
      ActiveRecord::Base.transaction do
        CSV.foreach(csv_file.attachment.path, headers: false) do |row|
          code, name = row.split(CSV_SPLITER)
        end
      end
    end
  end
end
