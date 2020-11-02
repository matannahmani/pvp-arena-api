class PagesController < ApplicationController
  def home
    render json: {code: 200, msg: 'hello', user: current_user}
  end

  def islogged
    if current_user.nil?
      render json: {code: 401, msg: 'unauth'}
    else
    render json: {code: 200, msg: 'hello', user: current_user}
    end
  end
end
