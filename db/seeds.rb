admin = Admin.find_or_create_by(first_name: 'admin', last_name: 'admin', email: 'admin@localhost.ru')
admin.password = '87654321'
admin.save

60.times do |i|
  u = [Manager, Developer].sample.new
  u.email = "email#{i}@mail.gen"
  u.first_name = "FN#{i}"
  u.last_name = "LN#{i}"
  u.password = i.to_s
  u.save
end