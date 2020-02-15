class ApplicationController < ActionController::Base
  #before_action :basic_auth
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name_kanji, :first_name_kanji, :last_name_kana, :first_name_kana, :birthday, :tel, :profile])
  end

  private

  #以下のコードいつの間にかあったけどよくわからないのでコメントアウトしちゃいます（by大庭）
  #def basic_auth
    #authenticate_or_request_with_http_basic do |username, password|
      #username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    #end
  #end
end
