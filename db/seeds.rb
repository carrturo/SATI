# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.where(email: "admin@sati.hn").first
admin_user = User.create(email: "admin@sati.hn", password: "admin123") if admin_user.nil?

admin_role = Role.where(name: "admin").first
admin_role = Role.create(name: "admin") if admin_role.nil?

taquillero_role = Role.where(name: "taquillero").first
taquillero_role = Role.create(name: "taquillero") if taquillero_role.nil?

admin_user.role = admin_role
admin_user.save

InfoGeneral.create(nombre: 'Art Memola', direccion: 'Plaza Millenium', telefono: '+504 5555-5555', email: 'artmemola@live.com', fb: 'https://www.facebook.com/pages/Art-Memola/150168175180299', tw: 'https://www.twitter.com/artmemola', youtube: 'https://www.youtube.com/channel/UCVHH9rtk3-08-UOLY79r2cQ', ig: 'https://www.instagram.com/artmemola/') if InfoGeneral.count <= 0