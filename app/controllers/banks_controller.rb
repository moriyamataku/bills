class BanksController < ApplicationController
  before_action :set_bank, only: [:show, :edit, :update, :destroy]

  def index
    @banks = current_user.banks.all
  end

  def show
  end

  def new
    @bank = current_user.banks.build
  end

  def edit
  end

  def create
    @bank = current_user.banks.build(bank_params)

    respond_to do |format|
      if @bank.save
        format.html { redirect_to banks_url, notice: '振込先銀行を登録しました。' }
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bank.update(bank_params)
        format.html { redirect_to banks_url, notice: '振込先銀行を更新しました。' }
        format.json { render :show, status: :ok, location: @bank }
      else
        format.html { render :edit }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bank.destroy
    respond_to do |format|
      format.html { redirect_to banks_url, notice: 'Bank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_bank
    @bank = current_user.banks.find(params[:id])
  end

  def bank_params
    params.require(:bank)
      .permit(:bank_name, :branch_name, :account_type, :account_number, :account_holder, :_destroy)
  end
end
