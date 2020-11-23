# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

data = CSV.parse(File.read("./storage/gwyfofficialpars.csv", mode: 'r:bom|utf-8'), headers: true)
data.each do |row|
    Course.create(
        name: row["name"],
        cover_img: "images/#{row["name"].include?(" ") ? row["name"].downcase.sub(" ", "_") : row["name"].downcase}.jpg",
        hole_1: row[1],
        hole_2: row[2],
        hole_3: row[3],
        hole_4: row[4],
        hole_5: row[5],
        hole_6: row[6],
        hole_7: row[7],
        hole_8: row[8],
        hole_9: row[9],
        hole_10: row[10],
        hole_11: row[11],
        hole_12: row[12],
        hole_13: row[13],
        hole_14: row[14],
        hole_15: row[15],
        hole_16: row[16],
        hole_17: row[17],
        hole_18: row[18]
    )
end

user1 = User.create(email: 'admullan@gmail.com', username: 'All Purple Everything', steam_id: 76561197964983146, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/97/97259427a00d50a8b17c6b8182881d9df47e45cb_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end

user1 = User.create(email: 'admullan@gmail.com', username: 'Stinkmeyer', steam_id: 76561197982415562, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/25/25b644b4ac1a5fce01d1308fcf4eb28ee5e6449e_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end

user1 = User.create(email: 'admullan@gmail.com', username: 'Dr 1337', steam_id: 76561198038490113, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/03/032e292748feca1e2f671c0151dd86be69b08f0f_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end

user1 = User.create(email: 'admullan@gmail.com', username: 'Suni', steam_id: 76561198048354274, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/9f/9f2f4454936850903bdab3f98090d22ad021fb6d_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end

user1 = User.create(email: 'admullan@gmail.com', username: 'Ericericerice', steam_id: 76561198059116169, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/a6/a65eac35de3ade4f2915c42ab494d22eb08a5aef_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end

user1 = User.create(email: 'admullan@gmail.com', username: 'Hvarsighted', steam_id: 76561197968501451, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/fa/fa973b2bd5fd68d7636549c1f6b2f105c274fc90_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end

user1 = User.create(email: 'admullan@gmail.com', username: 'knives', steam_id: 76561198053838495, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/a5/a5c8af65f5f08d4ef8a89c6cca28e914ac0de406_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end

user1 = User.create(email: 'admullan@gmail.com', username: 'darlek', steam_id: 76561198074766076, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/ee/ee6a863399de108890f2f5fc6f17cd258e2f70fb_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end

user1 = User.create(email: 'admullan@gmail.com', username: 'TechnoPizza', steam_id: 76561198044024478, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/ec/ec7cd0f00914829e256475830d62826173351c48_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end

user1 = User.create(email: 'admullan@gmail.com', username: 'Dayman', steam_id: 76561198024159467, avatar: 'https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/1c/1c93fa218e0ec787dbded7ae51c17967c46811cf_full.jpg', password: 'asdfjkl', password_confirmation: 'asdfjkl')

for i in 0..40
    match = Match.create(course_id: rand(12) + 1)
    Round.create(match_id: match.id, user_id: user1.id, course_id: match.course_id, hole_1: rand(7) + 1, hole_2: rand(7) + 1, hole_3: rand(7) + 1, hole_4: rand(7) + 1, hole_5: rand(7) + 1, hole_6: rand(7) + 1, hole_7: rand(7) + 1, hole_8: rand(7) + 1, hole_9: rand(7) + 1, hole_10: rand(7) + 1, hole_11: rand(7) + 1, hole_12: rand(7) + 1, hole_13: rand(7) + 1, hole_14: rand(7) + 1, hole_15: rand(7) + 1, hole_16: rand(7) + 1, hole_17: rand(7) + 1, hole_18: rand(7) + 1)
end