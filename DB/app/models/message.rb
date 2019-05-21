class Message < ApplicationRecord
  #従キー側の関連付け
  belongs_to :person
  validates :name,presence:{message:'を書いてください'}
  validates :age,numericality: {message: 'は数字で入力してください'}
  validates :mail,email:{message: 'はメールアドレスではありません'}

end
