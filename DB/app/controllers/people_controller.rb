class PeopleController < ApplicationController
  layout'people'

  def index
    p "これが呼ばれる"
    @mag = 'Person data.'
    #.allですべての値を取ってくる
    @data = Person.all
  end

  def show
    @mag = 'Indexed data.'
    #データの検査
    @data = Person.where(params[:id])
  end
  def add
    @mag = 'Indexed data.'
    p "sdassasasdadads"
    #モデルのインスタンスを指定
    @person =Person.new
  end

  def create
    p "ddd"
    if request.post? then
      #パーミッションチェックの値の格納
      @person = Person.new(person_params)
      #バリデーションして問題なく済んだらDBに保存
      if @person.save then
        #rerson_parmamsの戻り値が設定されている
        #Person.create(person_params)
        redirect_to '/people'
      else
        render 'add'
      end
    end
  end

  def edit
    @mag = "endit"
    #モデルのインスタンス
    @person =Person.find(params[:id])
  end

  def updata
    p "hfdisjaifoiawj"
    p
    #変更したいデータを探す
    obj = Person.find(params[:id])
    #更新
    obj.update(person_params)
    redirect_to '/people'
  end

  def delte
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to '/people'
  end

  def find
    #配列のインスタンスを生成(複数の検索結果が返ってくるため)
    @array = Array.new
    #post通信かどうかを確認
    if request.post? then
       f = params[:find].split","
      #値の検索と条件の指定（条件指定する場合配列は2次元配列になっている）
      # likeは曖昧検索、
      # orderは並び替え,limitはいくつ取り出すかの指定,offfsetは何番から取り出すかの指定
      obj = Person.where("age>=? and mail like ?" ,f[0],'%' + f[1] + '%' ).order 'age asc'
      #2次元配列を1次元配列変換して格納
      obj.each do |a|
        #fiirstは最初のデータのみ格納
        # lastは最後のデータのみ格納
        @array.push(a)
      end
    end
  end

  #privateより下に書いたらすべて内部だけで利用するとなる
  private
def person_params
  p"eeee"
  #params.requierはparamsの中にある指定の値が存在しているかチェックしている
  params.require(:person).permit(:name,:age,:mail)
end
 end
