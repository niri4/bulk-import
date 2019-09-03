class Admin::EmployeesController < ApplicationController
  before_action :authenticate_user!

  def new
    @companies =  Company.all
  end

  def create
    if file_type_check? && company.present?
      file = company.csv_uploads.attach(params[:bulk_import][:file])
      file_path = Employee.file_locate file.first
      if ENV['RAILS_ENV'] == 'production'
        import_notify = BulkImportWorker.perform_async company.id, file_path
        redirect_to new_admin_employee_path, notice: "successfully imported employees"
      else
        import_notify = BulkImportWorker.new.perform company.id, file_path
        redirect_to new_admin_employee_path, notice: "successfully imported employees imported: #{import_notify[:imported]} and not imported #{import_notify[:not_imported]}"
      end
    else
      redirect_to new_admin_employee_path, alert: 'File type or company is invalid'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def company
      @company =  Company.find(params[:bulk_import][:company])
    end

    def file_type_check?
      params[:bulk_import][:file].content_type == 'text/csv'
    end
end
