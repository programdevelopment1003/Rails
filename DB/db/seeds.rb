# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ダミーデータを用意する（用意した後rails db:seed）
Person.create(name:'Taro',age:36,mail:'taro@yamada')
Person.create(name:'Hanko',age:34,mail:'hankp@yamada')
Person.create(name:'Sachiki',age:56,mail:'sachiki@yamada')
