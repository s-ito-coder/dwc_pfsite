class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 検索機能
  @search = Item.ransack(params[:search])
  @items_result = @search.result(distinct: true)

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :first_name_kana, :last_name, :last_name_kana, :postal_code, :address, :phone_number, :email ])
    end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end