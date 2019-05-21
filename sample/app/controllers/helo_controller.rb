class HeloController < ApplicationController
  def index

    #renderはを内容をレンダリングする、plain:は用意された値をテキストデータとして表示する
    #render plain: "Hello,This is Rails sample page!"
    #
    #
    # post?でPOST送信かどうかの確認
    if request.post? then
      @title = "Result"
      @msg = "you typed" + params['input1']
      @value = params['input1']
    else
      @title = "Index"
      @msg = "type text..."
      @value = ""
    end

  def other
    #redirect_toでリダイレクトを宣言する
    redirect_to action: :index, params:{'msg': 'from other page'}
  end
  end
  end
