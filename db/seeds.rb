FactoryBot.create_list(:user,4)
User.find_or_create(name:'admin', email: 'admin@admin', admin: true )