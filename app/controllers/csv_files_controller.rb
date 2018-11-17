class CsvFilesController < ApplicationController
  before_action :set_csv_file, only: [:show, :edit, :update, :destroy]

  def index
    @csv_file = CsvFile.new
  end

  def create
    @csv_file = CsvFile.new(csv_file_params)

    respond_to do |format|
      if @csv_file.save
        format.html { redirect_to action: :index, notice: 'Csv file was successfully created.' }
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
