class Person < ApplicationRecord
  #1対1の関連ずける(主キー側の設定)
  #has_one :message
  # 1対多のカレンズける（主キー側の設定）
  has_many :messages
  #必須項目
  validates :name,presence: {message: 'は必須項目'}
  #数字入力
  validates :age,numericality: {message: 'は数字で入力してください'}
  #メールアドレスチェック（自作）
  validates :mail,email: {message:'はメールアドレスではありません'}

  #上記以外のバリデーションの種類
  # length：テキスの長さ
  # uniqueness : 同じ値が存在しないかの確認
  #
end
