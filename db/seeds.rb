User.create!([
  {first_name: "Alessandro", last_name: "Caporrini", email: "a.caporrini@gmail.com", password:"Jud4sl0v3", encrypted_password: "$2a$10$tm3hgUr3jbkHl/h0WUZW.ur8/rovFl6x7LQwHk./gSutynS.8dmCS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 29, current_sign_in_at: "2015-07-14 18:42:25", last_sign_in_at: "2015-07-13 17:09:39", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: true, confirmation_token: nil, confirmed_at: "2015-06-19 00:00:00", confirmation_sent_at: nil},
])
Comment.create!([
  {user_id: 2, body: "ert", rating: 5, product_id: 1},
  {user_id: 2, body: "good", rating: 5, product_id: 1},
  {user_id: 2, body: "average", rating: 3, product_id: 1},
  {user_id: 2, body: "good", rating: 4, product_id: 2},
  {user_id: 2, body: "asf", rating: 3, product_id: 1},
  {user_id: 2, body: "asfaf", rating: 4, product_id: 1},
  {user_id: 2, body: "sdasg", rating: 4, product_id: 1},
  {user_id: 2, body: "sdag", rating: 4, product_id: 1},
  {user_id: 2, body: "sadg", rating: 4, product_id: 1},
  {user_id: 1, body: "average", rating: 3, product_id: 6},
  {user_id: nil, body: "aaa", rating: 2, product_id: nil},
  {user_id: 2, body: "Amazing bike", rating: 5, product_id: 1}
])
Order.create!([
  {user_id: 1, total: 109.8, paid: false},
  {user_id: 2, total: 49.9, paid: true},
  {user_id: 2, total: 59.9, paid: false},
  {user_id: 2, total: 1.999, paid: false},
  {user_id: 1, total: 109.8, paid: false}
])
Order::HABTM_Products.create!([
  {order_id: 11, product_id: 1},
  {order_id: 11, product_id: 2},
  {order_id: 12, product_id: 1},
  {order_id: 14, product_id: 2},
  {order_id: 15, product_id: 6},
  {order_id: 16, product_id: 1},
  {order_id: 16, product_id: 2}
])
Product.create!([
{name: "Fuji Absolute 2.0 LE Disc Brake Flat Bar Road Bike - 2015 Performance Exclusive", description: "Fuji Absolute 2.0 LE Disc Brake Flat Bar Road Bike - 2015 Performance Exclusive\r\n\r\nAs fun to ride as it is fast, the Fuji Absolute 2.0 LE flat bar road bike is a bike that's built to take you anywhere you want to go. The flatbar design and compact, comfort geometry keeps you in an upright position for a better field of vision and less pressure on your hands, wrists, neck and back.\r\nThe Absolute 2.0 is made from 6061 aluminum and butted for added durability. A carbon legged fork adds strength, vibration control and it features a straight rake for a short overall bike wheelbase, making the 2.0 easy to handle. A Shimano 20-speed 2x10 drivetrain supplies more than enough gearing options no matter the road grade. Shimano fat bar shifters are as easy as can be to use. A simple throw or click will increase or decrease the chain tension for your most comfortable cadence. Mechanical disc brakes provide all-weather stopping power that can take you from full speed to a full stop in no time. Finally, Oval comfort paddle grips and Vera CityWide 28c tires provide all the comfort you need during every ride.", image_url: "/images/products/31-2826-GRY-ANGLE.JPG", colour: "Red", price: "59.9"},
  {name: "Cannondale SYNAPSE ALLOY DISC Rival Adventure Roadbike 2015 - GRN", description: "<b> Even more stamina!</b> \r\nWhether you're on group rides or take the detour on the daily commute with the little bit of extra comfort, the Synapse Alloy Disc is made to enjoy kilometers. At the same time it is the first Cannondale road bike equipped with disc brakes, which provide strong braking power and perpetual control. \r\nThe Synapse Endurance Geometry meets with a slightly higher head tube, a slightly longer wheelbase and a slightly shallower steering angle, the ideal balance between pure racing upright position and comfort.\r\n240 km routes across hell? The Synapse is the ultimate partner for an unprecedented journey! \r\n\r\nThe craftsmanship that Cannondale put into their frames is unrivaled. The Optimized Alloy Frame with its true smooth welds help to create a stronger, stiffer frameset.\r\nThe so-called SAVE PLUS aluminium allows the rear by flattening and butting the chainstays and seatstays to vertical flex and absorb the bumps and vibrations of the road. At the same time a high lateral rigidity for optimal power transfer and cornering ability is maintained.\r\nThe fork with carbon blades and integrated SAVE components allow an extra comfort and precise handling. In addition, the frame provides the ability to mount fenders. \r\n\r\nCompletely new SRAM Rival 22 components guarantee smooth and durable shifting and braking performance over years. And with fenders in the frame colour the \"ride\" remains an experience even in the rain. \r\n\r\nWhy disc brakes on a road bike?\r\nNo rim wear (the wheelset will last longer)\r\nNo pres­sure changes inside the tire due to temperature change while braking\r\nSame brak­ing per­for­mance in any whether condition\r\nLess rotat­ing iner­tia (rim weight sav­ing)\r\nCan run even on a non-straight rim (i.e. spoke failure)\r\nHistory of MTB already tells the way to go...\r\n\r\n\r\nWe do not sell bikes without consultation. Please contact us!", image_url: "/images/products/95635_00_d.jpg", colour: nil, price: "1.999"}
])
Product::HABTM_Orders.create!([
  {order_id: 11, product_id: 1},
  {order_id: 11, product_id: 2},
  {order_id: 12, product_id: 1},
  {order_id: 14, product_id: 2},
  {order_id: 15, product_id: 6},
  {order_id: 16, product_id: 1},
  {order_id: 16, product_id: 2}
])
