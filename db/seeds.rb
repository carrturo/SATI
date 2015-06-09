# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.where(email: "admin@sati.hn").first
admin_user = User.create(email: "admin@sati.hn", password: "admin123") if admin_user.nil?

taqui_user = User.where(email: "taquillero@sati.hn").first
taqui_user = User.create(email: "taquillero@sati.hn", password: "taqui123") if admin_user.nil?

admin_role = Role.where(name: "admin").first
admin_role = Role.create(name: "admin") if admin_role.nil?

taquillero_role = Role.where(name: "taquillero").first
taquillero_role = Role.create(name: "taquillero") if taquillero_role.nil?

admin_user.role = admin_role
admin_user.save

taqui_user.role = admin_role
taqui_user.save

genero1 = Genero.where(nombre: "Comedia").first
genero1 = Genero.create(nombre: "Comedia", comentario: "Debe dar risa.", state: "Activo") if genero1.nil?

genero2 = Genero.where(nombre: "Tragedia").first
genero2 = Genero.create(nombre: "Tragedia", comentario: "Debe ser trágico.", state: "Activo") if genero2.nil?

funcion1 = Funcion.where(hora: DateTime.now+1.day).first
funcion1 = Funcion.create(hora: DateTime.now+1.day, comentario: "Funcion 1", state: "Activo") if funcion1.nil?

funcion2 = Funcion.where(hora: DateTime.now+2.day).first
funcion2 = Funcion.create(hora: DateTime.now+2.day, comentario: "Funcion 2", state: "Activo") if funcion2.nil?

teatro1 = Theater.where(name: "Leticia Ma Tay").first
teatro1 = Theater.create(name: "Leticia Ma Tay", address: "Unitec", capacity: 50, state: "Activo") if teatro1.nil?

teatro2 = Theater.where(name: "Manuel Bonilla").first
teatro2 = Theater.create(name: "Manuel Bonilla", address: "El Centro", capacity: 30, state: "Activo") if teatro2.nil?

destreza1 = Destreza.where(nombre: "Comediante").first
destreza1 = Destreza.create(nombre: "Comediante", comentario: "Puede hacer reir.", state: "Activo") if destreza1.nil?

destreza2 = Destreza.where(nombre: "Bailarin").first
destreza2 = Destreza.create(nombre: "Bailarin", comentario: "Puede bailar.", state: "Activo") if destreza2.nil?

tipoticket1 = TipoTicket.where(tipo: "Infante").first
tipoticket1 = TipoTicket.create(tipo: "Infante", precio: 120.5, comentario: "Para niños.", state: "Activo") if tipoticket1.nil?

tipoticket2 = TipoTicket.where(tipo: "Adulto").first
tipoticket2 = TipoTicket.create(tipo: "Adulto", precio: 150.5, comentario: "Para adultos.", state: "Activo") if tipoticket2.nil?

cla1 = Clasificacion.where(nombre: "PG13").first
cla1 = Clasificacion.create(nombre: "PG13", edadMin: 13, edadMax: 30, comentario: "Mayores de 13 años.", state: "Activo") if cla1.nil?

cla2 = Clasificacion.where(nombre: "M21").first
cla2 = Clasificacion.create(nombre: "M21", edadMin: 21, edadMax: 90, comentario: "Mayores de 21 años.", state: "Activo") if cla2.nil?

InfoGeneral.create(nombre: 'Art Memola', direccion: 'Plaza Millenium', telefono: '+504 5555-5555', email: 'artmemola@live.com', fb: 'https://www.facebook.com/pages/Art-Memola/150168175180299', tw: 'https://www.twitter.com/artmemola', youtube: 'https://www.youtube.com/channel/UCVHH9rtk3-08-UOLY79r2cQ', ig: 'https://www.instagram.com/artmemola/') if InfoGeneral.count <= 0