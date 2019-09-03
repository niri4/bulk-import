class Employee < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :policies

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  acts_as_nested_set

  def self.import company_id, file_path
    company = Company.find(company_id)
    notification = Hash.new
    notification[:imported] = 0
    notification[:not_imported] =0
    CSV.foreach(file_path, headers: true) do |row|
      if add_employee row, company
        notification[:imported] = notification[:imported] + 1
      else
        notification[:not_imported] = notification[:not_imported] + 1
      end
    end
    notification
  end

  def self.add_employee detail, company
    parent = company.employees.find_or_create_by(email: detail['Report To']) if  detail['Report To']
    employee = company.employees.find_by(email: detail['Email'])
    policy_ids = Array.new
    detail['Assigned Policies'].split('|').each do |policy|
      policy_ids << company.policies.find_or_create_by(name: policy).id
    end if detail['Assigned Policies'].present?
    if employee.present?
      employee.name = detail['Employee Name']
      employee.phone = detail['Phone']
      employee.parent = parent
      employee.policy_ids = policy_ids
      if employee.save
        return true
      end
    else
      employee = company.employees.new(email: detail['Email'], name: detail['Employee Name'], phone: detail['Phone'], parent: parent)
      employee.policy_ids = policy_ids
      if employee.save
        return true
      else
        return false
      end
    end
  end

  def self.file_locate file
    active_storage_disk_service = ActiveStorage::Service::DiskService.new(root: Rails.root.to_s + "/#{STORAGE_DEFAULT_PATH}/")
    file_path = active_storage_disk_service.send(:path_for, file.blob.key)
    file_path
  end

end
