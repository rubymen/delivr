namespace :db do
  desc 'Populate database'
  task populate: :environment do
    Rake::Task['db:reset'].invoke

    admin = Admin.create!( password:               'adminadmin',
                           password_confirmation:  'adminadmin',
                           email:                  'admin@rubymen.com',
                           created_at:             Date.today - rand(1..20).days)

    delivery_manager = DeliveryManager.create!( password:               'adminadmin',
                                                password_confirmation:  'adminadmin',
                                                email:                  'manager@rubymen.com',
                                                created_at:             Date.today - rand(1..20).days)

    member = Member.create!( password:               'adminadmin',
                             password_confirmation:  'adminadmin',
                             email:                  'member@rubymen.com',
                             created_at:             Date.today - rand(1..20).days)

    category1 = Category.create!(name: 'En cours')
    category2 = Category.create!(name: 'Validée')

    type1 = Type.create!(name: 'Maintenance',
                         color: '#e67e22')

    type2 = Type.create!(name: 'Évolution',
                         color: '#3498db')

    order1 = Order.create!(type: type1,
                           category: category1,
                           begin_date: Date.today - rand(1..20).days,
                           end_date: Date.today + rand(1..20).days,
                           user: admin,
                           created_at: Date.today - rand(1..20).days)

    order2 = Order.create!(type: type1,
                           category: category2,
                           begin_date: Date.today - rand(1..20).days,
                           end_date: Date.today + rand(1..20).days,
                           user: admin,
                           created_at: Date.today - rand(1..20).days)

    order3 = Order.create!(type: type2,
                           category: category1,
                           begin_date: Date.today - rand(1..20).days,
                           end_date: Date.today + rand(1..20).days,
                           user: delivery_manager,
                           created_at: Date.today - rand(1..20).days)

    order4 = Order.create!(type: type2,
                           category: category2,
                           begin_date: Date.today - rand(1..20).days,
                           end_date: Date.today + rand(1..20).days,
                           user: delivery_manager,
                           created_at: Date.today - rand(1..20).days)

    order_permission = Permission.create!(model: 'Order',
                                          manager_create: true,
                                          manager_read: true,
                                          manager_update: true,
                                          manager_delete: true,
                                          member_create: true,
                                          member_read: true,
                                          member_update: true,
                                          member_delete: true)

    type_permission = Permission.create!(model: 'Type',
                                          manager_create: true,
                                          manager_read: true,
                                          manager_update: false,
                                          manager_delete: false,
                                          member_create: false,
                                          member_read: true,
                                          member_update: false,
                                          member_delete: false)

    category_permission = Permission.create!(model: 'Category',
                                          manager_create: true,
                                          manager_read: true,
                                          manager_update: true,
                                          manager_delete: true,
                                          member_create: false,
                                          member_read: true,
                                          member_update: false,
                                          member_delete: false)

    user_permission = Permission.create!(model: 'User',
                                          manager_create: false,
                                          manager_read: false,
                                          manager_update: false,
                                          manager_delete: false,
                                          member_create: false,
                                          member_read: false,
                                          member_update: false,
                                          member_delete: false)
  end
end
