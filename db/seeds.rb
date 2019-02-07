# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Gif.destroy_all
# Message.destroy_all
# User.destroy_all
# Relationship.destroy_all

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
	{ username: 'u1', email: 'u1@gmail.com', password: '1234'},
	{ username: 'u2', email: 'u2@gmail.com', password: '1234'},
	{ username: 'u3', email: 'u3@gmail.com', password: '1234'}
])


Relationship.create([
	{ user_id: 1, contact_id: 2},
	{ user_id: 2, contact_id: 1},
	{ user_id: 2, contact_id: 2}
])





# srcs = ["https://media2.giphy.com/media/MPdAzI3jG7tnO/giphy.gif?cid=e1bb72ff5c514dd56e4a456b414b93a3", "https://media0.giphy.com/media/oxUyhlGW6uzKw/giphy.gif?cid=e1bb72ff5c515a0c6f6f76376be809be", "https://media0.giphy.com/media/KgT2wFxENbtp6/giphy.gif?cid=e1bb72ff5c515a0c6f6f76376be809be", "https://media1.giphy.com/media/a1CMmMoYK2cqQ/giphy.gif?cid=e1bb72ff5c515a0c6f6f76376be809be", "https://media1.giphy.com/media/anvAUf1ZzDl6w/giphy.gif?cid=e1bb72ff5c51fcbc37454677494c8060", "https://media2.giphy.com/media/FqhtS6zUCKgFy/giphy.gif?cid=e1bb72ff5c51fcbc37454677494c8060", "https://media3.giphy.com/media/c20UV66B7zCWA/giphy.gif?cid=e1bb72ff5c550c326e336a4863ad2434", "https://media1.giphy.com/media/10uGMyFVBhfy36/giphy.gif?cid=e1bb72ff5c550caa6579772f36111e6f", "https://media1.giphy.com/media/ylyUQm2pCWo5yLfFEQ/giphy.gif?cid=e1bb72ff5c550caa6579772f36111e6f", "https://media2.giphy.com/media/6CaFUOzLn0ZW9uY6PL/giphy.gif?cid=e1bb72ff5c550caa6579772f36111e6f", "https://media1.giphy.com/media/hOhIqyo8umgr6/giphy.gif?cid=e1bb72ff5c550caa6579772f36111e6f", "https://media3.giphy.com/media/4uduag3gY596g/giphy.gif?cid=e1bb72ff5c550caa6579772f36111e6f", "https://media2.giphy.com/media/l2SpWkHg83pp1dQsw/giphy.gif?cid=e1bb72ff5c550d8c38316d6a678dae76", "https://media1.giphy.com/media/5pRNFGvnqzmCc/giphy.gif?cid=e1bb72ff5c550d8c38316d6a678dae76", "https://media1.giphy.com/media/KDlRs36UyXbY4/giphy.gif?cid=e1bb72ff5c550e536965534e67fe87c4", "https://media3.giphy.com/media/CXAPW8vCQzYkg/giphy.gif?cid=e1bb72ff5c550e536965534e67fe87c4", "https://media0.giphy.com/media/l0MYDL6DUGwmhR8tO/giphy.gif?cid=e1bb72ff5c550e536965534e67fe87c4", "https://media3.giphy.com/media/l0HlCJ89672yxJC48/giphy.gif?cid=e1bb72ff5c550e536965534e67fe87c4", "https://media3.giphy.com/media/M3gmDwPbAWkbS/giphy.gif?cid=e1bb72ff5c551abc32376c644158b9ca", "https://media0.giphy.com/media/26BRED0APH6fRa1sk/giphy.gif?cid=e1bb72ff5c5752a6514d68746338a47a", "https://media3.giphy.com/media/xT0xeiyZhyIBCAtkk0/giphy.gif?cid=e1bb72ff5c5753184a65516559b735d8", "https://media3.giphy.com/media/MPdAzI3jG7tnO/giphy.gif?cid=e1bb72ff5c58a2186f42516b77165ff4", "https://media2.giphy.com/media/xTiTnJQStQJ95R5qq4/giphy.gif?cid=e1bb72ff5c58bb03535339644900245e", "https://media1.giphy.com/media/BLCHvwl9C5j1u/giphy.gif?cid=e1bb72ff5c58bb03535339644900245e", "https://media3.giphy.com/media/dHmO5JOUmo4KI/giphy.gif?cid=e1bb72ff5c58e0ae3433746632f42b34", "https://media3.giphy.com/media/VFfFnCPM5QpSo/giphy.gif?cid=e1bb72ff5c58e0ae3433746632f42b34", "https://media0.giphy.com/media/8GQflgszwLRBe/giphy.gif?cid=e1bb72ff5c58e0ae3433746632f42b34", "https://media3.giphy.com/media/3tHWsxhR49EkDfZhbl/giphy.gif?cid=e1bb72ff5c58e0ae3433746632f42b34", "https://media0.giphy.com/media/iHgznkhwC6XYs/giphy.gif?cid=e1bb72ff5c58fe366d686b753622378f", "https://media2.giphy.com/media/5Uth0oIOnfZeuMn6Q0/giphy.gif?cid=e1bb72ff5c58bb03535339644900245e", "https://media3.giphy.com/media/nqi89GMgyT3va/giphy.gif?cid=e1bb72ff5c58ff3835346a4d6b619724", "https://media2.giphy.com/media/l0HlJiVs2oAtVet0c/giphy.gif?cid=e1bb72ff5c59fe3d336c554c6bac920e", "https://media0.giphy.com/media/l0ErBz1hFbqcOhYJi/giphy.gif?cid=e1bb72ff5c59fe3d336c554c6bac920e", "https://media2.giphy.com/media/3oz8xODcLLAxb8Qyju/giphy.gif?cid=e1bb72ff5c59fe3d336c554c6bac920e"]

# gifs = []
# srcs.each do |src|
# 	gifs.push({ "url": src })
# end

# Gif.create(gifs)




