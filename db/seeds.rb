if User.all.empty?
  user = User.create email: 'admin@example.com', password: 'password', password_confirmation: 'password', name: 'Admin'
  user.update(role: 'admin')
end


Role.destroy_all
role = Role.create name: 'Community'
role.save
role = Role.create name: 'Partners'
role.save
role = Role.create name: 'Team'
role.save
role = Role.create name: 'Mentor'
role.save

community = Community.create 
community.save