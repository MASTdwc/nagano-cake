class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

    def index
      #@customers = Customer.page(params[:page])  ページネーション
      @customers = Customer.all
      @customer = Customer.find(params[:id])

    def show
      @customer = Customer.find(params[:id])
    end

    def edit
      @customer = Customer.find(params[:id])
    end

    def update
      @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
          flash[:success] = "顧客情報の更新に成功しました"
        else
          flash[:danger] = "顧客情報の更新に失敗しました"
          render"edit"
        end

    end

      private
        def customer_params
          params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:email,:postcode,:address,:phone_number,:is_customer_deleted)
        end
    end
end

