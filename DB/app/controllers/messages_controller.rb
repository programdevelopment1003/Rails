class MessagesController < ApplicationController
  layout 'message'

  def index
    @msg = 'Message data.'
    @data = Message.all
  end

  def show
    @msg = 'Indexed data'
    @data = Message.find(params[:id])
  end

  def add
    @msg = 'Message data'
    @data = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save then
      redirect_to '/messages'
    else
      render 'add'
    end

    def edit
      @msg = "edit data"
      @message = Message.find(params[:id])
    end

    def update
      obj = Message.find(params[:id])
      obj.update(message_params)
    end

    def delete
      obj = Message.find(params[:id])
      obj.destroy
    end

    private
    def message_params
      prarams.require(:message).permit(:person_id,:title,:message)
    end
  end
end
