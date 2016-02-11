# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  # Admin User
  u = User.create(email: 'prakash.chaudhary@bacancytechnology.com',password: '12345678',admin: true)
  # Normal User
  u1 = User.create(email: 'chaudharyprakash1@bacancytechnology.com',password: '12345678',admin: false)
  # Article 
  Article.create(name: 'java Paper', published: 'java', author: 'balaguru',description: 'java Information')
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')