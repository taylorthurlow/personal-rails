class StaticPagesController < ApplicationController
  skip_before_action :authorize, only: [:portfolio]

  def portfolio
  end
end
