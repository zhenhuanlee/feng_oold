class Common::DebitsController < ApplicationController

  respond_to :html, :js

  def show
    @debit = current_enterprise.debit
    respond_with(@debit)
  end

  def new
    @debit = Debit.new
    respond_with(@debit)
  end


  def create
    @debit = current_enterprise.build_debit(debit_params)
    @debit.save
    respond_with(@debit)
  end

  private
    def debit_params
      params.require(:debit).permit(:bank_id, :name, :account, :deposit)
    end
end