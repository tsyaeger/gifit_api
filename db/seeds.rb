# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Gif.create([
	{ url: "https://media1.giphy.com/media/xieuDEXX78OYw/giphy.gif?cid=e1bb72ff5b721ced653062486f766c3b"},
	{ url: "https://media3.giphy.com/media/3o7bu7Xzqkq8K3MsUg/giphy.gif?cid=e1bb72ff5b6d082941355957369fe8fc"},
	{ url: "https://media3.giphy.com/media/10htoZz7rhLZ6w/giphy.gif?cid=e1bb72ff5b7c64c07437726255d57718"},
	{ url: "https://media1.giphy.com/media/y63H09ZvHJdf2/giphy.gif?cid=e1bb72ff5b847740777678366b770bf1"}
])

			

Message.create([
	{ header: 'this is a header', footer: 'footer here', sender_id: 1, receiver_id: 2, sent: false},
	{ header: 'this is a header2', footer: 'footer here', sender_id: 2, receiver_id: 2, sent: false},
	{ header: 'this is a header3', footer: 'footer here', sender_id: 2, receiver_id: 1, sent: false},
	{ header: 'this is a header4', footer: 'footer here', sender_id: 1, receiver_id: 2, sent: false},
	{ header: 'this is a header5', footer: 'footer here', sender_id: 1, receiver_id: 2, sent: false}
])



User.create([
	{ username: 'u1', email: 'u1@gmail.com', password_digest: '1234'},
	{ username: 'u2', email: 'u2@gmail.com', password_digest: '1234'},
	{ username: 'u3', email: 'u3@gmail.com', password_digest: '1234'}
])


Relationship.create([
	{ user_id: 1, contact_id: 2},
	{ user_id: 2, contact_id: 1},
	{ user_id: 2, contact_id: 2}
])