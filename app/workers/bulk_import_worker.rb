class BulkImportWorker
  include Sidekiq::Worker

  def perform company_id, file_path
    Employee.import company_id, file_path
  end
end
