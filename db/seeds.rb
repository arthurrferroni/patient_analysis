# Clear existing data to prevent duplication
User.destroy_all
Company.destroy_all
Patient.destroy_all
Report.destroy_all

# Create Companies
company1 = Company.create!(name: 'Empresa A', address: 'Endereço A')
company2 = Company.create!(name: 'Empresa B', address: 'Endereço B')

# Create Users
User.create!(email: 'admin@empresaA.com', password: 'password', company: company1)
User.create!(email: 'admin@empresaB.com', password: 'password', company: company2)

# Create Patients for Companies
company1.patients.create!(name: 'Paciente 1')
company1.patients.create!(name: 'Paciente 2')
company2.patients.create!(name: 'Paciente 3')
company2.patients.create!(name: 'Paciente 4')

puts "Seeding completed successfully."
