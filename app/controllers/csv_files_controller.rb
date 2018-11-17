class CsvFilesController < ApplicationController
  def index
    @csv_file = CsvFile.new
  end

  def create
    @csv_file = CsvFile.new(csv_file_params)

    respond_to do |format|
      if @csv_file.save
        flash[:notice] = 'Csv file was successfully created.'
        format.html { redirect_to action: :index }
      else
        format.html { render :index }
      end
    end
  end

  private
    def csv_file_params
      params.fetch(:csv_file, {}).permit(:attachment)
    end
end
