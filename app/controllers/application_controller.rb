class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 請參考 Devise 文件自訂表單後通過 Strong Parameters 的方法
  # https://github.com/plataformatec/devise#strong-parameters
  # 注意有 sign_up 和 account_update 兩種參數要處理

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! #使用者一定要登入才能使用網站

  protected

  # Devise 客製化屬性的使用說明：  https://github.com/plataformatec/devise#strong-parameters

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
