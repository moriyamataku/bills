class SendersController < ApplicationController
  before_action :set_sender, only: [:show, :edit, :update, :destroy]

  def index
    @senders = current_user.senders.all
  end

  def show
  end

  def new
    @sender = current_user.senders.build
  end

  def edit
  end

  def create
    @sender = current_user.senders.build(sender_params)

    respond_to do |format|
      if @sender.save
        format.html { redirect_to senders_url, notice: '請求者を登録しました。' }
        format.json { render :show, status: :created, location: @sender }
      else
        format.html { render :new }
        format.json { render json: @sender.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sender.update(sender_params)
        format.html { redirect_to senders_url, notice: '請求者を更新しました。' }
        format.json { render :show, status: :ok, location: @sender }
      else
        format.html { render :edit }
        format.json { render json: @sender.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sender.destroy
    respond_to do |format|
      format.html { redirect_to senders_url, notice: 'Sender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_sender
    @sender = current_user.senders.find(params[:id])
  end

  def sender_params
    params.require(:sender)
      .permit(:name, :telephone, :email, :postal_code, :address1, :address2, :address3, :_destroy)
  end
end
