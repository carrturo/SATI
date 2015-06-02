class HomeController < ApplicationController
  def index
    @navbar = true;
    @news= News.all
  end
end
