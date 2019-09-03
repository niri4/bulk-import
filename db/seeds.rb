admin = Admin.find_by(email: 'admin@niri.com')
admin = Admin.create!(email: 'admin@niri.com', password: 'asdfasdf') unless admin.present?
company = Company.find_by(name: 'niri')
company = Company.create!(name: 'niri') unless company.present?
user = User.find_by(email: 'abc@niri.com')
user = User.create!(email: 'abc@niri.com', password: 'asdfasdf') unless user.present?
policy = company.policies.find_by(name: 'sick leave')
policy = company.policies.create!(name: 'sick leave') unless policy.present?
employee = company.employees.find_by(email: 'niri@niri.com')
employee = company.employees.create!(name: 'niri', phone: '12345678', email: 'niri@niri.com', policy_ids: [policy.id]) unless employee.present?
