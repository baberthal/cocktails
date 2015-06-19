class BarsController < ApplicationController
  def index
    @bars = Bar.where(user: current_user)
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.save
    render 'show', status: 201
  end

  private
  def bar_params
    params.require(:bar).permit(:user_id, :ingredient_id)
  end
end
