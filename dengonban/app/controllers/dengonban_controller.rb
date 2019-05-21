class DengonbanController < ApplicationController
  layout 'dengonban'

  #Dengonbanが呼ばれた時の初期処理
  def initialize
    #データの読み込み
    super
    p "wwww"
    begin
      #テキストを読み込んで「parser」でJSON型式を元にrubyオブジェクトを作成する
      @dengon_data = JSON.parser(File.read("data.txt"))
    rescue
      #新たなハッシュを収める
      @dengon_data = Hash.new
    end

    @dengon_data.each do |key,obj|
        #保管しているタイムスタンプが1日よりも大きくなっでいるかの比較
      if Time.now.to_i - key.to_i > 24*60*60 then
        #大きくなっていたらdeleteで取り除く
        @dengon_data.delete(key)
      end
    end
    File.write("data.tex",@dengon_data.to_json)
  end
  def index
    if request.post? then
      #データの保存
      #MyDataインスんスタンの生成
      obj = MyDate.new(msg:params['mag'], name:params['name'] ,
                       mail:params['mail'])
      #タイムスタンプをキーとしてMyDateインスタンスを保管している
      @dengon_data[Time.new.to_i] = obj
      #to_jsonでJSON型式でテキストに取り出す
      data = @dengon_data.to_json
      #テキストに保存する
      File.write("data.txt", data)
      #JSON型式のテキストデータから元のRubyオブジェクトになおして格納する。
      @dengon_data = JSON.parser(data)
    end
    p 'zzz'
  end
end

#MyDataクラスはデータをまとめるクラス
class MyData
  #atrr_accessorゲッターとセッターを同時に定義できるもの
  attr_accessor :name
  attr_accessor :mail
  attr_accessor :mag
  #initializeコンストラクター
    def initialize msg:msg, name:name, mail:mail
      p "wwww11"
      self.name = name
      self.mail = mail
      self.mag = mag
    end
  def index

  end
  end
