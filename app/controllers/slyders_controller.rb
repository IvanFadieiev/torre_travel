class SlydersController < ApplicationController   
  def all
    @slyders = Slyder.all
  end
end
