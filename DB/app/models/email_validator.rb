#自分でバリデーションルールを作る
# クラス名Validator< ActiveModel::EachValidatorで定義する
class EmailValidator < ActiveModel::EachValidator
  def  validate_each(record,attribute,value)
    #正規表現
    unless value = ~/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      #ecord.errors[attribute]という場所にエラーメッセージ追加する
      record.errors[attribute] << (options[:message] ||
      "is not an email")
    end

  end
end