class AddCsvUploadToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :csv_uploads, :string
  end
end
