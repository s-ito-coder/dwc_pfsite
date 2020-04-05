# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Userデータ
User.create( first_name: %?太郎?, last_name: %?テストユーザー?, first_name_kana: %?タロウ?, last_name_kana: %?テストユーザー?, username: %?テスト用ユーザー?, postal_code: %?1234567?, address: %?東京都?, phone_number: %?09012345678?, email: %?test@mail?, password: %?password?)

# Genreデータ（全7件）
Genre.create( name: 'あたたかい')
Genre.create( name: 'せつない')
Genre.create( name: 'コメディ')
Genre.create( name: 'かわいい')
Genre.create( name: 'ホラー')
Genre.create( name: '創作')

# Itemのサンプルデータ
Item.create( user_id: 1, genre_id: 5, name: '超体験型VRゲーム', introduction: 'おじいちゃんといっしょに遊びました。たのしかったです。おじいちゃんはゲームの世界から戻ってきません。', listed_price: 500, image: File.open( './app/assets/images/vr_game_motion.png', ?r ), image2: File.open( './app/assets/images/sports_ice_skate_shoes.png', ?r ), image3: File.open( './app/assets/images/ookina_noppono_furudokei.png', ?r ) )
Item.create( user_id: 1, genre_id: 5, name: 'あの夏のおもいで', introduction: 'おじさんの家に行ったとき遊びました。たのしかったです。おじさんは女性ファイターばかり使っていました。', listed_price: 500, image: File.open( './app/assets/images/kakutou_game_polygon.png', ?r), image2: File.open( './app/assets/images/vr_game_motion.png', ?r ), image3: File.open( './app/assets/images/ookina_noppono_furudokei.png', ?r ) )
Item.create( user_id: 1, genre_id: 7, name: 'リンクに弧をえがいたスケート靴', introduction: 'デートに行ったときに使いました。たのしかったです。彼女はスケートがだいすきになりました。', listed_price: 100, image: File.open( './app/assets/images/sports_ice_skate_shoes.png', ?r), image2: File.open( './app/assets/images/kakutou_game_polygon.png', ?r ), image3: File.open( './app/assets/images/ookina_noppono_furudokei.png', ?r ) )
Item.create( user_id: 1, genre_id: 4, name: '大きなのっぽの古どけい', introduction: 'おじいさんの時計です。品質は良好だと思います。', listed_price: 98000, image: File.open( './app/assets/images/ookina_noppono_furudokei.png', ?r ), image2: File.open( './app/assets/images/vr_game_motion.png', ?r ), image3: File.open( './app/assets/images/ookina_noppono_furudokei.png', ?r ) )
