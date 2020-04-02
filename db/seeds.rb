# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Genreデータ（全8件）
Genre.create( name: '雑貨')
Genre.create( name: 'おもちゃ、ホビー')
Genre.create( name: 'CD')
Genre.create( name: '時計')
Genre.create( name: 'ゲーム')
Genre.create( name: '本')
Genre.create( name: '服飾品')
Genre.create( name: 'スポーツ用品')

# Itemのサンプルデータ（全8件）
Item.create( user_id: 1, genre_id: 5, name: '超体験型VRゲーム', introduction: 'おじいちゃんといっしょに遊びました。たのしかったです。おじいちゃんはゲームの世界から戻ってきません。', listed_price: 500, image: File.open( './app/assets/images/vr_game_motion.png', ?r ) )
Item.create( user_id: 1, genre_id: 5, name: 'あの夏のおもいで', introduction: 'おじさんの家に行ったとき遊びました。たのしかったです。おじさんは女性ファイターばかり使っていました。', listed_price: 500, image: File.open( './app/assets/images/vr_game_motion.png', ?r ) )
Item.create( user_id: 1, genre_id: 8, name: 'リンクに弧をえがいたスケート靴', introduction: 'デートに行ったときに使いました。たのしかったです。彼女はスケートがだいすきになりました。', listed_price: 100, image: File.open( './app/assets/images/sports_ice_skate_shoes.png', ?r ) )
Item.create( user_id: 1, genre_id: 4, name: '大きなのっぽの古どけい', introduction: 'おじいさんの時計です。品質は良好だと思います。', listed_price: 98000, image: File.open( './app/assets/images/ookina_noppono_furudokei.png', ?r ) )
